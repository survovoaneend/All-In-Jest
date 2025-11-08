local taggart = {
    object_type = "Joker",
    order = 262,
    
    key = "taggart",
    config = {
      extra = {
          tags = 1,
      }
    },
    rarity = 3,
    pos = { x = 10, y = 10},
    atlas = 'joker_atlas',
    cost = 8,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
  
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
                delay(0.9)
                for i = 1, card.ability.extra.tags do
                    G.E_MANAGER:add_event(Event({
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
                return {
                    message = localize("k_aij_double_ex")
                }
            end
        end
    end
  
}
return { name = {"Jokers"}, items = {taggart} }
