local emergent_pattern = {
    object_type = "Joker",
    order = 951,

    key = "emergent_pattern",
    config = {
        extra = {
            cards = 3
        }
    },
    attributes = {'retrigger'},
    rarity = 1,
    pos = { x = 0, y = 44},
    atlas = 'joker_atlas',
    cost = 4,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,

    loc_vars = function(self, info_queue, card)
        return { 
            vars = {
                card.ability.extra.cards
            }
        }
    end,

    calculate = function(self, card, context)
         if context.repetition and context.cardarea == G.play and #context.full_hand == card.ability.extra.cards then
            return {
                repetitions = 1
            }
        end
    end
}
return { name = {"Jokers"}, items = {emergent_pattern} }