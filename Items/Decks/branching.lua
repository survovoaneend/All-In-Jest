local branching = {
    object_type = "Back",
    key = 'branching',
    atlas = 'deck_atlas',
    order = 1,
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
    apply = function(self, back)
        G.GAME.all_in_jest.blind_tags.has_multiple = true
    end
}
return {name = {"Decks"}, items = {branching}}