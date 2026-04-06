local hofnarr_the_barbarian = {
    object_type = "Joker",
    order = 222,

    key = "hofnarr_the_barbarian",
    config = {
        extra = {
            mult = 10,
            xmult = 10
        }
    },
    rarity = 2,
    pos = { x = 11, y = 8},
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = {set = 'Other', key = 'showdown_blind', vars = {G.GAME.win_ante}}
        return { vars = {card.ability.extra.mult, card.ability.extra.xmult} }
    end,

    calculate = function(self, card, context)
        if context.setting_blind and not self.getting_sliced and context.blind.boss and context.blind.boss.showdown and not context.blueprint then
            G.E_MANAGER:add_event(Event({
                func = function()
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            G.GAME.blind:disable()
                            play_sound('timpani')
                            delay(0.4)
                            return true
                        end }))
                    card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize('ph_boss_disabled')})
                return true
            end }))

        end
        if context.joker_main then
            if G.GAME.blind:get_type() == 'Boss' and G.GAME.blind.config.blind.boss and G.GAME.blind.config.blind.boss.showdown then
                return {
                    mult = card.ability.extra.mult,
                    xmult = card.ability.extra.xmult,
                }
            else
                return {
                    mult = card.ability.extra.mult,
                }
            end
        end
    end
}
return { name = {"Jokers"}, items = {hofnarr_the_barbarian} }
