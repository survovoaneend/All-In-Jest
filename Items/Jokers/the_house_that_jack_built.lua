local the_house_that_jack_built = {
    object_type = "Joker",
    order = 355,

    key = "the_house_that_jack_built",
    config = {
    },
    rarity = 1,
    pos = { x = 1, y = 14 },
    atlas = 'joker_atlas',
    cost = 4,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = false,

    loc_vars = function(self, info_queue, card)

    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            local level = to_number(G.GAME.hands['Full House'].level) 
            if context.other_card:get_id() == 11 then
                return {
                    mult = level,
                    chips = level,
                    card = card
                }
            end
        end
    end

}
return { name = { "Jokers" }, items = { the_house_that_jack_built } }
