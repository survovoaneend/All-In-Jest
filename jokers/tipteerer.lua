SMODS.Joker {
  key = "tipteerer",
  config = {
    extra = {
      money = 0
    }
  },
  rarity = 2,
  pos = { x = 3, y = 6 },
  atlas = 'joker_atlas',
  cost = 6,
  unlocked = true,
  discovered = false,
  blueprint_compat = false,
  eternal_compat = true,

  loc_vars = function(self, info_queue, card)
    local sell_cost = 0
    if G.jokers and G.jokers.cards then
      for i = 1, #G.jokers.cards do
        if G.jokers.cards[i] ~= card and (G.jokers.cards[i].area and G.jokers.cards[i].area == G.jokers) then
          sell_cost = sell_cost + G.jokers.cards[i].sell_cost
        end
      end
      card.ability.extra.money = math.ceil(sell_cost / 5)
    end
    return {
      vars = {
        card.ability.extra.money
      }
    }
  end,
  calculate = function(self, card, context)

  end,
  calc_dollar_bonus = function(self, card)
    local sell_cost = 0
    if G.jokers and G.jokers.cards then
      for i = 1, #G.jokers.cards do
        if G.jokers.cards[i] ~= card and (G.jokers.cards[i].area and G.jokers.cards[i].area == G.jokers) then
          sell_cost = sell_cost + G.jokers.cards[i].sell_cost
        end
      end
    end
    card.ability.extra.money = math.ceil(sell_cost / 5)
    if card.ability.extra.money > 0 then
      local dollar_bonus = card.ability.extra.money or 0
      return 
        dollar_bonus
      
    end
  end
}
