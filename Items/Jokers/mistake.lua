local mistake = {
  object_type = "Joker",
  order = 241,
   ignore = true,
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
    if G.GAME.stake >= 4 then
        return true
    end
    return false
  end,

  calculate = function(self, card, context)
      
  end
}
local can_sell_card_ref = Card.can_sell_card
function Card:can_sell_card(context)
  local ref = can_sell_card_ref(self, context)
  local has_mistake = false
  if G.jokers and self.ability.set == 'Joker' then
    if G.jokers and G.jokers.cards then
      for i = 1, #G.jokers.cards do
        if G.jokers.cards[i].config and G.jokers.cards[i].config.center_key == "j_aij_mistake" then
          has_mistake = true
        end
      end
    end
  end
  if not ref and self.ability.eternal and has_mistake then
    return true
  end
  return ref
end
return { name = {"Jokers"}, items = {mistake} }
