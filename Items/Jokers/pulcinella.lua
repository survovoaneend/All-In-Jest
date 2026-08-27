local pulcinella = {
    object_type = "Joker",
    order = 112,
    ignore = true,

    key = "pulcinella",
    config = {
      
    },
    attributes = {},
    rarity = 1,
    pos = { x = 4, y = 4 },
    atlas = 'joker_atlas',
    cost = 4,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = false,
    perishable_compat = true,
  
    loc_vars = function(self, info_queue, card)
  
    end,
  
    calculate = function(self, card, context)
      
    end
  
}
return { name = {"Jokers"}, items = {pulcinella} }
