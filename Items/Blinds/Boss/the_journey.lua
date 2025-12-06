local the_journey = {
    object_type = "Blind",
    key = 'the_journey',
    boss = {
        min = 3
    },
    mult = 2,
    boss_colour = HEX("fdd879"),
    atlas = 'blinds',
    pos = { X = 0, y = 56},
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
        
        if context.all_in_jest and context.all_in_jest.before_after and G.GAME.current_round.aij_the_journey_blind and not temp then
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
                        G.GAME.blind:disable()
                        G.GAME.win_ante = G.GAME.win_ante + 1
                        return true
                    end
                }))
            end
        end
    end,
    defeat = function(self)
        self.boss.selected_suit = '[X]'
    end,
    in_pool = function(self)
        if G.GAME.round_resets.ante < (G.GAME.win_ante-1) and not G.GAME.won then
            return true
        end
    end,
}
return { name = {"Blinds"}, items = {the_journey} }