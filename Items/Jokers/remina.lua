local remina = {
    object_type = "Joker",
    order = 335,
    key = "remina",
    config = {
      extra = {
          mult = 0,
          chips = 0,
      }
    },
    rarity = 3,
    pos = { x = 6, y = 13},
    atlas = 'joker_atlas',
    cost = 8,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.mult,
                card.ability.extra.chips,
            }
        }
    end,
  
    calculate = function(self, card, context)
        if context.setting_blind and not G.GAME.blind.boss then
            for i = 1, #G.consumeables.cards do
                if G.consumeables.cards[i].config.center.set == "Planet" then
                    local hand = G.consumeables.cards[i].config.center.config.hand_type or nil
                    if hand then
                        if G.consumeables.cards[i].config.center.config.mult then
                            card.ability.extra.mult = card.ability.extra.mult + G.GAME.hands[hand].l_mult * 2
                        elseif G.consumeables.cards[i].config.center.config.chips then
                            card.ability.extra.chips = card.ability.extra.chips + G.GAME.hands[hand].l_chips * 2
                        else
                            card.ability.extra.mult = card.ability.extra.mult + G.GAME.hands[hand].l_mult
                            card.ability.extra.chips = card.ability.extra.chips + G.GAME.hands[hand].l_chips
                        end
                        card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize('k_upgrade_ex'), colour = G.C.FILTER})
                    end
                    G.consumeables.cards[i]:start_dissolve()
                end
            end
        end
        if context.joker_main then
            return {
                mult = card.ability.extra.mult,
                chips = card.ability.extra.chips
            }
        end
    end
  
}
return { name = {"Jokers"}, items = {remina} }
