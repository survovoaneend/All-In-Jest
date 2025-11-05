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
  pos = { x = 6, y = 13 },
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
    if context.setting_blind and not G.GAME.blind.boss and not context.blueprint then
      for i = 1, #G.consumeables.cards do
        if G.consumeables.cards[i].config.center.set == "Planet" then
          SMODS.destroy_cards(G.consumeables.cards[i])
          local hand = G.consumeables.cards[i].config.center.config.hand_type or nil
          if hand then
            if G.consumeables.cards[i].config.center.config.mult then
              SMODS.scale_card(card, {
                ref_table = card.ability.extra,
                ref_value = "mult",
                scalar_table = G.GAME.hands[hand],
                scalar_value = "l_mult",
                operation = function(ref_table, ref_value, initial, change)
                  ref_table[ref_value] = initial + (change * 2)
                end,
              })
            elseif G.consumeables.cards[i].config.center.config.chips then
              SMODS.scale_card(card, {
                ref_table = card.ability.extra,
                ref_value = "chips",
                scalar_table = G.GAME.hands[hand],
                scalar_value = "l_chips",
                operation = function(ref_table, ref_value, initial, change)
                  ref_table[ref_value] = initial + (change * 2)
                end,
              })
            else
              SMODS.scale_card(card, {
                ref_table = card.ability.extra,
                ref_value = "mult",
                scalar_table = G.GAME.hands[hand],
                scalar_value = "l_mult",
                no_message = true,
              })
              SMODS.scale_card(card, {
                ref_table = card.ability.extra,
                ref_value = "chips",
                scalar_table = G.GAME.hands[hand],
                scalar_value = "l_chips",
              })
            end
          end
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
return { name = { "Jokers" }, items = { remina } }
