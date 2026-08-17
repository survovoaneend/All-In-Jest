local beelzebub = {
    object_type = "Joker",
    order = 500,
    key = "beelzebub",
    
    config = {
        extra = {
            mult = 0,
            gain = 3
        }
    },
    attributes = { 'mult', 'scaling' },
    rarity = 1,
    pos = { x = 22, y = 23 },
    atlas = 'joker_atlas',
    cost = 4,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,

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
            SMODS.scale_card(card, {
                ref_table = card.ability.extra,
                ref_value = "mult",
                scalar_value = "gain",
                message_colour = G.C.MULT,
                operation = function(ref_table, ref_value, initial, scaling)
                    ref_table[ref_value] = initial + scaling*#context.cards
                end
            })
            return nil, true
        end
        if context.joker_main then
            return {
                mult = card.ability.extra.mult
            }
        end
    end
}

return { name = { "Jokers" }, items = { beelzebub } }
