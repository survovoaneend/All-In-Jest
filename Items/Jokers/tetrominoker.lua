local tetrominoker = {
    object_type = "Joker",
    order = 281,
    key = "tetrominoker",
    config = {
      extra = {
          odds = 4
      }
    },
    rarity = 2,
    pos = { x = 4, y = 11},
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                G.GAME.probabilities.normal,
                card.ability.extra.odds,
            }
        }
    end,
  
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and not context.blueprint then
            if context.other_card:get_id() == 4 then
                if pseudorandom('tetrominoker') < G.GAME.probabilities.normal / card.ability.extra.odds then
                        G.playing_card = (G.playing_card and G.playing_card + 1) or 1
                local copied_card = copy_card(context.other_card, nil, nil, G.playing_card)
                copied_card:add_to_deck()
                G.deck.config.card_limit = G.deck.config.card_limit + 1
                table.insert(G.playing_cards, copied_card)
                G.hand:emplace(copied_card)
                copied_card.states.visible = nil
                
                G.E_MANAGER:add_event(Event({
                    func = function() 
                        copied_card:start_materialize()
                        return true
                    end
                }))
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Copied", colour = G.C.GREEN})
                    end
            end
        end
    end
  
}
return { name = {"Jokers"}, items = {tetrominoker} }
