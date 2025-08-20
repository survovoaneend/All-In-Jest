local the_storm = {
    object_type = "Blind",
    key = 'the_storm',
    boss = {
        min = 3,
    },
    mult = 2,
    boss_colour = HEX("b48b52"),
    atlas = 'blinds',
    pos = { X = 0, y = 53},
    order = 37,
    dollars = 5,


    calculate = function(self, card, context)
        local temp = G.GAME.blind and G.GAME.blind.disabled
        if temp then
            return
        end
        if context.after and context.full_hand and context.scoring_hand and not temp then
            local total_cards = {}
            for i = 1, #context.full_hand do
                local scoring = false
                for j = 1, #context.scoring_hand do
                    if context.full_hand[i] == context.scoring_hand[j] then
                        scoring = true
                    end
                end
                if not scoring then
                    total_cards[#total_cards+1] = context.full_hand[i]
                end
            end
            if #total_cards > 0 then
                for i = 1, #total_cards do
                    G.E_MANAGER:add_event(Event({
                        trigger = 'before',
                        func = function()
                            total_cards[i]:start_dissolve()
                            return true
                        end
                    })) 
                    total_cards[i].destroyed = true
                end
                SMODS.calculate_context({remove_playing_cards = true, removed = total_cards})
            end
        end
    end

}
return { name = {"Blinds"}, items = {the_storm} }