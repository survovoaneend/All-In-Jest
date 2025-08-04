local clay_joker = {
    object_type = "Joker",
    order = 102,

    key = "clay_joker",
    config = {
      extra = {

      }
    },
    rarity = 2,
    pos = { x = 22, y = 3 },
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
        if G.GAME.jest_clay_last_destroyed then  
            info_queue[#info_queue + 1] = G.P_CENTERS[G.GAME.jest_clay_last_destroyed.config.center.key] 
        end
        return { vars = {  } }
    end,
  
    calculate = function(self, card, context)
        local other_joker = G.GAME.jest_clay_last_destroyed
		return SMODS.blueprint_effect(card, other_joker, context)
    end
  
}
local start_dissolve_ref = Card.start_dissolve
function Card:start_dissolve(dissolve_colours, silent, dissolve_time_fac, no_juice)
  local ref = start_dissolve_ref(self, dissolve_colours, silent, dissolve_time_fac, no_juice)
  if G.jokers and self.ability.set == 'Joker' then
    if not self.ability.jest_sold_self then
      if self.ability.name == 'j_aij_visage' or self.ability.name == 'j_aij_clay_joker' then
        G.GAME.jest_clay_last_destroyed = nil
      else
        G.GAME.jest_clay_last_destroyed = self
      end
    end
  end
  return ref
end
return { name = {"Jokers"}, items = {clay_joker} }
