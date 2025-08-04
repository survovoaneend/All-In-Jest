local read_em_and_weep = {
    object_type = "Joker",
    order = 92,
    ignore = true,

    key = "read_em_and_weep",
    config = {
      
    },
    rarity = 1,
    pos = { x = 12, y = 3 },
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
return { name = {"Jokers"}, items = {read_em_and_weep} }
