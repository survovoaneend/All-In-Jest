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
    blueprint_compat = true,
    eternal_compat = true,

    loc_vars = function(self, info_queue, card)

    end,

    calculate = function(self, card, context)
        if context.after and context.scoring_hand then
            local juiced_card = context.blueprint_card or card
            local triggered = 0 -- Use to track if any cards are actually modified
            for i, other_card in ipairs(context.scoring_hand) do
                if other_card:is_suit("Hearts") or other_card:is_suit("Clubs") or other_card:is_suit("Diamonds") or other_card:is_suit("Spades") then

                    if triggered == 0 then -- Juice Carousel before first card is flipped
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                juiced_card:juice_up()
                                return true
                            end
                        }))
                    end

                    triggered = triggered + 1
                    local percent = 1.15 - (triggered - 0.999) / (#context.scoring_hand - 0.998) * 0.3
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        delay = 0.15,
                        func = function()
                            other_card:flip()
                            play_sound('card1', percent)
                            other_card:juice_up(0.3, 0.3)
                            return true
                        end
                    }))
                end
            end

            if triggered > 0 then
                delay(0.2)

                for _, other_card in ipairs(context.scoring_hand) do
                    -- unnecessary delay, scales wrongly with the number of scoring cards?
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        delay = 0.1,
                        func = function()
                            other_card.ability.played_this_ante = false -- Prevent Pillar from debuffing when played during boss blind
                            if other_card:is_suit("Hearts") then
                                other_card:change_suit("Clubs")
                            elseif other_card:is_suit("Clubs") then
                                other_card:change_suit("Diamonds")
                            elseif other_card:is_suit("Diamonds") then
                                other_card:change_suit("Spades")
                            elseif other_card:is_suit("Spades") then
                                other_card:change_suit("Hearts")
                            end
                            other_card.ability.played_this_ante = true
                            return true
                        end
                    }))
                end

                for i, other_card in ipairs(context.scoring_hand) do
                    local percent = 0.85 + (i - 0.999) / (#context.scoring_hand - 0.998) * 0.3
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        delay = 0.15,
                        func = function()
                            if other_card.facing == "back" then
                                other_card:flip()
                                play_sound('tarot2', percent, 0.6)
                                other_card:juice_up(0.3, 0.3)
                            end
                            return true
                        end
                    }))
                end

                delay(0.5)
            end

            return nil, true
        end
    end

}
return { name = { "Jokers" }, items = { carousel } }
