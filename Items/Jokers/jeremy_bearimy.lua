local jeremy_bearimy = {
    object_type = "Joker",
    order = 512,
    key = "jeremy_bearimy",
    config = {
        extra = {
            
        }
    },
    attributes = { 'retrigger', 'joker' },
    rarity = 2,
    pos = { x = 22, y = 24 },
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,

    pixel_size = { w = 55, h = 93 },

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                
            }
        }
    end,

    --calculate = function(self, card, context)
    --    if context.retrigger_joker_check and not context.retrigger_joker then
    --        local other_context = context.other_context
    --        if other_context.setting_blind then
    --            return {
    --                repetitions = 1,
    --            }
    --        end
    --        if other_context.end_of_round and other_context.main_eval then
    --            return {
    --                repetitions = 1,
    --            }
    --        end
    --    end
    --end

    calculate = function(self, card, context)
      if context.setting_blind then
          if not context.j_aij_jeremy_bearimy_triggered then
              context.j_aij_jeremy_bearimy_triggered = true
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
      if context.end_of_round and context.main_eval then
          if not context.j_aij_jeremy_bearimy_triggered then
              context.j_aij_jeremy_bearimy_triggered = true
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
}

return { name = { "Jokers" }, items = { jeremy_bearimy } }
