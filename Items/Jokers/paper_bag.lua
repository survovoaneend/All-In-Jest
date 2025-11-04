local paper_bag = {
    object_type = "Joker",
    order = 44,

    key = "paper_bag",
    config = {
      extra = {
          chip_mod = 2,
          cur_chips = 0
      }
    },
    rarity = 1,
    pos = { x = 16, y = 1 },
    atlas = 'joker_atlas',
    cost = 4,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,
  
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.chip_mod,
                card.ability.extra.cur_chips,
            }
        }
    end,
  
    calculate = function(self, card, context)
        if context.pre_discard and not context.blueprint then
            local text,disp_text = G.FUNCS.get_poker_hand_info(G.hand.highlighted)
            SMODS.scale_card(card, {
	            ref_table = card.ability.extra,
                ref_value = "cur_chips",
	            scalar_value = "chip_mod",
                operation = function(ref_table, ref_value, initial, change)
	                ref_table[ref_value] = initial + (G.GAME.hands[text].level * change)
                end,
            })
        end
        if context.joker_main then
            if to_big(card.ability.extra.cur_chips) > to_big(0) then
                return {
                    chips = card.ability.extra.cur_chips
                }
            end
        end
    end,

    joker_display_def = function(JokerDisplay)
        ---@type JDJokerDefinition
        return {
            text = {
                { text = "+" },
                { ref_table = "card.ability.extra", ref_value = "cur_chips", retrigger_type = "mult" }
            },
            text_config = { colour = G.C.CHIPS },
        }
    end
  
}
return { name = {"Jokers"}, items = {paper_bag} }
