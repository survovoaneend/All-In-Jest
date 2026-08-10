local neutronium = {
    object_type = "Joker",
    order = 592.92,

    key = "neutronium",
    config = {

    },
    attributes = {},
    rarity = 3,
    pos = { x = 21, y = 32},
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
        if context.repetition and context.cardarea == G.play and context.scoring_name == "Flush Five" then
            return {
                repetitions = 1
            }
        end
    end,
    in_pool = function(self, args)
		local hand = G.GAME.hands['Flush Five']
		if hand.played > 0 then
			return true
		end
		return false
    end,
}
return { name = {"Jokers"}, items = {neutronium} }