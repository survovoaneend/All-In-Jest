local word_art = {
    object_type = "Joker",
    order = 41,
    ignore = true,

    key = "word_art",
    config = {
      
    },
    rarity = 1,
    pos = { x = 13, y = 1 },
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
return { name = {"Jokers"}, items = {word_art} }
