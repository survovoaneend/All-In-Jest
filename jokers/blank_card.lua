SMODS.Joker {
    key = "blank_card",
    config = {
      extra = {
        can_copy = false
      }
    },
    rarity = 2,
    pos = { x = 5, y = 1 },
    atlas = 'joker_atlas',
    cost = 7,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
  
    end,
  
    calculate = function(self, card, context)
      if context.open_booster then
        if context.card and context.card.config and context.card.config.center then
          if context.card.config.center.draw_hand == true then
            card.ability.extra.can_copy = false
          else
            card.ability.extra.can_copy = true
          end

        end
      end
     
      if context.playing_card_added and context.cards and context.cards[1] and G.STATE == 999 and type(context.cards[1]) == 'table' and card.ability.extra.can_copy then
        local card_to_copy = context.cards[1]
        if card_to_copy ~= card then
            G.playing_card = (G.playing_card and G.playing_card + 1) or 1
            local _card = copy_card(card_to_copy, nil, nil, G.playing_card) 

            if _card then
                _card:add_to_deck()
                G.deck.config.card_limit = G.deck.config.card_limit + 1
                table.insert(G.playing_cards, _card)
                G.hand:emplace(_card)
                _card.states.visible = nil 
                G.E_MANAGER:add_event(Event({
                  trigger = 'after',
                  delay = 0.7,
                  func = function()
                      if _card and not _card.REMOVED then
                          _card:start_materialize()
                      end
                      return true
                  end
                }))

                card:juice_up(0.4, 0.3)

                return {
                  message = localize('k_copied_ex'),
                  colour = G.C.CHIPS,                
                  card = card,                       
                }
            end
        end
      end
      return nil
    end
  }