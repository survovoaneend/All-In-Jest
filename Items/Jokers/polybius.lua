local polybius = {
    object_type = "Joker",
    order = 61,
    ignore = true,

    key = "polybius",
    config = {
      
    },
    rarity = 1,
    pos = { x = 7, y = 2 },
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
return { name = {"Jokers"}, items = {polybius} }
