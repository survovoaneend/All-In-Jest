local silent_sam = {
    object_type = "Joker",
    order = 151,
    ignore = true,

    key = "silent_sam",
    config = {
      
    },
    rarity = 1,
    pos = { x = 20, y = 5 },
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
return { name = {"Jokers"}, items = {silent_sam} }
