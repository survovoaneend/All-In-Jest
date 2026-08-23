local atemporal_taco = {
    object_type = "Joker",
    order = 981,

    key = "atemporal_taco",
    config = {
        extra = {
            odds = 6,
            ante_mod = 1
        }
    },
    attributes = {'food', 'ante', 'chance'},
    rarity = 3,
    pos = { x = 5, y = 45},
    atlas = 'joker_atlas',
    cost = 8,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = false,

    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'atemporal_taco')
        return {
            vars = {
                numerator,
                denominator,
                card.ability.extra.ante_mod
            }
        }
    end,

    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
            if SMODS.pseudorandom_probability(card, 'atemporal_taco', 1, card.ability.extra.odds) then
                SMODS.destroy_cards(card, nil, nil, true)
                return {
                     message = localize('k_eaten_ex'),
                }
            else
                return {
                    message = localize('k_safe_ex')
                }
            end
        end
        if context.joker_type_destroyed then
            local this_card = card
            if context.card == this_card then
                G.E_MANAGER:add_event(Event({
                    func = function()
                        ease_ante(-card.ability.extra.ante_mod)
                        return true
                    end
                }))
                return nil, true
            end
        end
    end
}
return { name = {"Jokers"}, items = {atemporal_taco} }