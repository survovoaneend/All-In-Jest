local golden_string = {
    object_type = "Blind",
    key = 'golden_string',
    boss = {
      min = 1,
      showdown = true,
    },
    in_pool = function(self)
        return true
    end,
    mult = 2,
    attributes = {'lose_economy', 'debuff'},
    boss_colour = HEX("efb855"),
    atlas = 'blinds_final',
    pos = { y = 11},
    order = 1012,
    dollars = 8,

    recalc_debuff = function(self, card, from_blind)
        local temp = G.GAME.blind and G.GAME.blind.disabled
        if temp then
            return false
        end
        if card.area ~= G.jokers then
            if to_big(G.GAME.dollars) <= to_big(0) then
                self.triggered = true
                G.GAME.golden_string_recalc_debuff = true
                return true
            else
                return false
            end
        end
    end,

    calculate = function(self, blind, context)
        local temp = G.GAME.blind and G.GAME.blind.disabled
        if temp then
            return
        end
        if not temp and to_big(G.GAME.dollars) <= to_big(0) then
            if G.GAME.golden_string_recalc_debuff and G.GAME.blind then
                G.GAME.golden_string_recalc_debuff = nil
                for _, v in ipairs(G.playing_cards) do
                    if G.GAME.blind.config.blind:recalc_debuff(v, nil) then
                        v:set_debuff(true)
                        if v.debuff then v.debuffed_by_blind = true end
                    else
                        v:set_debuff(false)
                    end
                end
            end
        elseif not temp and to_big(G.GAME.dollars) > to_big(0) then
            G.GAME.golden_string_recalc_debuff = true
        end
    end,

    press_play = function(self)
        local temp = G.GAME.blind and G.GAME.blind.disabled
        if temp then
            return
        end
        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.2, func = function()
        for i = 1, #G.play.cards do
            G.E_MANAGER:add_event(Event({func = function() G.play.cards[i]:juice_up(); return true end })) 
            ease_dollars(-2)
            delay(0.23)
        end
        return true end })) 
        return true
    end,

    defeat = function(self)
        G.GAME.golden_string_recalc_debuff = nil
    end
}
return { name = {"Finisher Blinds"}, items = {golden_string} }
