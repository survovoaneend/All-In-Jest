local quark = {
    object_type = "Joker",
    order = 96,

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
        return nil
    end,

    joker_display_def = function(JokerDisplay)
        ---@type JDJokerDefinition
        return {
            extra = {
                {
                    { text = "" },
                }
            },

            reminder_text = {
                { text = "(" },
                { ref_table = "card.joker_display_values", ref_value = "localized_text", colour = G.C.ORANGE },
                { text = ")" },
            },
            calc_function = function(card)
                card.joker_display_values.localized_text = localize('Three of a Kind', 'poker_hands')
            end
        }
    end

}
return { name = { "Jokers" }, items = { quark } }
