local recherche_tag = {
    object_type = "Tag",
    key = 'recherche',

    pos = { x = 7, y = 1 },
    atlas = 'tag_atlas',
    config = {
        aij = {
            upgrade = 'rare',
        },
        extra = {
            rarity = 'Rare',
            sticker = 'aij_recherche_doubled'
        }
    },

    discovered = false,
    order = 2,
    min_ante = 3,

    loc_vars = function(self, info_queue)
    end,

    apply = function(self, tag, context)
        -- Reusing unusual tag code since its the exact same
        return G.P_TAGS["tag_aij_unusual"].apply(self, tag, context)
    end,
}
return {name = "Tags", items = {recherche_tag}}
