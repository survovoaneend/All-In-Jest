local dicky = {
    object_type = "Joker",
    order = 1070,
    key = "dicky",
    config = {
       extra = {
        perma_mult = 0.1
       }
    },
    rarity = 4,
    pos = { x = 7, y = 12 },
    atlas = 'legendary_atlas',
    cost = 20,
    unlocked = false,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    soul_pos = { x = 7, y = 13 },

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.perma_mult
            }
        }
    end,

    calculate = function(self, card, context)
        if context.end_of_round and context.main_eval then
            for _, v in ipairs(G.deck.cards) do
                v.ability.perma_x_mult = v.ability.perma_x_mult or 0
                v.ability.perma_x_mult = v.ability.perma_x_mult + card.ability.extra.perma_mult
            end
            return {
                message = localize('k_upgrade_ex'),
                colour = G.C.MULT
            }
        end
    end,
}
return { name = { "Jokers" }, items = { dicky } }