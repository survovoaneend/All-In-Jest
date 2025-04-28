local infuriating_note = {
    object_type = "Joker",
    order = 191,
    ignore = true,

    key = "infuriating_note",
    config = {
      
    },
    rarity = 1,
    pos = { x = 5, y = 7},
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
return { name = {"Jokers"}, items = {infuriating_note} }
