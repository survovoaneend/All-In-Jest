local omnichrome_tag = {
    object_type = "Tag",
    key = 'omnichrome',

    pos = { x = 9, y = 3 },
    atlas = 'tag_atlas',
    config = {
        aij = {
            upgrade = 'polychrome',
        }
    },

    discovered = false,
    order = 6,
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
                if #jokers > 0 then
                  local joker = jokers[#jokers]
                  local edition = {polychrome = true}
                  joker:set_edition(edition, true)
                end
                return true
			end,
            function() 
                if #G.jokers.cards > 0 then
                    for i = 1, #G.jokers.cards do
                        if G.jokers.cards[i].edition == nil then
                            return true
                        end
                    end
                end
                return false
            end)
            tag.triggered = true
            return true
        end
    end,
}
return {name = "Tags", items = {omnichrome_tag}}
