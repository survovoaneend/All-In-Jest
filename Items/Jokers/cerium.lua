local cerium = {
    object_type = "Joker",
    order = 591.91,

    key = "cerium",
    config = {
        extra = {
            retriggers = 2
        }
    },
    attributes = { 'retrigger', 'hand_type' },
    rarity = 2,
    pos = { x = 20, y = 32},
    atlas = 'joker_atlas',
    cost = 7,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.retriggers
            }
        }
    end,

    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.play and context.scoring_name == "Flush House" then
            return {
                repetitions = card.ability.extra.retriggers
            }
        end
    end,

    in_pool = function(self, args)
		local hand = G.GAME.hands['Flush House']
		if hand.played > 0 then
			return true
		end
		return false
    end,
}
return { name = {"Jokers"}, items = {cerium} }