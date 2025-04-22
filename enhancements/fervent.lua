SMODS.Enhancement {
    key = 'fervent',
    atlas = 'enhancements_atlas',
    pos = { x = 0, y = 0 },
    config = {
        bonus = 0,
        extra = {
            chips_extra = 10,
        }
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.bonus,
                card.ability.extra.chips_extra,
            }
        }
    end,
    calculate = function(self, card, context)
        if context.cardarea == G.play and context.main_scoring then
            card.ability.bonus = card.ability.bonus + card.ability.extra.chips_extra
            return {
                extra = { message = localize('k_upgrade_ex'), colour = G.C.CHIPS },
                card = card
            }
        end
    end
}
