local goblin_joker = {
    object_type = "Joker",
    order = 93,

    key = "goblin_joker",
    config = {
      extra = {
          draw_extra = 2,
      }
    },
    rarity = 3,
    pos = { x = 13, y = 3 },
    atlas = 'joker_atlas',
    cost = 8,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.draw_extra,
            }
        }
    end,
  
    calculate = function(self, card, context)
      if context.pre_discard then
        G.E_MANAGER:add_event(Event({
            blocking = false,
            func = function()
                if G.STATE == G.STATES.SELECTING_HAND then
                    SMODS.draw_cards(card.ability.extra.draw_extra)
                    return true
                end
            end
        }))
      end
    end
  
}
return { name = {"Jokers"}, items = {goblin_joker} }
