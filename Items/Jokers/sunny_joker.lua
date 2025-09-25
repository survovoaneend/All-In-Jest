local sunny_joker = {
    object_type = "Joker",
    order = 103,

    key = "sunny_joker",
    config = {
      extra = {
          perma_mult = 0.2
      }
    },
    rarity = 2,
    pos = { x = 23, y = 3 },
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.perma_mult,
            }
        }
    end,
  
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            if context.poker_hands and next(context.poker_hands['aij_Royal Flush']) then
                context.other_card.ability.perma_x_mult = context.other_card.ability.perma_x_mult or 0
                context.other_card.ability.perma_x_mult = context.other_card.ability.perma_x_mult + card.ability.extra.perma_mult
                return {
                    extra = { message = localize('k_upgrade_ex'), colour = G.C.MULT },
                    card = context.blueprint_card or card
                }
            end
        end
    end,

    in_pool = function(self, args)
		local hand = G.GAME.hands['aij_Royal Flush']
		if hand.played > 0 then
			return true
		end
		return false
    end,
  
}
return { name = {"Jokers"}, items = {sunny_joker} }
