local the_mermaid = {
    object_type = "Joker",
    order = 291,
    ignore = true,
    key = "the_mermaid",
    config = {
      
    },
    rarity = 1,
    pos = { x = 14, y = 11},
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
return { name = {"Jokers"}, items = {the_mermaid} }
