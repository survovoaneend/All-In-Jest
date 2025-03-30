SMODS.Joker {
    key = "flying_ace",
    config = {
      extra = {
        dollar_gain = 2,
        dollars = 0,
        aces = {}
      }
    },
    loc_txt = {
      name = "Flying Ace",
      text ={
          "Earn {C:money}$#1#{} at end of round per",
          "{C:attention}Ace{} of unique {C:attention}suit{} scored", 
          "this round.",
          "{C:inactive}(Currently{} {C:money}$#2#{} {C:inactive}){}"
      },
  },
    rarity = 1,
    pos = { x = 0, y = 0 },
    atlas = 'joker_atlas',
    cost = 4,
    unlocked = true,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = false,
  
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.dollar_gain,
                card.ability.extra.dollars
            }
        }
    end,
  
    calculate = function(self, card, context)
        if context.individual and not context.blueprint and not context.repetition then
            if context.cardarea == G.play and not context.other_card.debuff then
                if context.other_card:get_id() == 14 then
                    local current_suit = context.other_card.base.suit
                    if current_suit and not card.ability.extra.aces[current_suit] then
                        card.ability.extra.dollars = card.ability.extra.dollars + card.ability.extra.dollar_gain
                        card.ability.extra.aces[current_suit] = true
                    end
                end
            end
        end
        if context.cashing_out and not context.blueprint then
            card.ability.extra.aces = {}
            card.ability.extra.dollars = 0
        end
    end,
    calc_dollar_bonus = function(self, card)
        local dollar_bonus = card.ability.extra.dollars
    
        return dollar_bonus
    end
}