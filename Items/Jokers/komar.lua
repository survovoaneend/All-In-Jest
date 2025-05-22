local komar = {
    object_type = "Joker",
    order = 1047,
    
    key = "komar",
    config = {
      
    },
    rarity = 4,
	unlock_condition = {hidden = true},
    pos = { x = 6, y = 8},
    atlas = 'legendary_atlas',
    cost = 20,
    unlocked = false,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    soul_pos = { x = 6, y = 9},
  
    loc_vars = function(self, info_queue, card)
  
    end,
  
    calculate = function(self, card, context)
      if context.individual and context.cardarea == G.play then
            local added_chips = 0
            for i = 1, #G.play.cards do
                if G.play.cards[i] ~= context.other_card then
                    added_chips = added_chips + G.play.cards[i].base.nominal
                end
            end
            context.other_card.ability.perma_bonus = context.other_card.ability.perma_bonus + added_chips
            if added_chips > 0 then
                return {
                    extra = { message = localize('k_upgrade_ex'), colour = G.C.CHIPS },
                    card = context.other_card
                }
            end
        end
    end
  
}
return { name = {"Jokers"}, items = {komar} }
