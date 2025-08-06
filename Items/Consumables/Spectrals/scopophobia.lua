local scopophobia = {
    object_type = "Consumable",
	key = 'scopophobia',
	set = 'Spectral',
    atlas = 'consumable_atlas',
	pos = { x = 0, y = 7 },
	cost = 4,
	unlocked = true,
	discovered = false,
    order = 8,
	config ={},
    can_use = function(self, card)
        if G.hand and G.hand.cards and #G.hand.cards > 0 then
            if G.jokers and G.jokers.cards and #G.jokers.cards > 0 then 
                return true 
            end
        end
        return false
    end,
	use = function(self, card, area, copier)
        local _card = pseudorandom_element(G.jokers.cards, pseudoseed('scopophobia'))
        for k, v in ipairs(G.hand.cards) do
            v:start_dissolve()
        end
        _card:start_dissolve()
    end,
}
return {name = {"Spectrals"}, items = {scopophobia}}