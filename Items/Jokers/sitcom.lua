local sitcom = {
    object_type = "Joker",
    order = 136,
    ignore = true,

    key = "sitcom",
    config = {
      
    },
    rarity = 1,
    pos = { x = 5, y = 5 },
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
return { name = {"Jokers"}, items = {sitcom} }
