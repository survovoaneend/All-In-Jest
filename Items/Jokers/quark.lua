local quark = {
    object_type = "Joker",
    order = 96,
    lite = true,
    key = "quark",
    config = {

    },
    rarity = 2,
    pos = { x = 16, y = 3 },
    atlas = 'joker_atlas',
    cost = 7,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,

    loc_vars = function(self, info_queue, card)

    end,

    calculate = function(self, card, context)
        if context.before and context.scoring_hand then
            if context.poker_hands and next(context.poker_hands['Three of a Kind']) then
                if #context.scoring_hand == 3 then
                    local suits_present = {}
                    local all_different_suits = true
                    for _, scoring_card in ipairs(context.scoring_hand) do
                        if scoring_card.base.suit then
                            if suits_present[scoring_card.base.suit] then
                                all_different_suits = false
                                break
                            else
                                suits_present[scoring_card.base.suit] = true
                            end
                        else
                            all_different_suits = false
                            break
                        end
                    end
                    if all_different_suits then
                        local card_to_juice = context.blueprint_card or card
                        return {
                            message = localize('k_upgrade_ex'),
                            func = function ()
                                local text = "Three of a Kind"
                                level_up_hand(card_to_juice, text, nil, 1)
                            end
                        }
                    end
                end
            end
        end
    end,

    joker_display_def = function(JokerDisplay)
        ---@type JDJokerDefinition
        return {
            reminder_text = {
                { text = "(" },
                { ref_table = "card.joker_display_values", ref_value = "localized_text_2" },
                { text = ")" },
            },
            extra = {
                {
                    { text = "(" },
                    { ref_table = "card.joker_display_values", ref_value = "localized_text", colour = G.C.ORANGE },
                    { text = ")" },
                },
            },

            calc_function = function(card)
                card.joker_display_values.localized_text = localize('Three of a Kind', 'poker_hands')
                card.joker_display_values.localized_text_2 = localize("jdis_inactive")
                local text, poker_hands, scoring_hand = JokerDisplay.evaluate_hand()
                if text ~= "Unknown" and next(poker_hands['Three of a Kind']) then
                    if #scoring_hand == 3 then
                        local suits_present = {}
                        local all_different_suits = true
                        for _, scoring_card in ipairs(scoring_hand) do
                            if scoring_card.base.suit then
                                if suits_present[scoring_card.base.suit] then
                                    all_different_suits = false
                                    break
                                else
                                    suits_present[scoring_card.base.suit] = true
                                end
                            else
                                all_different_suits = false
                                break
                            end
                        end
                        if all_different_suits then
                            card.joker_display_values.localized_text_2 = localize("k_active_ex")
                        end
                    end
                end
            end,
            style_function = function(card, text, reminder_text, extra)
                if reminder_text and reminder_text.children and reminder_text.children[2] then
                    reminder_text.children[2].config.colour = card.joker_display_values.active and G.C.ORANGE or
                        G.C.UI.TEXT_INACTIVE
                end
            end
        }
    end

}
return { name = { "Jokers" }, items = { quark } }
