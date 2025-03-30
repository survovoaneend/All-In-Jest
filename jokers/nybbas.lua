SMODS.Joker {
    key = "nybbas",
    config = {
      
    },
    loc_txt = {
      name = "Nybbas",
      text ={
          "Grants a {C:dark_edition}Negative{} {C:attention}The Devil{}",
          "{C:tarot}Tarot{} card upon selecting {C:attention}Blind{}.",
          "Scored {C:attention}Gold Cards{} are given a random",
          "{C:attention}seal{} and {C:attention}edition{}"
      },
  },
    rarity = 4,
    pos = { x = 0, y = 0},
    atlas = 'legendary_atlas',
    cost = 4,
    unlocked = true,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = false,
    soul_pos = { x = 0, y = 1},
  
    loc_vars = function(self, info_queue, card)
  
    end,
  
    calculate = function(self, card, context)
      
    end
  }