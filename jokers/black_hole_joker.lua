SMODS.Joker {
  key = "black_hole_joker",
  config = {
    
  },
  loc_txt = {
    name = "Black Hole Joker",
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