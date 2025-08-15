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
    blueprint_compat = false,
    eternal_compat = true,
    -- pools = {
    --     Food = true
    -- },
  
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                G.GAME.probabilities.normal,
                card.ability.extra.odds
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
      if context.after and context.cardarea == G.jokers then
        for i = 1, #G.jokers.cards do
            if pseudorandom('banana_man') < G.GAME.probabilities.normal / card.ability.extra.odds and not G.jokers.cards[i].ability.eternal then
                G.E_MANAGER:add_event(Event({
                    func = function()
                        G.jokers.cards[i]:start_dissolve()
                        return true
                    end
                })) 
                card_eval_status_text(G.jokers.cards[i], 'extra', nil, nil, nil, {message = localize('k_extinct_ex'),colour = G.C.FILTER})
            else
                card_eval_status_text(G.jokers.cards[i], 'extra', nil, nil, nil, {message = localize('k_safe_ex'),colour = G.C.FILTER})
            end
        end
      end
    end
}
return { name = {"Jokers"}, items = {banana_man} }
