SMODS.Joker {
  key = "event_horizon",
  config = {
    
  },
  loc_txt = {
    name = "Event Horizon",
    text ={
        "{C:dark_edition}Black Hole{} has the same rarity",
        "of other {C:planet}Planet Cards{}"
    },
},
  rarity = 3,
  pos = { x = 13, y = 6},
  atlas = 'joker_atlas',
  cost = 4,
  unlocked = true,
  discovered = true,
  blueprint_compat = false,
  eternal_compat = false,

  loc_vars = function(self, info_queue, card)

  end,

  calculate = function(self, card, context)

  end
}