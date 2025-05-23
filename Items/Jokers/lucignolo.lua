local lucignolo = {
  object_type = "Joker",
  order = 68,

  key = "lucignolo",
  config = {
    extra = { dollars = 5 }
  },
  rarity = 1,
  pos = { x = 14, y = 2 },
  atlas = 'joker_atlas',
  cost = 5,
  unlocked = true,
  discovered = false,
  blueprint_compat = true,
  eternal_compat = true,

  loc_vars = function(self, info_queue, card)
      return { vars = {card.ability.extra.dollars} }
  end,

  calculate = function(self, card, context)
      if context.remove_playing_cards and context.removed and #context.removed > 0 then
          local money_to_earn = #context.removed * card.ability.extra.dollars
          if money_to_earn > 0 then
              return { 
                dollars = money_to_earn,
                card = card 
            }
          end
      end
  end
}
return { name = {"Jokers"}, items = {lucignolo} }
