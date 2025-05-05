local fabled = {
    object_type = "Back",
    key = 'fabled',
    atlas = 'deck_atlas',
    order = 0,
    pos = { x = 0, y = 0 },
    unlocked = false,
	unlock_condition = {hidden = true},
    config = {
        joker_slot = -1
    },
    loc_vars = function(self)
        return {vars = {self.config.joker_slot}}
	end,
    locked_loc_vars = function(self, info_queue, card)
        if not self.unlocked then
            return {key = "b_aij_fabled_hidden"}
        end
	end,
    calculate = function(self, card, context)
        
    end,
    check_for_unlock = function(self, args)
        if args.type == 'discover_amount' and G.P_CENTER_POOLS then
            for i, v in ipairs(G.P_CENTER_POOLS["Joker"]) do
                if v.rarity == 4 and v.discovered then
                    return true
                end
            end
        end
        return false
    end,
    apply = function(self, back)
        G.GAME.jest_legendary_pool.in_shop = true
        G.GAME.jest_legendary_pool.rate = 0.992
    end
}
return {name = {"Decks"}, items = {fabled}}