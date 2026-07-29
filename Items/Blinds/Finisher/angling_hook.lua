local angling_hook = {
    object_type = "Blind",
    key = 'angling_hook',
    boss = {
      min = 1,
      showdown = true,
    },
    in_pool = function(self)
        return true
    end,
    mult = 2,
    boss_colour = HEX("9b4e64"),
    ignore = true,
    atlas = 'blinds_final',
    pos = { y = 24},
    order = 1025,
    dollars = 8,

    set_blind = function(self)
        local temp = G.GAME.blind and G.GAME.blind.disabled
        if temp then
            return
        end
        G.E_MANAGER:add_event(Event({
            trigger = 'immediate',
            func = function()
                local i = 0
                for k, v in ipairs(G.playing_cards) do
                    if v.ability.played_this_ante or v.ability.aij_discarded_this_ante then
                        i = i + 1
                        draw_card(v.area, G.discard, i*100/#G.deck.cards,'up', nil, v, 0.005, i%2==0, nil, math.max((21-i)/20,0.7))
                    end
                end
                return true
            end
        }))
    end,
}
return { name = {"Finisher Blinds"}, items = {angling_hook} }