local design_document = {
    object_type = "Joker",
    order = 197,
    ignore = true,

    key = "design_document",
    config = {
      
    },
    rarity = 1,
    pos = { x = 11, y = 7},
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
return { name = {"Jokers"}, items = {design_document} }
