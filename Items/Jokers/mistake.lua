local mistake = {
  object_type = "Joker",
  order = 241,
  
  key = "mistake",
  config = {
    
  },
  rarity = 2,
  pos = { x = 9, y = 9},
  atlas = 'joker_atlas',
  cost = 6,
  unlocked = true,
  discovered = false,
  blueprint_compat = false,
  eternal_compat = true,

  in_pool = function(self, args)
    return G.GAME.modifiers.enable_eternals_in_shop or false
  end,

  calculate = function(self, card, context)
      
  end
}
local can_sell_card_ref = Card.can_sell_card
function Card:can_sell_card(context)
  local ref = can_sell_card_ref(self, context)
  local has_mistake = self.ability.set == 'Joker' and next(SMODS.find_card("j_aij_mistake"))
  if not ref and self.ability.eternal and has_mistake then
    return true
  end
  return ref
end
return { name = {"Jokers"}, items = {mistake} }
