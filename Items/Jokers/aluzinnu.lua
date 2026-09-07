local aluzinnu = {
    object_type = "Joker",
    order = 224,
    ignore = true,
    key = "aluzinnu",
    config = {
      
    },
    attributes = {},
    rarity = 3,
    pos = { x = 7, y = 8},
    atlas = 'joker_atlas',
    cost = 8,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
  
    loc_vars = function(self, info_queue, card)
  
    end,
  
    -- Lmao no code here
}
return { name = {"Jokers"}, items = {aluzinnu} }
