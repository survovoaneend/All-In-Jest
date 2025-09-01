local colquhoun = {
    object_type = "Joker",
    order = 1019,


    key = "colquhoun",
    config = {
        extra = {
            dollars = 1,
            dollar_mod = 1
        }
    },
    rarity = 4,
    unlock_condition = { hidden = true },
    pos = { x = 8, y = 2 },
    atlas = 'legendary_atlas',
    cost = 4,
    unlocked = false,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    soul_pos = { x = 8, y = 3 },

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.dollars,
                card.ability.extra.dollar_mod
            }
        }
    end,

    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval and context.beat_boss then
            SMODS.scale_card(card, {
                ref_table = card.ability.extra,
                ref_value = "dollars",
                scalar_value = "dollar_mod",
                operation = '+',
            })
        end
        if context.individual and context.cardarea == G.play then
            G.GAME.dollar_buffer = (G.GAME.dollar_buffer or 0) + card.ability.extra.dollars
            return {
                dollars = card.ability.extra.dollars,
                func = function()
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            G.GAME.dollar_buffer = 0
                            return true
                        end
                    }))
                end
            }
        end
    end

}
return { name = { "Jokers" }, items = { colquhoun } }
