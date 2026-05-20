local haughty_joker = {
    object_type = "Joker",
    order = 544,
    key = "haughty_joker",
    
    config = {
        extra = {
            chips = 1000
        }
    },
    rarity = 1,
    pos = { x = 2, y = 26 },
    atlas = 'joker_atlas',
    cost = 5,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.chips
            }
        }
    end,

    calculate = function(self, card, context)
        if context.joker_main and context.poker_hands and next(context.poker_hands['aij_Royal Flush']) then
            return {
                chips = card.ability.extra.chips
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

return { name = { "Jokers" }, items = { haughty_joker } }
