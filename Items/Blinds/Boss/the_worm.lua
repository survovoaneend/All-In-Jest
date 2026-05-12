local the_worm = {
    object_type = "Blind",
    key = 'the_worm',
    
    boss = {
        min = 3,
    },
    mult = 2,
    boss_colour = HEX("ba99be"),
    atlas = 'blinds',
    pos = { X = 0, y = 72},
    order = 73,
    dollars = 5,

    calculate = function(self, blind, context)
        local temp = G.GAME.blind and G.GAME.blind.disabled
        if temp then
            return
        end
        if context.setting_blind and not temp then
            G.E_MANAGER:add_event(Event({
                func = function()
                    local jokers_to_destroy = {}
                    for i = 1, #G.jokers.cards do
                        if G.jokers.cards[i].ability.perishable then
                            table.insert(jokers_to_destroy, G.jokers.cards[i])
                        end
                    end
                    if #jokers_to_destroy > 0 then
                        SMODS.destroy_cards(jokers_to_destroy)
                    end
                    return true
                end
            }))
        end
    end,
    in_pool = function(self)
        if G.jokers then
            for i = 1, #G.jokers.cards do
                if G.jokers.cards[i].ability.perishable then
                    return true
                end
            end
            return false
        end
    end,
}
return { name = {"Blinds"}, items = {the_worm} }