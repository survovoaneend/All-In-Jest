SMODS.Joker {
    key = "fortunato",
    config = {
      extra = {
        x_mult = 1

      }
    },
    loc_txt = {
      name = "Fortunato",
      text ={
          "Turns all {C:attention}played{} but not scored",
          "{C:attention}cards{} into {C:attention}Stone Cards{}.",
          "This {C:attention}Joker{} gains {X:red,C:white}X0.15{} Mult",
          "when a {C:attention}Stone Card{} is scored.",
          "{C:inactive}(Currently{} {X:red,C:white}X#1#{} {C:inactive}Mult){}",
      },
  },
    rarity = 4,
    pos = { x = 5, y = 0},
    atlas = 'legendary_atlas',
    cost = 20,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    soul_pos = { x = 5, y = 1},
  
    loc_vars = function(self, info_queue, card)
      return {
        vars = {
          card.ability.extra.x_mult,
        }
      }
    end,
  
    calculate = function(self, card, context)
      -- Turn non-scoring cards to Stone before scoring
      if context.before and context.cardarea == G.jokers then
          if context.scoring_hand and context.full_hand and #context.scoring_hand > 0 and #context.full_hand > 0 then
              local scoring_lookup = {}
              for _, scoring_card in ipairs(context.scoring_hand) do
                  scoring_lookup[scoring_card.sort_id or scoring_card] = true
              end

              local changed_cards = false
              for _, played_card in ipairs(context.full_hand) do
                  if not scoring_lookup[played_card.sort_id or played_card] and played_card.ability.name ~= 'Stone Card' then
                      if played_card.set_ability then
                           played_card:set_ability(G.P_CENTERS.m_stone)
                          changed_cards = true
                      end
                  end
              end
               if changed_cards then
                  return {
                    message = 'Stone',
                    colour = G.C.JOKER_GREY,
                  }
               end
          end
      end

      -- Check individual cards during scoring
      if context.individual and context.cardarea == G.play then
          -- If a Stone Card is scored, increase this Joker's Xmult
          if context.other_card.ability.name == 'Stone Card' and not context.blueprint then
              card.ability.extra.x_mult = card.ability.extra.x_mult + 0.15
              card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize('k_upgrade_ex')})
              card:juice_up(0.3, 0.2)
          end
      end

      -- Apply the Joker's Xmult during the main Joker calculation phase
      if context.joker_main then
          if card.ability.extra.x_mult > 1 then
               return {
                  message = localize{type='variable',key='a_xmult',vars={card.ability.extra.x_mult}},
                  Xmult_mod = card.ability.extra.x_mult,
                  card = card
              }
          end
      end
  end

  }