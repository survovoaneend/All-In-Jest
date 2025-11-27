local glamour_tag = {
    object_type = "Tag",
    key = 'glamour',

    pos = { x = 8, y = 4 },
    atlas = 'tag_atlas',
    config = {
        aij = {
            upgrade = 'aij_glimmer',
        }
    },

    discovered = false,
    order = 27,
    min_ante = 3,

    loc_vars = function(self, info_queue)
    end,

    apply = function(self, tag, context)
        if context.type == 'immediate' then
            tag:jest_apply("+", G.C.ATTENTION, function()
                local jokers = {}
                for i = 1, #G.jokers.cards do
                    if G.jokers.cards[i].edition == nil then
                        table.insert(jokers, G.jokers.cards[i])
                    end
                end
                local joker = pseudorandom_element(jokers, pseudoseed('jest_glamour_tag'))
                for i = 1, #jokers do
                    if jokers[i] == joker then
                        table.remove(jokers, i)
                    end
                end
                local joker2 = pseudorandom_element(jokers, pseudoseed('jest_glamour_tag'))
                local edition = {aij_glimmer = true}
                if joker then
                    joker:set_edition(edition, true)
                end
                if joker2 then
                    joker2:set_edition(edition, true)
                end
                return true
			end,
            function() 
                if #G.jokers.cards > 0 then
                    local ad_jokers = 0 
                    for i = 1, #G.jokers.cards do
                        if G.jokers.cards[i].edition == nil then
                            ad_jokers = ad_jokers + 1
                        end
                    end
                    if ad_jokers >= 1 then
                        return true
                    end
                end
                return false
            end)
            tag.triggered = true
            return true
        end
    end,
    in_pool = function(self, args)
        if G.GAME then
            if G.GAME.selected_back.effect.center.key ~= 'b_plasma' then
                return true
            end
        end
        return false
    end,
}
return {name = "Tags", items = {glamour_tag}}
