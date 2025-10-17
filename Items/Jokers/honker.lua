local honker = {
    object_type = "Joker",
    order = 134,

    key = "honker",
    config = {
      extra = {
          mult_mod = 1,
          cur_mult = 0
      }
    },
    rarity = 2,
    pos = { x = 3, y = 5 },
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.m_mult
        return {
            vars = {
                card.ability.extra.mult_mod,
                card.ability.extra.cur_mult,
            }
        }
    end,
  
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            if SMODS.get_enhancements(context.other_card).m_mult then
                SMODS.scale_card(card, {
	                ref_table = card.ability.extra,
                    ref_value = "cur_mult",
	                scalar_value = "mult_mod",
                })
            end
        end
        if context.joker_main then
            if card.ability.extra.cur_mult > 0 then
                return {
                    mult = card.ability.extra.cur_mult
                }
            end
        end
    end,

    in_pool = function(self, args)
        if G.deck then
            if #G.deck.cards > 0 then
                for i = 1, #G.deck.cards do
                    if SMODS.get_enhancements(G.deck.cards[i]).m_mult then
                        return true
                    end
                end
            end
        end
        return false
    end,
  
}
return { name = {"Jokers"}, items = {honker} }
