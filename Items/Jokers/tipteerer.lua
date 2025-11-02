local tipteerer = {
  object_type = "Joker",
  order = 159,

  key = "tipteerer",
  config = {
    extra = {
      percent = 20,
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
    local money = 0
    if G.jokers and G.jokers.cards then
      for i = 1, #G.jokers.cards do
        if G.jokers.cards[i] ~= card and (G.jokers.cards[i].area and G.jokers.cards[i].area == G.jokers) then
          sell_cost = sell_cost + G.jokers.cards[i].sell_cost
        end
      end
      money = math.ceil(sell_cost * card.ability.extra.percent/100)
    end
    return {
      vars = {
        money,
        card.ability.extra.percent
      }
    }
  end,
  calculate = function(self, card, context)

  end,
  calc_dollar_bonus = function(self, card)
    local sell_cost = 0
    local money = 0
    if G.jokers and G.jokers.cards then
      for i = 1, #G.jokers.cards do
        if G.jokers.cards[i] ~= card and (G.jokers.cards[i].area and G.jokers.cards[i].area == G.jokers) then
          sell_cost = sell_cost + G.jokers.cards[i].sell_cost
        end
      end
    end
    money = math.ceil(sell_cost * card.ability.extra.percent/100)
    if to_big(money) > to_big(0) then
      return money
    end
  end
}
return { name = {"Jokers"}, items = {tipteerer} }

