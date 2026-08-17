local flushed_face = {
    object_type = "Joker",
    order = 990,
    
    key = "flushed_face",
    config = {
        extra = {
            mult = 0,
            mult_mod = 1
        }
    },
    attributes = {},
    rarity = 1,
    pos = { x = 14, y = 45},
    atlas = 'joker_atlas',
    cost = 5,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,

    loc_vars = function(self, info_queue, card)
        return { 
            vars = {
                card.ability.extra.mult_mod,
                card.ability.extra.mult
            }
        }
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and not context.blueprint then
      if context.poker_hands and next(context.poker_hands['Flush']) and context.other_card:is_face() then
        SMODS.scale_card(card, {
          ref_table = card.ability.extra,
          ref_value = "mult",
          scalar_value = "mult_mod",
          operation = function(ref_table, ref_value, initial, change)
            ref_table[ref_value] = initial + change
          end,
          no_message = true,
        })

        return {
          extra = { focus = card, message = localize('k_upgrade_ex') },
          card = card
        }
      end
    end
    if context.joker_main then
      if card.ability.extra.mult > 0 then
        return {
          mult = card.ability.extra.mult
        }
      end
    end
    end
}
return { name = {"Jokers"}, items = {flushed_face} }