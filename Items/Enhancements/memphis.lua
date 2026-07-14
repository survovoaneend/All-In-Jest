local memphis = {
    object_type = "Enhancement",
    key = 'memphis',
    atlas = 'enhancements_atlas',
    order = 8,
    pos = { x = 6, y = 5 },
    ignore = true,
    config = {
        extra = {
            x_mult = 1,
            x_mult_mod = 0.05
        }
    },
    all_in_jest = {
        multi_enhancement_z_order = -2
    },
    loc_vars = function(self, info_queue, card)
        card.ability.extra.x_mult = (G.GAME.skips * card.ability.extra.x_mult_mod) + 1
        return {
            vars = {
                card.ability.extra.x_mult_mod,
                card.ability.extra.x_mult
            }
        }
    end,
    calculate = function(self, card, context)
        if context.skip_blind then
            card.ability.extra.x_mult = (G.GAME.skips * card.ability.extra.x_mult_mod) + 1
        end
        if context.cardarea == G.play and context.main_scoring then
            card.ability.extra.x_mult = (G.GAME.skips * card.ability.extra.x_mult_mod) + 1
            return {
                x_mult = card.ability.extra.x_mult
            }
        end
    end,

    in_pool = function(self, args)
        if G.GAME then
            if G.GAME.all_in_jest and G.GAME.all_in_jest.weird_enhancements then
                return true
            end
        end
        return false
    end,
}

return {name = {"Enhancements"}, items = {memphis}}