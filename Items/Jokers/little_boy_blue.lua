local little_boy_blue = {
    object_type = "Joker",
    order = 129,

    key = "little_boy_blue",
    config = {
      extra = {
          chips = 100,
      }
    },
    rarity = 1,
    pos = { x = 23, y = 4 },
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.chips,
            }
        }
    end,
  
    calculate = function(self, card, context)
        if context.joker_main then
            return {
                chips = card.ability.extra.chips
            }
        end
    end,
}

-- Hooks in big_red.lua

return { name = {"Jokers"}, items = {little_boy_blue} }