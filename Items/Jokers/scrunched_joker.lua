local scrunched_joker = {
    object_type = "Joker",
    order = 499,
    key = "scrunched_joker",
    
    config = {
        extra = {
            chips_big = 60,
            mult_big = 8,
            chips_small = 15,
            mult_small = 2
        }
    },
    rarity = 1,
    pos = { x = 11, y = 24 },
    atlas = 'joker_atlas',
    cost = 4,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.chips_big,
                card.ability.extra.mult_big,
                card.ability.extra.chips_small,
                card.ability.extra.mult_small
            }
        }
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            if (G.GAME.current_round.hands_left == 0 or G.GAME.current_round.hands_played == 0) then 
               return {
                chips = card.ability.extra.chips_big,
                mult = card.ability.extra.mult_big
               }
            else
               return {
                chips = card.ability.extra.chips_small,
                mult = card.ability.extra.mult_small
               }
            end
        end 
    end
}

return { name = { "Jokers" }, items = { scrunched_joker } }
