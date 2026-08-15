local triple_gooberberry_sunrise = {
    object_type = "Joker",
    order = 863,

    key = "triple_gooberberry_sunrise",
    config = {
        extra = {
            odds_mod = 2,
            antes_remaining = 3
        }
    },
    attributes = {'passive', 'mod_chance', 'food'},
    rarity = 2,
    pos = { x = 10, y = 40},
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = false,

    loc_vars = function(self, info_queue, card)
        return { 
            vars = {
                card.ability.extra.odds_mod,
                card.ability.extra.antes_remaining
            }
         }
    end,

    calculate = function(self, card, context)
        if context.mod_probability and not context.blueprint then
            return {
                numerator = context.numerator + card.ability.extra.odds_mod
            }
        end

        -- Decrement after defeating each Boss Blind (each Ante), then consume when expired
        if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint and context.beat_boss then
            if card.ability.extra.antes_remaining - 1 <= 0 then
                SMODS.destroy_cards(card, nil, nil, true)
                return {
                    message = localize('k_eaten_ex'),
                    colour = G.C.FILTER
                }
            else
                card.ability.extra.antes_remaining = card.ability.extra.antes_remaining - 1
                return {
                    message = card.ability.extra.antes_remaining .. '',
                    colour = G.C.FILTER
                }
            end
        end
    end
}
return { name = {"Jokers"}, items = {triple_gooberberry_sunrise} }