local pulcinella = {
    object_type = "Joker",
    order = 109,
    ignore = true,

    key = "pulcinella",
    config = {
      
    },
    rarity = 1,
    pos = { x = 4, y = 4 },
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
return { name = {"Jokers"}, items = {pulcinella} }
