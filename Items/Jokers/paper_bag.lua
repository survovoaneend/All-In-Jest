local paper_bag = {
    object_type = "Joker",
    order = 44,
    ignore = true,

    key = "paper_bag",
    config = {
      
    },
    rarity = 1,
    pos = { x = 16, y = 1 },
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
return { name = {"Jokers"}, items = {paper_bag} }
