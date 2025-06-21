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
        if context.individual and context.cardarea == G.play then
            if context.other_card:get_id() == 4 then
                if pseudorandom('tetrominoker') < G.GAME.probabilities.normal / card.ability.extra.odds then
                    G.playing_card = (G.playing_card and G.playing_card + 1) or 1
                    local _card = copy_card(context.other_card, nil, nil, G.playing_card)
                    _card:add_to_deck()
                    G.deck.config.card_limit = G.deck.config.card_limit + 1
                    table.insert(G.playing_cards, _card)
                    card.is_duplicating = true 
                    playing_card_joker_effects({ _card })
                    card.is_duplicating = false
                    G.hand:emplace(_card)
                    _card.states.visible = nil
                    G.E_MANAGER:add_event(Event({
                      trigger = 'after',
                      delay = 0.7,
                      func = function()
                          if _card and not _card.REMOVED then
                              _card:start_materialize()
                              return true
                          end
                          return true
                      end
                    }))

                    card:juice_up(0.4, 0.3)

                    return {
                  
                      message = localize('k_copied_ex'),
                      colour = G.C.FILTER,
                      card = card,
                    }
                end
            end
        end
    end
  
}
return { name = {"Jokers"}, items = {tetrominoker} }
