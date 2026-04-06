local aureate = {
    object_type = "Tag",
    key = 'aureate', 
    pos = { x = 2, y = 1},
    atlas = 'tag_atlas',
    order = 4, -- Works because of alphabetical sorting of those with same order
    min_ante = 2,
    config = {type = 'store_joker_modify', edition = 'aij_aureate'},
    loc_vars = function(self, info_queue)
        info_queue[#info_queue+1] = G.P_CENTERS.e_aij_aureate
        return {}
    end,

    apply = function(self, tag, context)
        if context.type == 'store_joker_modify' then
            local applied = nil
            if not context.card.edition and not context.card.temp_edition and context.card.ability.set == 'Joker' then
                local lock = tag.ID
                G.CONTROLLER.locks[lock] = true

                context.card.temp_edition = true
                tag:yep('+', G.C.DARK_EDITION,function()
                    context.card:set_edition({aij_aureate = true}, true)
                    context.card.ability.couponed = true
                    context.card:set_cost()
                    context.card.temp_edition = nil
                    G.CONTROLLER.locks[lock] = nil
                    return true
                end)
                applied = true

                tag.triggered = true
            end
            return applied
        end
    end,
}
return {name = "Tags", items = {aureate}}