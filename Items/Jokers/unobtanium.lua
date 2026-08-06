local unobtanium = {
    object_type = "Joker",
    order = 590,

    key = "unobtanium",
    config = {

    },
    attributes = {},
    rarity = 3,
    pos = { x = 23, y = 32},
    atlas = 'joker_atlas',
    cost = 9,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,

    loc_vars = function(self, info_queue, card)
        return { }
    end,

    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.play and context.scoring_name == "Five of a Kind" then
            return {
                repetitions = 1
            }
        end
    end,

    in_pool = function(self, args)
		local hand = G.GAME.hands['Five of a Kind']
		if hand.played > 0 then
			return true
		end
		return false
    end,
}
return { name = {"Jokers"}, items = {unobtanium} }