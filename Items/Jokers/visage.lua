local visage = {
    object_type = "Joker",
    order = 232,

    key = "visage",
    config = {
      extra = {

      }
    },
    rarity = 2,
    pos = { x = 21, y = 8},
    atlas = 'joker_atlas',
    cost = 8,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
        if G.GAME.jest_visage_last_sold then  
            info_queue[#info_queue + 1] = G.P_CENTERS[G.GAME.jest_visage_last_sold.config.center.key] 
        end
        return { vars = {  } }
    end,
  
    calculate = function(self, card, context)
        local other_joker = G.GAME.jest_visage_last_sold
		return SMODS.blueprint_effect(card, other_joker, context)
    end
  
}
local sell_card_ref = Card.sell_card
function Card:sell_card()
  local ref = sell_card_ref(self)
  if G.jokers and self.ability.set == 'Joker' then
    if self.ability.name == 'j_aij_visage' or self.ability.name == 'j_aij_clay_joker' then
        G.GAME.jest_visage_last_sold = nil
    else
        G.GAME.jest_visage_last_sold = self
    end
  end
  return ref
end
return { name = {"Jokers"}, items = {visage} }
