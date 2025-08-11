local arlecchino = {
  object_type = "Joker",
  order = 162,

  key = "arlecchino",
  config = {
    
  },
  rarity = 2,
  pos = { x = 6, y = 6},
  atlas = 'joker_atlas',
  cost = 6,
  unlocked = true,
  discovered = false,
  blueprint_compat = false,
  eternal_compat = true,

  loc_vars = function(self, info_queue, card)

  end,

  calculate = function(self, card, context)
      if context.open_booster then
          if (context.card.config.center.kind == "Standard" or context.card.config.center.kind == "Buffoon") and G.GAME.jest_change_booster_options.pack_choices ~= "unlimited" then
              G.GAME.jest_change_booster_options.pack_choices = "unlimited"
              G.E_MANAGER:add_event(Event({
                  func = function()
                      G.GAME.jest_change_booster_options.pack_choices = 0
                      return true
                  end
              }))
          end
      end
  end,
}
return { name = {"Jokers"}, items = {arlecchino} }
