local fantasio = {
    object_type = "Joker",
    order = 1054,
    
    key = "fantasio",
    config = {
      
    },
    rarity = 4,
	unlock_condition = {hidden = true},
    pos = { x = 3, y = 10},
    atlas = 'legendary_atlas',
    cost = 20,
    unlocked = false,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = false,
    soul_pos = { x = 3, y = 11},
  
    loc_vars = function(self, info_queue, card)
  
    end,
  
    calculate = function(self, card, context)
      
    end,

    add_to_deck = function(self, card, from_debuff)
        G.GAME.banned_keys['bl_club'] = true
        G.GAME.banned_keys['bl_window'] = true
        G.GAME.banned_keys['bl_goad'] = true
        G.GAME.banned_keys['bl_head'] = true
    end,

    remove_from_deck = function(self, card, from_debuff)
        G.GAME.banned_keys['bl_club'] = nil
        G.GAME.banned_keys['bl_window'] = nil
        G.GAME.banned_keys['bl_goad'] = nil
        G.GAME.banned_keys['bl_head'] = nil
	end,
  
}
return { name = {"Jokers"}, items = {fantasio} }
