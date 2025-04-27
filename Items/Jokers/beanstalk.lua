local beanstalk = {
    object_type = "Joker",
    order = 194,
    ignore = true,

    key = "beanstalk",
    config = {
      
    },
    rarity = 1,
    pos = { x = 8, y = 7},
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
return { name = {"Jokers"}, items = {beanstalk} }
