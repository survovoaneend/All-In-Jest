SMODS.Joker {
    key = "penny",
    config = {
      extra = {
        odds = 2
      }
    },
    loc_txt = {
      name = "Penny",
      text ={
          "Cards with {C:money}Gold Seal{}",
          "have a {C:green}#1# in #2#{} chance to",
          "{C:attention}retrigger"
      },
  },
    rarity = 1,
    pos = { x = 1, y = 2 },
    atlas = 'joker_atlas',
    cost = 4,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    set_ability = function(self, card, initial, delay_sprites)
      local w_scale, h_scale = 53 / 71, 53 / 95
  
      card.T.h = card.T.h * h_scale
      card.T.w = card.T.w * w_scale
    end,
  
    set_sprites = function(self, card, front)
      local w_scale, h_scale = 53 / 71, 53 / 95
  
      card.children.center.scale.y = card.children.center.scale.y * h_scale
      card.children.center.scale.x = card.children.center.scale.x * w_scale
    end,
  
    load = function(self, card, card_table, other_card)
      local w_scale, h_scale = 53 / 71, 53 / 95
  
      card.T.h = card.T.h * h_scale
      card.T.w = card.T.w * w_scale
    end,
  
    loc_vars = function(self, info_queue, card)
      info_queue[#info_queue+1] = G.P_SEALS['Gold']
      return {
        vars = {
          G.GAME.probabilities.normal,
          card.ability.extra.odds
        }
      }
      
    end,
  
    calculate = function(self, card, context)
      if context.repetition and context.other_card then
          if context.other_card.seal == 'Gold' then
              if pseudorandom('penny'..G.SEED) < G.GAME.probabilities.normal / card.ability.extra.odds then
                  return {
                      message = localize('k_again_ex'),
                      repetitions = 1,
                      card = card, 
                      colour = G.C.GOLD 
                  }
              end
          end
      end

      return nil
  end
  }