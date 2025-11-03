local punch_and_judy = {
    object_type = "Joker",
    order = 70,

    key = "punch_and_judy",
    config = {
      extra = {
          count = 1,
      }
    },
    rarity = 3,
    pos = { x = 16, y = 2 },
    atlas = 'joker_atlas',
    cost = 8,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.count,
            }
        }
    end,
  
    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.play then
            local king_count = 0
            local queen_count = 0
            for k, v in pairs(context.full_hand) do
                if v:get_id() == 12 then
                    queen_count = queen_count + 1
                end
                if v:get_id() == 13 then
                    king_count = king_count + 1
                end
            end
            if king_count == card.ability.extra.count and queen_count == card.ability.extra.count then
                return {
                    message = localize('k_again_ex'),
                    repetitions = 1,
                    card = card
                }
            end
        end
    end,

    joker_display_def = function(JokerDisplay)
        ---@type JDJokerDefinition
        return {
            reminder_text = {
                { text = "(" },
                { ref_table = "card.joker_display_values", ref_value = "active" },
                { text = ")" },
            },
            calc_function = function(card)
                local king_count = 0
                local queen_count = 0
                local played_hand = JokerDisplay.current_hand
                active = false
                local text, _, scoring_hand = JokerDisplay.evaluate_hand()
                if text ~= 'Unknown' then
                    for _, scoring_card in pairs(scoring_hand) do
                        if scoring_card:get_id() == 12 then
                            queen_count = queen_count + 1
                        end
                        if scoring_card:get_id() == 13 then
                            king_count = king_count + 1
                        end
                    end
                end
                if king_count == card.ability.extra.count and queen_count == card.ability.extra.count then
                    active = true
                end
                card.joker_display_values.active = active and localize("k_active_ex") or localize("jdis_inactive")
            end
        }
    end,
  
}
return { name = {"Jokers"}, items = {punch_and_judy} }
