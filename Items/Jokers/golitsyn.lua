local golitsyn = {
    object_type = "Joker",
    order = 1044,
    ignore = true,
    key = "golitsyn",
    config = {
      
    },
    rarity = 4,
	unlock_condition = {hidden = true},
    pos = { x = 3, y = 8},
    atlas = 'legendary_atlas',
    cost = 4,
    unlocked = false,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,
    enhancement_gate = 'm_aij_ice',
    soul_pos = { x = 3, y = 9},
  
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.m_aij_charged
    end,

    update = function(self, card, dt)

        if not card.area or card.area ~= G.jokers then
            return
        end
        if not (G.GAME and G.hand and G.jokers and G.hand.cards) then
            return
        end
        if card.debuff then
            if card.ability.current_bonus_applied and card.ability.current_bonus_applied > 0 then
                G.hand:change_size(-card.ability.current_bonus_applied)
                card.ability.current_bonus_applied = 0
            end
            return
        end
        card.ability.current_bonus_applied = card.ability.current_bonus_applied or 0
        local ice_in_hand = 0
        for i = 1, #G.hand.cards do
            local _card = G.hand.cards[i]
            if _card then
            if SMODS.has_enhancement(_card, "m_aij_ice") then
                ice_in_hand = ice_in_hand + 1
            end
        end
        end
        local required_bonus = ice_in_hand
        local bonus_difference = required_bonus - card.ability.current_bonus_applied
        if bonus_difference ~= 0 then
            if G.hand then
                G.hand:change_size(bonus_difference)
            end
            card.ability.current_bonus_applied = required_bonus
        end
    end,
    remove_from_deck = function(self, card, from_debuff)
        if card.ability.current_bonus_applied and card.ability.current_bonus_applied > 0 then
            if G.hand then
                G.hand:change_size(-card.ability.current_bonus_applied)
            end
            card.ability.current_bonus_applied = 0
        end
    end,
  
    calculate = function(self, card, context)
      
    end
  
}
local shuffleref = CardArea.shuffle
function CardArea:shuffle(_seed)
    local ref = shuffleref(self, _seed)

    local has_golitsyn = next(SMODS.find_card("j_aij_golitsyn"))
    if has_golitsyn then
        
        local ice_cards = {}

        for i = #self.cards, 1, -1 do
            local card = self.cards[i]
            if card.config.center == G.P_CENTERS["m_aij_ice"] then
                table.insert(ice_cards, card)
                table.remove(self.cards, i)
            end
        end

        for _, card in ipairs(ice_cards) do
            table.insert(self.cards,  #self.cards + 1, card) 
        end
    end

    return ref
end
return { name = {"Jokers"}, items = {golitsyn} }
