local toto = {
    object_type = "Joker",
    order = 1011,

    key = "toto",
    config = {
      extra = {
          tags = 2,
      }
    },
    rarity = 4,
	unlock_condition = {hidden = true},
    pos = { x = 0, y = 2},
    atlas = 'legendary_atlas',
    cost = 20,
    unlocked = false,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = false,
    soul_pos = { x = 0, y = 3},
  
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.tags,
            }
        }
    end,
  
    calculate = function(self, card, context)
        if context.tag_added then 
            local _tag = context.tag_added
            if _tag.key ~= 'tag_double' and (not _tag.config.jest_tag_duplicate_trigger) then
                for i = 1, card.ability.extra.tags do
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        delay = 0.9,
                        func = function()
                            if _tag.ability and _tag.ability.orbital_hand then
                                G.orbital_hand = _tag.ability.orbital_hand
                            end
                            local temptag = Tag(_tag.key)
                            temptag.config.jest_tag_duplicate_trigger = true
                            add_tag(temptag)
                            G.orbital_hand = nil
                            return true
                        end
                    }))
                end
            end
        end
    end
  
}
return { name = {"Jokers"}, items = {toto} }
