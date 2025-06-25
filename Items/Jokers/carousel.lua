local carousel = {
    object_type = "Joker",
    order = 23,

    key = "carousel",
    config = {

    },
    rarity = 2,
    pos = { x = 21, y = 0 },
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,

    loc_vars = function(self, info_queue, card)

    end,

    calculate = function(self, card, context)
        if context.after and context.scoring_hand and not context.blueprint then
            for i, card in ipairs(context.scoring_hand) do
                local percent = 1.15 - (i - 0.999) / (#context.scoring_hand - 0.998) * 0.3
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.15,
                    func = function()
                        card:flip()
                        play_sound('card1', percent)
                        card:juice_up(0.3, 0.3)
                        return true
                    end
                }))
            end

            delay(0.2)

            for _, card in ipairs(context.scoring_hand) do
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.1,
                    func = function()
                        if card:is_suit("Hearts") then
                            card:change_suit("Clubs")
                        elseif card:is_suit("Clubs") then
                            card:change_suit("Diamonds")
                        elseif card:is_suit("Diamonds") then
                            card:change_suit("Spades")
                        elseif card:is_suit("Spades") then
                            card:change_suit("Hearts")
                        end
                        return true
                    end
                }))
            end

            for i, card in ipairs(context.scoring_hand) do
                local percent = 0.85 + (i - 0.999) / (#context.scoring_hand - 0.998) * 0.3
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.15,
                    func = function()
                        card:flip()
                        play_sound('tarot2', percent, 0.6)
                        card:juice_up(0.3, 0.3)
                        return true
                    end
                }))
            end

            delay(0.5)
        end
    end

}
return { name = { "Jokers" }, items = { carousel } }
