local infamous_machine = {
    object_type = "Joker",
    order = 357,
    key = "infamous_machine",
    config = {
        extra = {
            mult_mod = 5,
            mult = 0
        }
    },
    rarity = 3,
    pos = { x = 16, y = 19},
    atlas = 'joker_atlas',
    cost = 8,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.mult_mod,
                card.ability.extra.mult
            }
        }
    end,
  
    calculate = function(self, card, context)
        if context.first_hand_drawn and G.hand and not context.blueprint then
            SMODS.destroy_cards(G.hand.cards[1])
            SMODS.scale_card(card, {
	            ref_table = card.ability.extra,
                ref_value = "mult",
	            scalar_value = "mult_mod",
                message_key = 'a_mult'
            })
        end
        if context.joker_main then
            local mult = card.ability.extra.mult
            if mult > 0 then
                return {
                    mult = mult,
                }
            end
        end
    end
  
}
return { name = {"Jokers"}, items = {infamous_machine} }
