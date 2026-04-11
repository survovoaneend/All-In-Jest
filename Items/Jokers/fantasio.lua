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
    eternal_compat = true,
    soul_pos = { x = 3, y = 11},
  
    loc_vars = function(self, info_queue, card)
  
    end,
  
    calculate = function(self, card, context)
      
    end,
}

local smods_add_to_pool_ref = SMODS.add_to_pool
function SMODS.add_to_pool(prototype_obj, ...)
    if
        #SMODS.find_card("j_aij_fantasio") > 0 and
        prototype_obj.key == "bl_club" or prototype_obj.key == "bl_window" or prototype_obj.key == "bl_goad" or prototype_obj.key == "bl_head"
    then
        return false
    else
        return smods_add_to_pool_ref(prototype_obj, ...)
    end
end

return { name = {"Jokers"}, items = {fantasio} }
