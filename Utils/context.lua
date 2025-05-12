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

-- Workshoping
-- context.chance_trigger.trigger (returns true when 1 in whatever chance is true and false when it fails) 
-- context.chance_trigger.chances (The denomator of the triggered chance)