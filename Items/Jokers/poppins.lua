local poppins = {
    object_type = "Joker",
    order = 884,
    
    key = "poppins",
    config = {
        extra = {
            dollars = 1
        }
    },
    attributes = { "economy", "hand_type" },
    rarity = 1,
    pos = { x = 5, y = 41},
    atlas = 'joker_atlas',
    cost = 5,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.dollars
            }
        }
    end,

    calculate = function(self, card, context)
        if context.before and context.poker_hands then
            local count = 0
            for _, contained_hands in pairs(context.poker_hands) do
                if next(contained_hands) then
                    count = count + 1
                end
            end
            if count > 0 then
                local payout = count * card.ability.extra.dollars
                G.GAME.dollar_buffer = (G.GAME.dollar_buffer or 0) + payout
                return {
                    dollars = payout,
                    func = function()
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                G.GAME.dollar_buffer = 0
                                return true
                            end
                        }))
                    end
                }
            end
        end
    end
}
return { name = {"Jokers"}, items = {poppins} }