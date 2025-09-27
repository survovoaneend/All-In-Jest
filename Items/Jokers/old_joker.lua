local old_joker = {
    object_type = "Joker",
    order = 21,

    all_in_jest = {
        only_shop_pool = true,
        only_booster_pool = true
    },
    key = "old_joker",
    config = {
        extra = {
            chips = 0,
            chips_mod = 35,
            mult = 0,
            mult_mod = 6
        }
    },
    rarity = 1,
    pos = { x = 19, y = 0 },
    atlas = 'joker_atlas',
    cost = 4,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.chips,
                card.ability.extra.chips_mod,
                card.ability.extra.mult,
                card.ability.extra.mult_mod
            }
        }
    end,

    set_ability = function(self, card, initial)
        card:set_eternal(true)
    end,

    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval and context.beat_boss and not context.blueprint then
            SMODS.scale_card(card, {
                ref_table = card.ability.extra, 
                ref_value = "chips", 
                scalar_value = "chips_mod", 
            })
            SMODS.scale_card(card, {
                ref_table = card.ability.extra, 
                ref_value = "mult", 
                scalar_value = "mult_mod", 
                no_message = true,
            })
        end
        if context.joker_main then
            return {
                chips = card.ability.extra.chips,
                mult = card.ability.extra.mult,
            }
        end
    end

}
return { name = { "Jokers" }, items = { old_joker } }
