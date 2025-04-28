local hei_tiki = {
    object_type = "Joker",
    order = 60,
    ignore = true,

    key = "hei_tiki",
    config = {
      
    },
    rarity = 1,
    pos = { x = 6, y = 2 },
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
return { name = {"Jokers"}, items = {hei_tiki} }
