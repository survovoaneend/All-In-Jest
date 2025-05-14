local le_fils_de_banane = {
    object_type = "Joker",
    order = 277,
    ignore = true,
    key = "le_fils_de_banane",
    config = {
      
    },
    rarity = 1,
    pos = { x = 0, y = 11},
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
return { name = {"Jokers"}, items = {le_fils_de_banane} }
