local average_joe = {
    object_type = "Joker",
    order = 150,
    ignore = true,
    key = "average_joe",
    config = {
      extra = {
        percent = 20
      }
    },
    rarity = 2,
    pos = { x = 19, y = 5 },
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = false,
  
    loc_vars = function(self, info_queue, card)
      return {
        vars = {
          card.ability.extra.percent
        }
      }
    end,
  
    calculate = function(self, card, context)
      if context.joker_main then
        balance_percent(card,(card.ability.extra.percent*0.01))
      end
    end
  
}
return { name = {"Jokers"}, items = {average_joe} }
