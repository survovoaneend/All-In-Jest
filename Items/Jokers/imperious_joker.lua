local imperious_joker = {
    object_type = "Joker",
    order = 545,
    key = "imperious_joker",
    
    config = {
        extra = {
            mult = 120
        }
    },
    rarity = 1,
    pos = { x = 3, y = 26 },
    atlas = 'joker_atlas',
    cost = 5,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = false,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.mult
            }
        }
    end,

    calculate = function(self, card, context)
        if context.joker_main and context.poker_hands and next(context.poker_hands['aij_Royal Flush']) then
            return {
                mult = card.ability.extra.mult
            }
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

return { name = { "Jokers" }, items = { imperious_joker } }
