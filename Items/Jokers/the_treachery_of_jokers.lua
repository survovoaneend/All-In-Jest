local the_treachery_of_jokers = {
    object_type = "Joker",
    order = 390,
    key = "the_treachery_of_jokers",
    config = {
        extra = {
            xmult = 2
        }
    },
    rarity = 2,
    pos = { x = 7, y = 16 },
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.xmult
            }
        }
    end,

    calculate = function(self, card, context)
         if context.joker_main then
              return {
                  xmult = card.ability.extra.xmult
              }
         end
    end
}

return { name = { "Jokers" }, items = { the_treachery_of_jokers } }
