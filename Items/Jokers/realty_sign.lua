local realty_sign = {
    object_type = "Joker",
    order = 83,

    key = "realty_sign",
    config = {
      extra = { sell_increase = 3 }
    },
    rarity = 1,
    pos = { x = 3, y = 3 },
    atlas = 'joker_atlas',
    cost = 5,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
      return { vars = {card.ability.extra.sell_increase} }
    end,
  
    calculate = function(self, card, context)
        if not context.blueprint and context.before and context.scoring_name == 'Full House' then 
            card.ability.extra_value = (card.ability.extra_value or 0) + card.ability.extra.sell_increase
            card:set_cost()
            card_eval_status_text(card, 'extra', nil, nil, nil, {
              message = localize('k_val_up'),
                colour = G.C.MONEY
            })
          end
    end
  
}
return { name = {"Jokers"}, items = {realty_sign} }
