local second_tier_meme = {
    object_type = "Joker",
    order = 121,
    ignore = true,

    key = "second_tier_meme",
    config = {
      
    },
    rarity = 1,
    pos = { x = 16, y = 4 },
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
return { name = {"Jokers"}, items = {second_tier_meme} }
