local whatsisname = {
    object_type = "Joker",
    order = 264,
    
    key = "whatsisname",
    config = {
      
    },
    rarity = 3,
    pos = { x = 9, y = 10},
    atlas = 'joker_atlas',
    cost = 8,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
  
    end,

    add_to_deck = function(self, card, from_debuff)
        
    end,
    remove_from_deck = function(self, card, from_debuff)
        
    end,
  
    calculate = function(self, card, context)
        
    end
  
}
return { name = {"Jokers"}, items = {whatsisname} }
