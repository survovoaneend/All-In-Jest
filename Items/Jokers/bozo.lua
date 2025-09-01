local bozo = {
    object_type = "Joker",
    order = 1065,

    key = "bozo",
    config = {
        extra = {
            jokers = 2
        }
    },
    rarity = 4,
    pos = { x = 0, y = 12 },
    atlas = 'legendary_atlas',
    cost = 20,
    unlocked = false,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,
    soul_pos = { x = 0, y = 13 },

    loc_vars = function(self, info_queue, card)

    end,

    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval and context.beat_boss then
            for i = 1, card.ability.extra.jokers do
                SMODS.add_card { set = "Joker", edition = 'e_negative' }
            end
            return {
                message = "+2 Jokers"
            }
        end
    end,
}
return { name = { "Jokers" }, items = { bozo } }
