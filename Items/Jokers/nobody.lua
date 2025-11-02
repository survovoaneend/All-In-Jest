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
    eternal_compat = false,
  
    loc_vars = function(self, info_queue, card)
        
    end,
  
    calculate = function(self, card, context)
        if context.setting_blind then
            if card.ability.extra.cur_rounds >= card.ability.extra.rounds then
                local temp_card = create_card('Joker', G.jokers, true, 1, nil, nil, nil, 'nobody')
                temp_card:start_materialize()
                G.jokers:emplace(temp_card)
                SMODS.destroy_cards(card, nil, true)
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
