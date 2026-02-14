local branching = {
    object_type = "Back",
    key = 'branching',
    atlas = 'deck_atlas',
    order = 1,
    lite = true,
    pos = { x = 1, y = 0 },
    unlocked = false,
	unlock_condition = {hidden = true},
    config = {
        extra = {
            
        }
    },
    loc_vars = function(self)
        return {vars = {}}
	end,
    locked_loc_vars = function(self, info_queue, card)
        if not self.unlocked then
            return {key = "b_aij_branching_hidden"}
        end
	end,
    check_for_unlock = function(self, args)
        if args.type == 'skip_count' and G.GAME then
            if G.GAME.skips and G.GAME.skips >= 5 then
                return true
            end
        end
    end,
    apply = function(self, back)
        G.GAME.all_in_jest.blind_tags.has_multiple = true
        G.GAME.all_in_jest.blind_tags.amt = G.GAME.all_in_jest.blind_tags.amt + 2
    end
}
return {name = {"Decks"}, items = {branching}}