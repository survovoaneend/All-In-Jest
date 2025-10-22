local birthday_clown = {
    object_type = "Joker",
    order = 3,

    key = "birthday_clown",
    config = {
      extra = {
        xmult = 3,
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
      local active_text = "("..localize('k_active')..")"
      if not card.ability.extra.active then 
        active_text = "("..localize('k_inactive')..")"
      end
      return {
        vars = {
          card.ability.extra.xmult,
          active_text
        }
      }
    end,
  
    calculate = function(self, card, context)
      if context.ante_change and context.ante_change ~= 0 and context.ante_end then
          card.ability.extra.active = true
      end
      if card.ability.extra.active and context.joker_main then
        return {
          xmult = card.ability.extra.xmult
        }
      end
      if card.ability.extra.active and context.end_of_round and context.main_eval then
        card.ability.extra.active = false
      end
    end
  
}
return { name = {"Jokers"}, items = {birthday_clown} }
