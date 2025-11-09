local banana_man = {
    object_type = "Joker",
    order = 244,
    key = "banana_man",
    config = {
      extra = {
        odds = 15
      }
    },
    rarity = 3,
    pos = { x = 11, y = 9},
    atlas = 'joker_atlas',
    cost = 8,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    -- pools = {
    --     Food = true
    -- },
  
    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds)
        return {
            vars = {
                numerator, denominator,
            }
        }
    end,
  
    calculate = function(self, card, context)
      if context.repetition_only or (context.retrigger_joker_check) then
        if context.other_card ~= card then
            return {
                repetitions = 1,
                card = card,
                message = localize('k_again_ex')
            }  
        end
      end
      if context.after and context.cardarea == G.jokers and not context.blueprint then
        for i = 1, #G.jokers.cards do
            if SMODS.pseudorandom_probability(card, 'banana_man', 1, card.ability.extra.odds) and not SMODS.is_eternal(G.jokers.cards[i]) then
                G.E_MANAGER:add_event(Event({
                    func = function()
                        if G.jokers.cards[i] then
                            G.jokers.cards[i]:start_dissolve()
                        end
                        return true
                    end
                })) 
                card_eval_status_text(G.jokers.cards[i], 'extra', nil, nil, nil, {message = localize('k_extinct_ex'),colour = G.C.FILTER})
            elseif not SMODS.is_eternal(G.jokers.cards[i]) then
                card_eval_status_text(G.jokers.cards[i], 'extra', nil, nil, nil, {message = localize('k_safe_ex'),colour = G.C.FILTER})
            end
        end
      end
    end
}
return { name = {"Jokers"}, items = {banana_man} }
