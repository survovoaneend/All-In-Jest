local fortunato = {
  object_type = "Joker",
  order = 251,

  key = "fortunato",
  config = {
    extra = {
      x_mult = 1,
      xmult_mod = 0.15,
      activated = false,
    }
  },
  rarity = 4,
  unlock_condition = { hidden = true },
  pos = { x = 5, y = 0 },
  atlas = 'legendary_atlas',
  cost = 20,
  unlocked = false,
  discovered = false,
  blueprint_compat = true,
  eternal_compat = true,
  soul_pos = { x = 5, y = 1 },

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS.m_stone
    return {
      vars = {
        card.ability.extra.x_mult,
        card.ability.extra.xmult_mod
      }
    }
  end,

  calculate = function(self, card, context)
    if context.after and not context.blueprint and context.cardarea == G.jokers then
      if #context.scoring_hand == #context.full_hand then
        card.ability.extra.activated = false
      end
      if context.scoring_hand and context.full_hand and #context.scoring_hand > 0 and #context.full_hand > 0 then
        local scoring_lookup = {}
        for _, scoring_card in ipairs(context.scoring_hand) do
          scoring_lookup[scoring_card.sort_id or scoring_card] = true
        end
        for _, played_card in ipairs(context.full_hand) do
          if not scoring_lookup[played_card.sort_id or played_card] and played_card.ability.name ~= 'Stone Card' then
            card.ability.extra.activated = true
            if played_card.set_ability then
              G.E_MANAGER:add_event(Event({
                trigger = 'before',
                func = function()
                  played_card:juice_up()
                  played_card:set_ability(G.P_CENTERS.m_stone)
                  return true
                end
              }))
            end
          end
        end
      end

      if card.ability.extra.activated then
        return {
          message = 'Stone',
          card = card
        }
      end
    end
    if context.individual and context.cardarea == G.play then
      if context.other_card.ability.name == 'Stone Card' and not context.blueprint then
        card.ability.extra.x_mult = card.ability.extra.x_mult + card.ability.extra.xmult_mod
        return {
          extra = { focus = card, message = localize('k_upgrade_ex') },
          card = card,
        }
      end
    end

    if context.joker_main then
      if card.ability.extra.x_mult > 1 then
        return {
          message = localize { type = 'variable', key = 'a_xmult', vars = { card.ability.extra.x_mult } },
          Xmult_mod = card.ability.extra.x_mult,
          card = card
        }
      end
    end
  end
}
return { name = {"Jokers"}, items = {fortunato} }

