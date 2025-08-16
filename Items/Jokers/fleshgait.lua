local fleshgait = {
    object_type = "Joker",
    order = 364,
    key = "fleshgait",
    config = {
    },
    rarity = 2,
    pos = { x = 13, y = 14},
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)

    end,
  
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            if not card.ability.patches or (card.ability.patches and next(card.ability.patches) == nil) then
                local keys = {}
		        for k, v in pairs(SMODS.Suits) do
			        keys[#keys+1] = k
		        end
		        local cur_suit = pseudorandom_element(keys, pseudoseed('fleshgait'))
                All_in_Jest.add_patch(context.other_card, cur_suit)
            end
        end
    end
  
}
return { name = {"Jokers"}, items = {fleshgait} }
