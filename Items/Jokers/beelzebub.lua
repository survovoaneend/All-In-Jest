local beelzebub = {
    object_type = "Joker",
    order = 481,
    key = "beelzebub",
    
    config = {
        extra = {
            mult = 0,
            gain = 3
        }
    },
    rarity = 1,
    pos = { x = 22, y = 23 },
    atlas = 'joker_atlas',
    cost = 4,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = false,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
               card.ability.extra.gain,
               card.ability.extra.mult
            }
        }
    end,

    calculate = function(self, card, context)
        if context.playing_card_added and not context.blueprint then
             card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.gain
             return {
                 message = localize('k_upgrade_ex'),
                 colour = G.C.MULT
             }
        end
        if context.joker_main then
            return {
                mult = card.ability.extra.mult
            }
        end
    end
}

return { name = { "Jokers" }, items = { beelzebub } }
