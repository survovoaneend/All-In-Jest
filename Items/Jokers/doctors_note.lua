local doctors_note = {
    object_type = "Joker",
    order = 56,
    ignore = true,

    key = "doctors_note",
    config = {
      
    },
    rarity = 1,
    pos = { x = 2, y = 2 },
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
return { name = {"Jokers"}, items = {doctors_note} }
