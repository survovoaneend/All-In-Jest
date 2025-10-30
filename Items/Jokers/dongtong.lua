-- Can apply dongtong_compat to a joker to make it not affected by Dongtong, Silver, and similar future effects


-- Calculates the number of dongtongs, saves how many dongtongs were owned last time this was called,
-- then doubles/halves card values accordingly
local dong_tong_double = function (card)
    if card.ability.set == 'Joker' and (card.config.center.dongtong_compat == nil or card.config.center.dongtong_compat) then
        card.ability.jest_applied = card.ability.jest_applied or {}

        local current_count = #SMODS.find_card("j_aij_dongtong")

        local prev_count = card.ability.jest_applied["j_aij_dongtong"] or 0
        local diff = current_count - prev_count

        if diff > 0 then
            for i = 1, diff do
                jest_ability_calculate(
                card,
                "*", 2,
                { x_chips = 1, x_mult = 1, extra_value = true, rarity },
                nil, true, "ability.extra"
                )
            end
        elseif diff < 0 then
            for i = 1, -diff do
                jest_ability_calculate(
                card,
                "/", 2,
                { x_chips = 1, x_mult = 1, extra_value = true, rarity },
                nil, true, "ability.extra"
                )
            end
        end

        card.ability.jest_applied["j_aij_dongtong"] = current_count
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
    dongtong_compat = false, -- Makes it so dongtong doesn't activate its own add_to_deck and remove_from_deck
    soul_pos = { x = 6, y = 11},

    -- Using add_to_deck and remove_from_deck for jokers that apply their effect only during this points and not passively
    -- See: juggler, credit card, etc.
    add_to_deck = function(self, card, from_debuff)
        for _, area in ipairs(SMODS.get_card_areas('jokers')) do
            if area.cards then
                for _, v in pairs(area.cards) do
                    if v and type(v) == 'table' and v.ability.set == "Joker" and (v.config.center.dongtong_compat == nil or v.config.center.dongtong_compat) then
                        if v.added_to_deck then
                            v.added_to_deck = false
                            v:add_to_deck(v, true)
                        end
                    end
                end
            end
        end
	end,
	remove_from_deck = function(self, card, from_debuff)
        -- Using an event here so that it calculates after the dongtong double is removed
        G.E_MANAGER:add_event(Event({
            func = function ()
                for _, area in ipairs(SMODS.get_card_areas('jokers')) do
                    if area.cards then
                        for _, v in pairs(area.cards) do
                            if v and type(v) == 'table' and v.ability.set == "Joker" and (v.config.center.dongtong_compat == nil or v.config.center.dongtong_compat) then
                                if v.added_to_deck then
                                    dong_tong_double(v) -- Required for debuffs to work
                                    v:remove_from_deck(v, true)
                                    v.added_to_deck = true
                                end
                            end
                        end
                    end
                end
                return true
            end
        }))
	end,
  
    loc_vars = function(self, info_queue, card)
  
    end,
}

-- Doubles card values before effects that happen when obtained occur
-- (E.g., without this Juggler would only give +1 hand size even with Dongtong owned)
local aij_card_add_to_deck = Card.add_to_deck
function Card:add_to_deck(from_debuff)
    if not self.added_to_deck and (self.config.center.dongtong_compat == nil or self.config.center.dongtong_compat) then
        dong_tong_double(self)
    end
    return aij_card_add_to_deck(self, from_debuff)
end

-- Have to check dongtong count every tick
local updateref = Card.update 
function Card:update(dt)
  local ref = updateref(self, dt)
  if G.jokers and self.ability.set == 'Joker' and (self.config.center.dongtong_compat == nil or self.config.center.dongtong_compat) then
    dong_tong_double(self)
  end
  return ref
end

return { name = {"Jokers"}, items = {dongtong} }