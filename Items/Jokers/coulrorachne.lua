local coulrorachne = {
    object_type = "Joker",
    order = 343,
    key = "coulrorachne",
    config = {
      extra = {
        mult_mod = 8,
        cur_mult = 0,
        eight_count = 0,
        amt_mod = 8,
      }
    },
    rarity = 1,
    pos = { x = 14, y = 13},
    atlas = 'joker_atlas',
    cost = 4,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.mult_mod,
                card.ability.extra.cur_mult,
                card.ability.extra.eight_count,
                card.ability.extra.amt_mod,
            }
        }
    end,
  
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            if context.other_card:get_id() == 8 then
                card.ability.extra.eight_count = card.ability.extra.eight_count + 1
                if card.ability.extra.eight_count >= card.ability.extra.amt_mod then
                    card.ability.extra.eight_count = 0
                    SMODS.scale_card(card, {
	                    ref_table = card.ability.extra,
                        ref_value = "cur_mult",
	                    scalar_value = "mult_mod",
                        operation = '+',
                        scaling_message = {
	                        message = localize('k_upgrade_ex'),
	                        colour = G.C.FILTER
                        }
                    })
                end
            end
        end
        if context.joker_main then
            if card.ability.extra.cur_mult > 0 then
                return {
                    mult = card.ability.extra.cur_mult
                }
            end
        end
    end
  
}
return { name = {"Jokers"}, items = {coulrorachne} }
