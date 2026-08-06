local the_journey = {
    object_type = "Blind",
    key = 'the_journey',
    boss = {
        min = 3
    },
    mult = 2,
    boss_colour = HEX("fdd879"),
    atlas = 'blinds',
    pos = { X = 0, y = 40},
    order = 28,
    dollars = 5,

    loc_vars = function(self)
        return {
            vars = {G.GAME.current_round.aij_the_journey_blind and G.GAME.current_round.aij_the_journey_blind.selected_suit}
        }
    end,

    collection_loc_vars = function(self)
        return {
            vars = {'[X]'}
        }
    end,

    set_blind = function(self)
        G.aij_the_journey_stars = nil
    end,

    calculate = function(self, blind, context)
        local temp = G.GAME.blind and G.GAME.blind.disabled
        if temp then
            return
        end

        if context.individual and context.cardarea == G.play and G.GAME.current_round.aij_the_journey_blind and not temp then
            if context.other_card:is_suit(G.GAME.current_round.aij_the_journey_blind.selected_suit) then
                blind.triggered = true
            end
        end
        
        if context.all_in_jest and context.all_in_jest.before_after and not G.GAME.current_round.aij_the_journey_blind.triggered and not temp then
            local trigger = false
            for _, v in ipairs(context.scoring_hand) do
                if v:is_suit(G.GAME.current_round.aij_the_journey_blind.selected_suit) then
                    trigger = true
                    break
                end
            end
            if trigger then
                G.GAME.current_round.aij_the_journey_blind.triggered = true
                G.E_MANAGER:add_event(Event({
                    func = function()
                        G.GAME.win_ante = G.GAME.win_ante + 1
                        play_sound('gong', 0.4, 0.7)
                        attention_text({
                            scale = 1.0, text = localize{type='variable',key='a_aij_win_ante_plus',vars={1}}, hold = 4, align = 'cm', offset = {x = 0,y = -2.7},major = G.play
                        })

                        ease_background_colour_blind(G.STATE, "bl_aij_the_journey" or 'Small Blind')

                        return true
                    end
                }))
            end
        end
    end,
    defeat = function(self)
        if G.aij_the_journey_stars then G.aij_the_journey_stars:fade(1) end
        G.E_MANAGER:add_event(Event({trigger = 'after',delay = 1,blocking = false, blockable = false,
            func = function()
                if G.aij_the_journey_stars then 
                    G.aij_the_journey_stars:remove()
                    G.aij_the_journey_stars = nil
                end
                return true
            end
        }))
    end,
    in_pool = function(self)
        if G.GAME.round_resets.ante < (G.GAME.win_ante-1) and not G.GAME.won then
            return true
        end
    end,
}
return { name = {"Blinds"}, items = {the_journey} }