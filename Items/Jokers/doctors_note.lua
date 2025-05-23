local doctors_note = {
    object_type = "Joker",
    order = 56,
    
    key = "doctors_note",
    config = {
      
    },
    rarity = 3,
    pos = { x = 2, y = 2 },
    atlas = 'joker_atlas',
    cost = 8,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
  
    end,
  
    calculate = function(self, card, context)
      
    end
  
}
return { name = {"Jokers"}, items = {doctors_note} }
