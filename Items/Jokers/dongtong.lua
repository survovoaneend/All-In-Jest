-- Can apply dongtong_compat to a joker to make it not affected by Dongtong, Silver, and similar future effects

-- Set Oops! to be incompatible, otherwise dongtong will double probabilities where it really shouldn't
G.P_CENTERS["j_oops"].dongtong_compat = false

-- Set Burnt Joker to be incompatible, since it has unused internal values that make it look compatible
G.P_CENTERS["j_burnt"].dongtong_compat = false

local function contains_number(table, exclusions)
    for k, v in pairs(table) do
        if exclusions and exclusions[k] ~= nil and (exclusions[k] == true or exclusions[k] == v) then
        else
            if type(v) == "number" and v ~= 0 then
                return true
            elseif type(v) == "table" then
                return contains_number(v)
            end
        end
    end
    return false
end

local contains = function (tbl, item)
    for k, v in pairs(tbl) do
        if v == item then
            return true
        end
    end
    return false
end

-- Calculates the number of dongtongs, saves how many dongtongs were owned last time this was called,
-- then doubles/halves card values accordingly
local dong_tong_double = function (card, mod_count)
    if card.ability.set == 'Joker' and (card.config.center.dongtong_compat == nil or card.config.center.dongtong_compat) then
        mod_count = mod_count or 0
        card.ability.jest_applied = card.ability.jest_applied or {}

        local current_count = #SMODS.find_card("j_aij_dongtong") + mod_count

        local prev_count = card.ability.jest_applied["j_aij_dongtong"] or 0
        local diff = current_count - prev_count

        card.ability.jest_applied["j_aij_dongtong"] = current_count

        if diff > 0 then
            card:remove_from_deck(true)
            for _ = 1, math.abs(diff) do
                jest_ability_calculate(
                card,
                "*", 2,
                { x_chips = 1, x_mult = 1, extra_value = true, rarity = true, card_limit=true },
                nil, false, nil, "ability"
                )
            end
            card:add_to_deck(true)
        elseif diff < 0 then
            card:remove_from_deck(true)
            for _ = 1, math.abs(diff) do
                jest_ability_calculate(
                card,
                "/", 2,
                { x_chips = 1, x_mult = 1, extra_value = true, rarity = true, card_limit=true },
                nil, false, nil, "ability"
                )
            end
            card:add_to_deck(true)
        end
    end
end

local dongtong = {
    object_type = "Joker",
    order = 1057,

    key = "dongtong",
    config = {
      
    },
    rarity = 4,
    pos = { x = 6, y = 10},
    atlas = 'legendary_atlas',
    cost = 20,
    unlocked = false,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,
    dongtong_compat = false, -- Makes it so dongtong doesn't activate its own effects
    soul_pos = { x = 6, y = 11},
  
    loc_vars = function(self, info_queue, card)
  
    end,
}

-- For these, use "includes(SMODS.get_card_areas('jokers'), self.area)" to stop jokers in off-screen areas (like for Visage) from influencing things

-- Doubles card values before effects that happen when obtained occur
-- (E.g., without this Juggler would only give +1 hand size even with Dongtong owned)
local aij_card_add_to_deck = Card.add_to_deck
function Card:add_to_deck(from_debuff)
    if not self.added_to_deck and G.jokers and (self.config.center.dongtong_compat == nil or self.config.center.dongtong_compat) and contains_number(self.config.center.config, { x_chips = 1, x_mult = 1, extra_value = true, rarity = true, card_limit=true }) and (self.area == nil or contains(SMODS.get_card_areas('jokers'), self.area)) then
        dong_tong_double(self)
    end
    return aij_card_add_to_deck(self, from_debuff)
end

-- Have to check dongtong count every tick
local updateref = Card.update
function Card:update(dt)
  local ref = updateref(self, dt)
  if G.jokers and self.ability.set == 'Joker' and (self.config.center.dongtong_compat == nil or self.config.center.dongtong_compat) and contains_number(self.config.center.config, { x_chips = 1, x_mult = 1, extra_value = true, rarity = true, card_limit=true }) and contains(SMODS.get_card_areas('jokers'), self.area) then
    dong_tong_double(self)
  end
  return ref
end

-- Setting a new ability will set base values without triggering dongtong's multiplication
-- We set prevmult to 1 to trigger the Card:update() routine
local aij_card_set_ability_ref = Card.set_ability
function Card:set_ability(center, initial, delay_sprites)
    local was_added_to_deck = self.added_to_deck and self.config.center and not self.debuff
    local ret = aij_card_set_ability_ref(self, center, initial, delay_sprites)

    if was_added_to_deck and self.ability and self.ability.jest_applied and self.ability.jest_applied.j_aij_dongtong and self.ability.set == "Joker" and contains(SMODS.get_card_areas('jokers'), self.area) then
        self.ability.jest_applied["j_aij_dongtong"] = 0
    end

    return ret
end

return { name = {"Jokers"}, items = {dongtong} }