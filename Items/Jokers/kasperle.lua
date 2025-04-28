local kasperle = {
    object_type = "Joker",
    order = 112,
    ignore = true,

    key = "kasperle",
    config = {
      
    },
    rarity = 1,
    pos = { x = 7, y = 4 },
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
return { name = {"Jokers"}, items = {kasperle} }
