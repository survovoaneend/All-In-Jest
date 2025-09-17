local patchwork = {
    object_type = "Back",
    key = 'patchwork',
    atlas = 'deck_atlas',
    order = 3,
    pos = { x = 3, y = 0 },
    unlocked = false,
	unlock_condition = {hidden = true},
    config = {
    
    },
    loc_vars = function(self)
        return {vars = {}}
	end,
    locked_loc_vars = function(self, info_queue, card)
        if not self.unlocked then
            return {key = "b_aij_patchwork_hidden"}
        end
	end,
    check_for_unlock = function(self, args)
        if args.type == 'add_patch' and G.playing_cards then
            local count = 0
            for k, v in pairs(G.playing_cards) do
                if v.ability and v.ability.patches then
                    count = count + 1
                end
            end
            if count >= 13 then
                return true
            end
        end
    end,
}
return {name = {"Decks"}, items = {patchwork}}