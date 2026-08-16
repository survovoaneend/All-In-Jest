local the_hare = {
    object_type = "Joker",
    order = 966,

    key = "the_hare",
    config = {
        extra = {
            score = 200
        }
    },
    attributes = { 'score' },
    rarity = 1,
    pos = { x = 15, y = 44},
    atlas = 'joker_atlas',
    cost = 4,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.score
            }
        }
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            return {
                score = card.ability.extra.score
            }
        end
    end
}
return { name = {"Jokers"}, items = {the_hare} }