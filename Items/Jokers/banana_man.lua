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
        if context.other_card ~= card and not context.other_context.modify_scoring_hand then
            return {
                repetitions = 1,
                card = card,
                message = localize('k_again_ex')
            }
        end
      end
      if context.after and context.cardarea == G.jokers and not context.blueprint then

        local message_colour = G.C.FILTER
        if context.blueprint_card then
            local blueprint_card = context.blueprint_card
            if blueprint_card.ability.name == "Brainstorm" then
                message_colour = G.C.RED
            elseif blueprint_card.ability.name == "Blueprint" then
                message_colour = G.C.BLUE
            end
        end

        for i = 1, #G.jokers.cards do
            if not SMODS.is_eternal(G.jokers.cards[i]) then
                if SMODS.pseudorandom_probability(card, 'banana_man', 1, card.ability.extra.odds) then
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            if G.jokers.cards[i] then
                                SMODS.destroy_cards(G.jokers.cards[i])
                            end
                            return true
                        end
                    })) 
                    card_eval_status_text(G.jokers.cards[i], 'extra', nil, nil, nil, {message = localize('k_extinct_ex'),colour = message_colour})
                else
                    card_eval_status_text(G.jokers.cards[i], 'extra', nil, nil, nil, {message = localize('k_safe_ex'),colour = message_colour})
                end
            end
        end
      end
    end
}
return { name = {"Jokers"}, items = {banana_man} }
