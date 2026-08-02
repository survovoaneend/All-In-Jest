local the_loan = {
    object_type = "Blind",
    key = 'the_loan',
    
    boss = {
        min = 4,
    },
    mult = 2,
    boss_colour = HEX("e8a94f"),
    atlas = 'blinds',
    pos = { X = 0, y = 70},
    order = 71,
    dollars = 5,

    calculate = function(self, blind, context)
        local temp = G.GAME.blind and G.GAME.blind.disabled
        if temp then
            return
        end

        if context.before and G.hand.cards and not temp then
            for i = 1, #G.play.cards do
                if G.play.cards[i].config.center ~= G.P_CENTERS.c_base or G.play.cards[i].edition ~= nil or G.play.cards[i].seal ~= nil  then
                    blind.triggered = true
                    break
                end
            end
        end

        if context.all_in_jest and context.all_in_jest.before_after then
            local chipsthing = G.GAME.chips + context.total_chips >= G.GAME.blind.chips
            if chipsthing then
                G.E_MANAGER:add_event(Event({
                    func = function()
                        blind:wiggle()
                        return true
                    end
                }))
                for i = 1, #context.full_hand do
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        delay = 0.15,
                        func = function()
                            context.full_hand[i]:set_rental(true)
                            context.full_hand[i]:juice_up(0.3, 0.3)
                            return true
                        end
                    }))
                end
                blind.triggered = false
            end
        end
    end
}
return { name = {"Blinds"}, items = {the_loan} }