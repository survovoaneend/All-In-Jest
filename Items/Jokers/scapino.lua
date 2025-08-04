local scapino = {
    object_type = "Joker",
    order = 106,
    ignore = true,

    key = "scapino",
    config = {
      
    },
    rarity = 1,
    pos = { x = 1, y = 4 },
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
return { name = {"Jokers"}, items = {scapino} }
