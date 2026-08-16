local queen_bee = {
    object_type = "Joker",
    order = 912,

    key = "queen_bee",
    config = {
        extra = {
            xmult_mod = 0.1
        }
    },
    attributes = {'six', 'xmult', 'queen', 'rank'},
    rarity = 2,
    pos = { x = 8, y = 42},
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,

    loc_vars = function(self, info_queue, card)
        local sixes = 0
        if G.hand and G.hand.cards then
            for _, held_card in ipairs(G.hand.cards) do
                if held_card:get_id() == 6 and not held_card.debuff then
                    sixes = sixes + 1
                end
            end
        end

        local current_xmult = 1 + (sixes * card.ability.extra.xmult_mod)
        return { 
            vars = {
                card.ability.extra.xmult_mod,
                current_xmult
            } 
        }
    end,

    calculate = function(self, card, context)
         if context.individual and context.cardarea == G.play and context.other_card:get_id() == 12 then
            local sixes = 0
            if G.hand and G.hand.cards then
                for _, held_card in ipairs(G.hand.cards) do
                    if held_card:get_id() == 6 and not held_card.debuff then
                        sixes= sixes + 1
                    end
                end
            end

            local total = 1 + (sixes * card.ability.extra.xmult_mod)
            if total > 1 then
                return {
                    x_mult = total,
                    card = card
                }
            end
        end
    end
}
return { name = {"Jokers"}, items = {queen_bee} }