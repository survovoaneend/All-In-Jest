local pierrette = {
  object_type = "Joker",
  order = 103,
  lite = true,
  key = "pierrette",
  config = {

  },
  attributes = { 'retrigger', 'discard' },
  rarity = 2,
  pos = { x = 20, y = 3 },
  atlas = 'joker_atlas',
  cost = 5,
  unlocked = true,
  discovered = false,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = true,

  loc_vars = function(self, info_queue, card)

  end,

  -- Don't know what was wrong with this, just reverting for now.
  calculate = function(self, card, context)
      if context.discard then
          if not context.j_aij_pierrette_triggered then
              context.j_aij_pierrette_triggered = true
              local ret = SMODS.calculate_context(context)
              if ret.calculated then
                  return {
                      message = localize('k_again_ex'),
                      colour = G.C.FILTER,
                      card = context.blueprint_card or card
                  }
              end
          end
      end
      if context.pre_discard then
          if not context.j_aij_pierrette_triggered then
              context.j_aij_pierrette_triggered = true
              local ret = SMODS.calculate_context(context)
              if ret.calculated then
                  return {
                      message = localize('k_again_ex'),
                      colour = G.C.FILTER,
                      card = context.blueprint_card or card
                  }
              end
          end
      end
  end

  --calculate = function(self, card, context)
  --  if context.discard and not context.retrigger_joker then
  --    -- Doing seals manually because SMODS doesn't let us retrigger them on discard
  --    -- Remember to update this when SMODS inevitably fixes this
  --    local _, calculated = context.other_card:calculate_seal(context)
  --    if calculated then
  --      card_eval_status_text(context.blueprint_card or card, 'extra', nil, percent, nil, {message = localize('k_again_ex'), colour = G.C.FILTER})
  --      percent = (percent or 0) + (percent_delta or 0.08)
  --      -- return {
  --      --   message = localize("k_again_ex"),
  --      --   colour = G.C.FILTER,
  --      --   card = context.blueprint_card or card
  --      -- }
  --    end
  --  end
  --  if context.retrigger_joker_check and not context.retrigger_joker then
  --    local other_context = context.other_context
  --    if other_context.discard then
  --      return {
  --        repetitions = 1,
  --      }
  --    end
  --    if other_context.pre_discard then
  --      return {
  --        repetitions = 1,
  --      }
  --    end
  --  end
  --end

}
return { name = { "Jokers" }, items = { pierrette } }
