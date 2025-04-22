SMODS.Joker {
    key = "doodle",
    config = {
      extra = {
        dir = 0,
        odds = 2
      }
    },
    rarity = 2,
    pos = { x = 24, y = 0 },
    atlas = 'joker_atlas',
    cost = 7,
    unlocked = true,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
      return { vars = { 
        ''..(G.GAME and G.GAME.probabilities.normal or 1),
        card.ability.extra.odds
      } }
    end,
  --thank you unstable
    calculate = function(self, card, context)
      local other_joker = nil
      if context.before then
        if pseudorandom('doodle'..G.SEED) > 0.5 then
          card.ability.extra.dir = 1
        else
          card.ability.extra.dir = 0
        end
      end
      for i = 1, #G.jokers.cards do
        if G.jokers.cards[i] == card then
          if card.ability.extra.dir==0 then
            other_joker = G.jokers.cards[i - 1]
          else
            other_joker = G.jokers.cards[i + 1]
          end
        end
      end
      if other_joker and other_joker ~= self and pseudorandom('doodle') < G.GAME.probabilities.normal/card.ability.extra.odds then
		
        context.blueprint = (context.blueprint and (context.blueprint + 1)) or 1
        context.blueprint_card = context.blueprint_card or card
  
        if context.blueprint > #G.jokers.cards + 1 then
          return
        end
  
        local other_joker_ret, trig = other_joker:calculate_joker(context)
        
        context.blueprint = nil
        
        local eff_card = context.blueprint_card or card
        context.blueprint_card = nil
        
        if other_joker_ret or trig then
          if not other_joker_ret then
            other_joker_ret = {}
          end
          
          other_joker_ret.card = eff_card
          other_joker_ret.colour = G.C.GREEN
          other_joker_ret.no_callback = true
          
          
          return other_joker_ret
        end
      end
    end
  }