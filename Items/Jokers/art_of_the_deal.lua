local art_of_the_deal = {
    object_type = "Joker",
    order = 40,
    ignore = true,

    key = "art_of_the_deal",
    config = {
      
    },
    rarity = 1,
    pos = { x = 12, y = 1 },
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
return { name = {"Jokers"}, items = {art_of_the_deal} }
