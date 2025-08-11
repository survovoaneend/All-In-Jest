local planetarium = {
    object_type = "Joker",
    order = 314,
    key = "planetarium",
    config = {
      extra = {
          chips = 100,
          mult = 20,
      }
    },
    rarity = 2,
    pos = { x = 11, y = 12},
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.chips,
                card.ability.extra.mult,
            }
        }
    end,
  
    calculate = function(self, card, context)
        if context.using_consumeable then
            if context.consumeable.ability.set == 'Planet' and context.consumeable.ability.extra_planetarium_mult then
                card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize{type='variable',key='a_mult',vars={card.ability.extra.mult}}, colour = G.C.MULT})
            end
            if context.consumeable.ability.set == 'Planet' and context.consumeable.ability.extra_planetarium_chips then
		        card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize{type='variable',key='a_chips',vars={card.ability.extra.chips}}, colour = G.C.CHIPS})
            end
        end
    end,

    update = function(self, card, dt)
        if G.consumeables then
            for i = 1, #G.consumeables.cards do
                if G.consumeables.cards[i].config.center.config.mult and (not G.consumeables.cards[i].ability.extra_planetarium_mult or #G.consumeables.cards[i].ability.extra_planetarium_mult == 0 or not G.consumeables.cards[i].ability.extra_planetarium_mult[card])then
                    G.consumeables.cards[i].ability.extra_planetarium_mult = G.consumeables.cards[i].ability.extra_planetarium_mult or {} 
                    G.consumeables.cards[i].ability.extra_planetarium_mult[card] = card.ability.extra.mult
                end
                if G.consumeables.cards[i].config.center.config.chips and (not G.consumeables.cards[i].ability.extra_planetarium_chips or #G.consumeables.cards[i].ability.extra_planetarium_chips == 0 or not G.consumeables.cards[i].ability.extra_planetarium_chips[card]) then
                    G.consumeables.cards[i].ability.extra_planetarium_chips = G.consumeables.cards[i].ability.extra_planetarium_chips or {} 
                    G.consumeables.cards[i].ability.extra_planetarium_chips[card] = card.ability.extra.chips
                end
            end
        end
    end,
  
}
return { name = {"Jokers"}, items = {planetarium} }
