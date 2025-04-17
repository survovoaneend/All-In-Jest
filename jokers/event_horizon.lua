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
  add_to_deck = function(self, card, from_debuff)
    SMODS.Consumable:take_ownership("black_hole", {
      discovered = true,
      hidden = false
    })
  end,
  loc_vars = function(self, info_queue, card)
    
  end,

  calculate = function(self, card, context)

  end
}