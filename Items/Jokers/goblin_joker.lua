local goblin_joker = {
    object_type = "Joker",
    order = 93,
    ignore = true,

    key = "goblin_joker",
    config = {
      
    },
    rarity = 1,
    pos = { x = 13, y = 3 },
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
return { name = {"Jokers"}, items = {goblin_joker} }
