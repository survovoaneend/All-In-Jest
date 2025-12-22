local nobody = {
    object_type = "Joker",
    order = 339,
    key = "nobody",
    config = {
      extra = {
          rounds = 5,
          cur_rounds = 0
      }
    },
    rarity = 3,
    pos = { x = 10, y = 13},
    atlas = 'joker_atlas',
    cost = 8,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    perishable_compat = false, -- Because it would be sad
    eternal_compat = false, -- incompatible since rerolls are considered not compatible with eternal, so keeping consistency
  
    loc_vars = function(self, info_queue, card)
        
    end,
  
    calculate = function(self, card, context)
        if context.setting_blind and not context.blueprint then
            if card.ability.extra.cur_rounds >= card.ability.extra.rounds then
                -- Poll a legendary to transform into
                -- All_in_Jest.reroll_joker only polls for same rarity by default, so doing it here instead
                local ivalue = 1
                local _pool, _pool_key = get_current_pool("Joker", "Legendary", true, "nobody")
                local center = pseudorandom_element(_pool, pseudoseed(_pool_key))
                while center == "UNAVAILABLE" do
                    ivalue = ivalue + 1
                    center = pseudorandom_element(_pool, pseudoseed(_pool_key .. "_resample" .. ivalue))
                end
                
                G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
                  play_sound('tarot1')
                  card:juice_up(0.3, 0.5)
                  return true
                end }))
                All_in_Jest.reroll_joker(card, center, 'nobody')
            end
        end
    end
}
local ease_rounderef = ease_round
function ease_round(mod)
    if mod ~= 0 then
        for i = 1, #SMODS.find_card("j_aij_nobody") do
            SMODS.find_card("j_aij_nobody")[i].ability.extra.cur_rounds = SMODS.find_card("j_aij_nobody")[i].ability.extra.cur_rounds + mod
        end
    end
    
    local ref = ease_rounderef(mod)
    return ref
end
return { name = {"Jokers"}, items = {nobody} }
