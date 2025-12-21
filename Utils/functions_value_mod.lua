local function round_int(x)
  return x >= 0 and math.floor(x + 0.5) or math.ceil(x - 0.5)
end

local function round_hundredth(x)
  if x >= 0 then
    return math.floor(x * 100 + 0.5) / 100
  else
    return math.ceil(x * 100 - 0.5) / 100
  end
end

local operators = {
  ["+"] = function(a, b) return a + b end,
  ["-"] = function(a, b) return a - b end,
  ["*"] = function(a, b) return a * b end,
  ["/"] = function(a, b) return a / b end,
  ["%"] = function(a, b) return a % b end,
  ["="] = function(a, b) return b end,
  ["nil"] = function(a, b) return a end,
}

local function process_value(val, base_val, equation, extra_value, do_round)
  if type(val) == "number" then
    if base_val == nil then
        base_val = val
    end
    local delta = val - base_val
    local result = operators[equation](base_val, extra_value) + delta
    if do_round then
      if base_val % 1 ~= 0 then
        return round_hundredth(result)
      else
        return round_int(result)
      end
    else
      return result
    end
  else
    return val
  end
end

local function should_process(key, value, exclusions, inclusions)
  if type(key) ~= "string" then return true end
  if inclusions and next(inclusions) then
    local valid = false
    for _, prefix in ipairs(inclusions) do
      if (not only and key:sub(1, #prefix) == prefix) or (only and key == prefix) then
        valid = true; break
      end
    end
    if not valid then return false end
  end
  if exclusions and exclusions[key] ~= nil then
    if exclusions[key] == true or value == exclusions[key] then
      return false
    end
  end
  return true
end

local function process_table(t, base_table, equation, extra_value, do_round, exclusions, inclusions)
  for key, value in pairs(t) do
    if value ~= nil and should_process(key, value, exclusions, inclusions) then
      if type(value) == "number" then
        t[key] = process_value(value, base_table[key] or 0, equation, extra_value, do_round)
      elseif type(value) == "table" and type(base_table[key]) == "table" then
        process_table(value, base_table[key], equation, extra_value, do_round, exclusions, inclusions)
      end
    end
  end
end

function nested_tables(card, index)
    local current = card
    for key in string.gmatch(index, "[^%.]+") do
        if type(current) ~= "table" then
            return current
        else
            current = current[key]
        end
    end
    return current
end

function save_value(card, index, value)
    local current = card
    keys = {}
    for key in string.gmatch(index, "[^%.]+") do
        table.insert(keys,  key)
    end
    for i, key in ipairs(keys) do
        if i == #keys then
            current[key] = value
        else
            current = current[key]
        end
    end
    return current
end

local jest_ability_get_items = function(card, equation, extra_value, exclusions, inclusions, do_round, only, extra_search)
  if do_round == nil then do_round = true end
  if only == nil then only = false end

  local keys = {}
  local values = {}

  local search_table = extra_search and nested_tables(card, extra_search) or card.ability

  if search_table then
    if type(search_table) == "number" then
      table.insert(keys, extra_search or "ability")
      table.insert(values, process_value(search_table, nil, equation, extra_value, do_round))
    elseif type(search_table) == "table" then
      for key, value in pairs(search_table) do
        if value ~= nil and should_process(key, value, exclusions, inclusions) then
          table.insert(keys, key)
          table.insert(values, process_value(value, nil, equation, extra_value, do_round))
        end
      end
    end
  end

  return keys, values
end

jest_ability_calculate = function(card, equation, extra_value, exclusions, inclusions, do_round, only, extra_search)
  if do_round == nil then do_round = true end
  if only == nil then only = false end

  -- Some default exclusions, easier than just setting it for every use of the function
  -- Use this for utility variables that track/store stuff, not for variables that are just usually not modified
  -- E.g. "extra_value" is often set to prevent sell value from being modified, but we might want an effect
  -- in the future that modifies that on purpose
  exclusions = exclusions or {}
  exclusions.has_been_rerolled_data = true -- Used for Stage Production
  exclusions.jest_applied = true -- Used by Dongtong

  -- Store original values before modification
  local keys, original_values = jest_ability_get_items(card, "nil", 0, exclusions, inclusions, do_round, only, extra_search)

  local search_table = extra_search and nested_tables(card, extra_search) or card.ability

  if search_table then
    local _, base_values = jest_ability_get_items(card, "nil", 0, exclusions, inclusions, do_round, only, extra_search)
    if type(search_table) == "number" then
      search_table = process_value(search_table, base_values[1] or 0, equation, extra_value, do_round)
      save_value(card, extra_search, search_table)
    elseif type(search_table) == "table" then
      local base_map = {}
      for i, k in ipairs(keys) do base_map[k] = original_values[i] end
      process_table(search_table, base_map, equation, extra_value, do_round, exclusions, inclusions)
    end
  end
end