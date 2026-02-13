local mirth = {
  object_type = "Consumable",
  key = 'mirth',
  set = 'Spectral',
  atlas = 'consumable_atlas',
  pos = { x = 8, y = 0 },
  cost = 4,
  unlocked = true,
  discovered = false,
  order = 10,
  config = { extra = { mod_conv = 'aij_smiley', }, max_highlighted = 1 },
  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_SEALS[card.ability.extra.mod_conv]
    return {
      vars = {
        card.ability.max_highlighted,
        localize { type = 'name_text', set = 'Other', key = card.ability.extra.mod_conv .. '_seal' },
        colours = {
          HEX("83b8c0"),
        }
      }
    }
  end,
  use = function(self, card)
    G.E_MANAGER:add_event(Event({
      func = function()
        play_sound('tarot1')
        card:juice_up(0.3, 0.5)
        return true
      end
    }))

    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0.1,
      func = function()
        for _, conv_card in ipairs(G.hand.highlighted) do
          conv_card:set_seal(card.ability.extra.mod_conv, nil, true)
        end
        return true
      end
    }))

    delay(0.5)
    
    G.E_MANAGER:add_event(Event({ trigger = 'after', delay = 0.2, func = function()
      G.hand:unhighlight_all(); return true
    end }))
  end,
}
return { name = { "Spectrals" }, items = { mirth } }
