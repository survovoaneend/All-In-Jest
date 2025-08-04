local holy_bible = {
    object_type = "Joker",
    order = 64,
    ignore = true,

    key = "holy_bible",
    config = {
      
    },
    rarity = 1,
    pos = { x = 10, y = 2 },
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
return { name = {"Jokers"}, items = {holy_bible} }
