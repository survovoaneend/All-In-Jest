local cash_out_ref = G.FUNCS.cash_out
G.FUNCS.cash_out = function(e)
  SMODS.calculate_context({
    cashing_out = true
  })

  cash_out_ref(e)
end

local ease_dollars_ref = ease_dollars
function ease_dollars(mod, instant)
    local sign = "0"
    if to_big(mod) > to_big(0) then
        sign = "+"
    elseif to_big(mod) < to_big(0) then
        sign = "-"
    end
    SMODS.calculate_context({
        jest_money_earned = true,
        jest_earned_amount = to_big(mod),
        jest_earned_sign = sign
    })
    ease_dollars_ref(mod, instant)
end
--Stuff for destruction effects
local start_dissolve_ref = Card.start_dissolve
function Card:start_dissolve(dissolve_colours, silent, dissolve_time_fac, no_juice)
  local ref = start_dissolve_ref(self, dissolve_colours, silent, dissolve_time_fac, no_juice)
  if G.jokers and self.ability.set == 'Joker' then
    SMODS.calculate_context({
      jest_destroying_or_selling_joker = true,
      jest_destroyed_joker = self
    })
    if self.ability.jest_sold_self == nil then
      SMODS.calculate_context({
      jest_destroying_joker = true,
      jest_destroyed_joker = self
     })
    end
  end
end

-- Workshoping
-- context.chance_trigger.trigger (returns true when 1 in whatever chance is true and false when it fails) 
-- context.chance_trigger.chances (The denomator of the triggered chance)