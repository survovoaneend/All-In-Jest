local dog_treat = {
    object_type = "Joker",
    order = 946,
    
    key = "dog_treat",
    config = {
        extra = {
            dollars = 20
        }
    },
    attributes = {'food', 'economy'},
    rarity = 1,
    pos = { x = 20, y = 43},
    atlas = 'joker_atlas',
    cost = 5,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = false,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.dollars
            }
         }
    end,

    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval then
            if G.GAME.current_round.hands_played == 1 then
                if not context.blueprint then
                    SMODS.destroy_cards(card, nil, nil, true)
                end
                return {
                    dollars = card.ability.extra.dollars,
                    message = localize('k_eaten_ex')
                }
            end
        end
    end
}
return { name = {"Jokers"}, items = {dog_treat} }