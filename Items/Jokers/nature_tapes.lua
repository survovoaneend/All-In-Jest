local nature_tapes = {
    object_type = "Joker",
    order = 71,
    ignore = not All_in_Jest.config.moons_enabled,
    key = "nature_tapes",
    config = {
      extra = {
          cur_xmult = 1,
          xmult_mod = 0.2
      }
    },
    rarity = 3,
    pos = { x = 17, y = 2 },
    atlas = 'joker_atlas',
    cost = 8,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.xmult_mod,
                card.ability.extra.cur_xmult,
            }
        }
    end,
  
    calculate = function(self, card, context)
        if context.using_consumeable and not context.blueprint then
            if context.consumeable.ability.set == 'Planet' and context.consumeable.config.center.config.mult then
                SMODS.scale_card(card, {
	                ref_table = card.ability.extra,
                    ref_value = "cur_xmult",
	                scalar_value = "xmult_mod",
                })
            end
        end
        if context.joker_main then
            if card.ability.extra.cur_xmult > 1 then
                return {
                    xmult = card.ability.extra.cur_xmult
                }
            end
        end
    end,

    joker_display_def = function(JokerDisplay)
        ---@type JDJokerDefinition
        return {
            text = {
                {
                    border_nodes = {
                        { text = "X" },
                        { ref_table = "card.ability.extra", ref_value = "cur_xmult", retrigger_type = "exp" }
                    }
                }
            },
        }
    end
  
}
return { name = {"Jokers"}, items = {nature_tapes} }
