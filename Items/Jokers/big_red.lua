local big_red = {
    object_type = "Joker",
    order = 130,

    key = "big_red",
    config = {
      extra = {
          mult = 40,
      }
    },
    rarity = 3,
    pos = { x = 24, y = 4 },
    atlas = 'joker_atlas',
    cost = 8,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.mult,
            }
        }
    end,
  
    calculate = function(self, card, context)
        if context.joker_main then
            return {
                mult = card.ability.extra.mult
            }
        end
    end,
}

local has_attribute = function(center, attribute)
    if not SMODS.Attributes[attribute] or not center.attributes then return false end
    if center.attributes[attribute] then return true end
    for _, att in ipairs(SMODS.Attributes[attribute].alias or {}) do
        if center.attributes[att] then return true end
    end
    return false
end

local is_mult_joker = function(center)
    if has_attribute(center, "mult") then
        return true
    elseif center.mod ~= nil then -- Check descriptions for modded jokers, as vanilla has attributes set
        local key = center.key
        local text = retrieve_joker_text(center, true)
        if text == "" then
            -- Add exceptions for BAD_DATA
            if key == "j_aij_baddata" then
                return true
            end
        else
            local text_has_mult = text:find('Mult') or text:find('mult')
            return text_has_mult
        end
    end
end
local is_chips_joker = function(center)
    if has_attribute(center, "chips") then
        return true
    elseif center.mod ~= nil then -- Check descriptions for modded jokers, as vanilla has attributes set
        local key = center.key
        local text = retrieve_joker_text(center, true)
        if text == "" then
            -- Add exceptions for BAD_DATA
            if key == "j_aij_baddata" then
                return true
            end
        else
            local text_has_chips = text:find('Chips') or text:find('chips')
            return text_has_chips
        end
    end
end

local smods_add_to_pool_ref = SMODS.add_to_pool
function SMODS.add_to_pool(prototype_obj, ...)
    if #SMODS.find_card("j_aij_big_red") > 0 and #SMODS.find_card("j_aij_little_boy_blue") > 0 and not (is_mult_joker(prototype_obj) or is_chips_joker(prototype_obj)) then
        return false
    elseif #SMODS.find_card("j_aij_big_red") > 0 and not (is_mult_joker(prototype_obj) and not is_chips_joker(prototype_obj)) then
        return false
    elseif #SMODS.find_card("j_aij_little_boy_blue") > 0 and not (is_chips_joker(prototype_obj) and not is_mult_joker(prototype_obj)) then
        return false
    else
        return smods_add_to_pool_ref(prototype_obj, ...)
    end
end

return { name = {"Jokers"}, items = {big_red} }


