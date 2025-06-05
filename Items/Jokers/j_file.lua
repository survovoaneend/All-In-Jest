local j_file = {
    object_type = "Joker",
    order = 117,
    ignore = true,

    key = "j_file",
    config = {
      
    },
    rarity = 1,
    pos = { x = 12, y = 4 },
    atlas = 'joker_atlas',
    cost = 4,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = false,
  
    loc_vars = function(self, info_queue, card)
  
    end,
  
    calculate = function(self, card, context)
      
    end
  
}
return { name = {"Jokers"}, items = {j_file} }
