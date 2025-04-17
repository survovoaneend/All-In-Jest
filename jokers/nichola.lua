SMODS.Joker {
    key = "nichola",
    config = {
      
    },
    loc_txt = {
      name = "Nichola",
      text ={
          'When round begins, add',
            'one random {C:attention}Queen',
            'to your hand with a',
            'random {C:attention}Enhancement{}, {C:attention}Seal{},',
            'and {C:dark_edition}Edition{}'
      },
  },
    rarity = 4,
    pos = { x = 6, y = 2},
    atlas = 'legendary_atlas',
    cost = 20,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    soul_pos = { x = 6, y = 3},
  
    loc_vars = function(self, info_queue, card)
  
    end,
  
    calculate = function(self, card, context)
      if context.setting_blind and not context.blueprint then
          G.E_MANAGER:add_event(Event({
              func = function()
                  local created_cards = {}
                  for i = 1, 1 do
                      local suits = {'S', 'H', 'D', 'C'}
                      local random_suit_prefix = suits[pseudorandom('nichola_suit'..i, 1, #suits)]
                      local queen_card_key = random_suit_prefix .. '_Q'
                      local queen_card_proto = G.P_CARDS[queen_card_key]

                      local random_enhancement_key = SMODS.poll_enhancement({ guaranteed = true, key_append = 'nicola_enhance'..i })
                      local random_seal_key = SMODS.poll_seal({ guaranteed = true, key_append = 'nichola_seal'..i })

                      local random_edition_table = poll_edition('nichola_edition'..i, nil, nil, true, {'e_foil', 'e_holo', 'e_polychrome'})

                      local new_queen = create_playing_card({
                          front = queen_card_proto,
                          center = G.P_CENTERS[random_enhancement_key or 'c_base'] 
                      }, G.hand, nil, true) 

        
                      if random_seal_key then new_queen:set_seal(random_seal_key, true, true) end
                      if random_edition_table then new_queen:set_edition(random_edition_table, true, true) end

                      G.GAME.blind:debuff_card(new_queen)
                      table.insert(created_cards, new_queen)
                      play_sound('card1', 0.9 + i*0.05, 0.5) 
                      new_queen:juice_up(0.2, 0.1)
                  end

                  G.hand:sort()
                  playing_card_joker_effects(created_cards)
                  card:juice_up(0.5, 0.2)

                  return true
              end
          }))
          return nil, true
      end
  end
  }