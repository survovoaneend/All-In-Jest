local the_elbow = {
    object_type = "Blind",
    key = 'the_elbow',
    boss = {
        min = 3,
    },
    mult = 2,
    boss_colour = HEX("d3c1c1"),
    atlas = 'blinds',
    pos = { X = 0, y = 44},
    order = 23,
    dollars = 5,


    calculate = function(self, blind, context)
        local temp = G.GAME.blind and G.GAME.blind.disabled
        if temp then
            return
        end
        if context.before and context.full_hand then
            blind.triggered = false
            local triggers = 0
            for _, scored_card in ipairs(context.full_hand) do
                if scored_card.config.center ~= G.P_CENTERS.c_base then
                    local cen_pool = {}
                    for _, v in ipairs(G.P_CENTER_POOLS["Enhanced"]) do
                        cen_pool[#cen_pool+1] = v
                    end
                    center = pseudorandom_element(cen_pool, pseudoseed('the_elbow'))
                    scored_card:set_ability(center, nil, true)
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            scored_card:juice_up(0.3, 0.3)
                            return true
                        end
                    }))
                    triggers = triggers + 1
                end
            end
            if triggers > 0 then
                blind.triggered = true
                G.E_MANAGER:add_event(Event({
                    func = function()
                        play_sound('tarot2')
                        blind:wiggle()
                        return true
                    end
                }))
                delay(0.5)
            end
        end
    end,
    in_pool = function(self)
        if G.playing_cards then
            local count = 0
            for k, v in ipairs(G.playing_cards) do
                if next(SMODS.get_enhancements(v)) then
                    count = count + 1
                end
            end
            return count >= 4
        end
    end,

}
return { name = {"Blinds"}, items = {the_elbow} }