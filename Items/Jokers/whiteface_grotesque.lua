local whiteface_grotesque = {
    object_type = "Joker",
    order = 8,

    key = "whiteface_grotesque",
    config = {
      extra = {
          chip_mod = 3,
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
        if context.before then
            if G.hand and #G.hand.cards > 0 then
                for i = 1, #G.hand.cards do
                    if G.hand.cards[i]:is_face() and not context.blueprint then
                        SMODS.scale_card(card, {
	                        ref_table = card.ability.extra,
                            ref_value = "cur_chips",
	                        scalar_value = "chip_mod",
                            operation = '+',
                            no_message = true,
                        })
                    end
                end
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

