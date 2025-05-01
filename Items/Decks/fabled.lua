local fabled = {
    object_type = "Back",
    key = 'fabled',
    atlas = 'deck_atlas',
    order = 0,
    pos = { x = 0, y = 0 },
    config = {
        joker_slot = -1
    },
    loc_vars = function(self)
        return {vars = {self.config.joker_slot}}
	end,
    calculate = function(self, card, context)
        
    end,
    apply = function(self, back)
        G.GAME.jest_legendary_pool.in_shop = true
        G.GAME.jest_legendary_pool.rate = 0.992
    end
}
return {name = {"Decks"}, items = {fabled}}