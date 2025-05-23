local birthday_clown = {
    object_type = "Joker",
    order = 3,

    key = "birthday_clown",
    config = {
      extra = {
        xmult = 2,
        active = true
      }
    },
    rarity = 1,
    pos = { x = 2, y = 0 },
    atlas = 'joker_atlas',
    cost = 4,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
      local active_text = "Active!"
      if not card.ability.extra.active then 
        active_text = "Inactive"
      end
      return {
        vars = {
          card.ability.extra.xmult,
          active_text
        }
      }
    end,
  
    calculate = function(self, card, context)
      if context.end_of_round then
        if G.GAME.blind.boss then
          card.ability.extra.active = true
        else
          card.ability.extra.active = false
        end
      end
      if card.ability.extra.active and context.joker_main then
        return {
          xmult = card.ability.extra.xmult
        }
      end
    end
  
}
return { name = {"Jokers"}, items = {birthday_clown} }
