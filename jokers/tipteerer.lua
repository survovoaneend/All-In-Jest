SMODS.Joker {
  key = "tipteerer",
  config = {
    extra = {
      money = 0
    }
  },
  loc_txt = {
    name = "Tipteerer",
    text ={
        "Earn {C:attention}10%{} of the {C:money}Sell Value{}",
        "of other {C:attention}Jokers{}, rounded up",
        "at the end of {C:attention}round{}",
        "{C:inactive}(Currently{} {C:money}$#1#{} {C:inactive}){}"
    },
},
  rarity = 2,
  pos = { x = 3, y = 6},
  atlas = 'joker_atlas',
  cost = 6,
  unlocked = true,
  discovered = true,
  blueprint_compat = false,
  eternal_compat = true,

  loc_vars = function(self, info_queue, card)
    local sell_cost = 0
      for i = 1, #G.jokers.cards do
        if G.jokers.cards[i] ~= card and (G.jokers.cards[i].area and G.jokers.cards[i].area == G.jokers) then
            sell_cost = sell_cost + G.jokers.cards[i].sell_cost
        end
      end
    card.ability.extra.money = math.ceil(sell_cost / 10)
    return {
      vars = {
        card.ability.extra.money
      }
    }
  end,

  calculate = function(self, card, context)
    
  end,
  calc_dollar_bonus = function(self, card)
    if card.ability.extra.money > 0 then
        local dollar_bonus = card.ability.extra.money
        return dollar_bonus
    end
end
}