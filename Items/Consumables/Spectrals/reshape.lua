local reshape = {
    object_type = "Consumable",
	key = 'reshape',
	set = 'Spectral',
    atlas = 'consumable_atlas',
	pos = { x = 7, y = 6 },
	cost = 4,
	unlocked = true,
	discovered = false,
    order = 9,
	config ={},
    can_use = function(self, card)
        if G.jokers and G.jokers.cards and #G.jokers.cards > 1 then 
            return true 
        end
        return false
    end,
	use = function(self, card, area, copier)
        local _card = pseudorandom_element(G.jokers.cards, pseudoseed('reshape'))
        for k, v in ipairs(G.jokers.cards) do
            if v ~= _card then
                All_in_Jest.reroll_joker(v, _card.config.center.key, 'reshape', nil, _card)
            end
        end
    end,
}
return {name = {"Spectrals"}, items = {reshape}}