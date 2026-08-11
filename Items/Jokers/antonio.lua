local antonio = {
    object_type = "Joker",
    order = 10004,

    key = "antonio",
    config = {
        extra = {
            mult_mod = 1
        }
    },
    attributes = { 'modify_card', 'perma_bonus', 'mult' },
    rarity = 4,
    unlock_condition = { hidden = true },
    pos = { x = 7, y = 14},
    atlas = 'legendary_atlas',
    cost = 20,
    unlocked = false,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    soul_pos = { x = 7, y = 15},

    loc_vars = function(self, info_queue, card)
        return { 
            vars = {
                card.ability.extra.mult_mod
            }
        }
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            for k, v in pairs(G.playing_cards) do
                if v:get_id() == context.other_card:get_id() then
                    v.ability.perma_mult = v.ability.perma_mult or 0
                    v.ability.perma_mult = v.ability.perma_mult + card.ability.extra.mult_mod
                end
            end
            return {
                extra = { message = localize('k_upgrade_ex'), colour = G.C.MULT },
                card = card
            }
        end
    end
}
return { name = {"Jokers"}, items = {antonio} }