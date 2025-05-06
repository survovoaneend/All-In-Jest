local mistigri = {
    object_type = "Joker",
    order = 145,

    key = "mistigri",
    config = {

    },
    rarity = 3,
    pos = { x = 14, y = 5 },
    atlas = 'joker_atlas',
    cost = 8,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,

    loc_vars = function(self, info_queue, card)

    end,

    calculate = function(self, card, context)

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

        local jacks_in_hand = 0
        for _, v in ipairs(G.hand.cards) do
            if v.base and v.base.value == 'Jack' then
                jacks_in_hand = jacks_in_hand + 1
            end
        end

        local required_bonus = math.floor(jacks_in_hand/2)
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
    end
}
return { name = {"Jokers"}, items = {mistigri} }
