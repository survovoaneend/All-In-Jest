local providence = {
    object_type = "Consumable",
	key = 'providence',
	set = 'Spectral',
    atlas = 'consumable_atlas',
	pos = { x = 17, y = 8 },
	ignore = true,
	cost = 4,
	unlocked = true,
	discovered = false,
    order = 14,
    config = { extra = { }},
	loc_vars = function(self, info_queue, card)
		info_queue[#info_queue+1] = {set = 'Tag', key = 'tag_aij_astrology'}
		return {}
	end,
	can_use = function(self, card)
        return true
    end,
	use = function(self, card)
		local tag_name = localize{type = 'name_text', set = 'Tag', key = 'tag_aij_astrology'}
        add_tag(Tag('tag_aij_astrology'))
        play_sound('tarot1') 
        card_eval_status_text(card, 'extra', nil, nil, nil, {
            message = '+'..tag_name, 
        })
    end,
}
return {name = {"Spectrals"}, items = {providence}}