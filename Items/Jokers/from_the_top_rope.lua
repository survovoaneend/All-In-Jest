local from_the_top_rope = {
    object_type = "Joker",
    order = 271.1,
    ignore = true,
    key = "from_the_top_rope",
    config = {
      
    },
    rarity = 1,
    pos = { x = 19, y = 10},
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
return { name = {"Jokers"}, items = {from_the_top_rope} }
