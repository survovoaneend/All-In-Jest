local whiteface_grotesque = {
    object_type = "Joker",
    order = 8,

    key = "whiteface_grotesque",
    config = {
      extra = {
          chip_mod = 2,
          cur_chips = 0
      }
    },
    rarity = 1,
    pos = { x = 7, y = 0 },
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
        if context.individual and context.cardarea == G.hand and not context.end_of_round
        and not context.blueprint then
            if context.other_card:is_face() then
                SMODS.scale_card(card, {
                    ref_table = card.ability.extra,
                    ref_value = "cur_chips",
                    scalar_value = "chip_mod",
                    no_message = true,
                })
                return {
                    message = localize('k_upgrade_ex'),
                    message_card = card,
                    delay = 0.2,
                }
            end
        end
        if context.joker_main then
            if card.ability.extra.cur_chips > 0 then
                return {
                    chips = card.ability.extra.cur_chips
                }
            end
        end
    end
  
}
return { name = {"Jokers"}, items = {whiteface_grotesque} }

