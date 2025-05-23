local dor = {
    object_type = "Joker",
    order = 1020,
    
    key = "dor",
    config = {
      powmult = 0.3
    },
    rarity = 4,
	unlock_condition = {hidden = true},
    pos = { x = 9, y = 2},
    atlas = 'legendary_atlas',
    cost = 20,
    unlocked = false,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    soul_pos = { x = 9, y = 3},
  
    loc_vars = function(self, info_queue, card)
        return { vars = { "^"..tostring(card.ability.powmult + 1) }}
    end,
  
    calculate = function(self, card, context)
      if context.joker_main and G.GAME.current_round.hands_left == 0 then 
        local xmlt = math.pow(mult, card.ability.powmult)
        return {
            message = "^"..(card.ability.powmult + 1).." Mult", 
            colour = G.C.SECONDARY_SET.Enhanced,
            Xmult_mod = xmlt,
        }
      end
    end
  
}
return { name = {"Jokers"}, items = {dor} }
