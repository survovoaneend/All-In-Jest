local silver = {
    object_type = "Tag",
    key = 'silver', 
    pos = { x = 1, y = 1},
    atlas = 'tag_atlas',
    order = 2, -- Works because of alphabectical sorting of those with same order
    config = {type = 'store_joker_modify', edition = 'aij_silver'},
    loc_vars = function(self, info_queue)
        info_queue[#info_queue+1] = G.P_CENTERS.e_aij_silver
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
                    context.card:set_edition({aij_silver = true}, true)
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
return {name = "Tags", items = {silver}}