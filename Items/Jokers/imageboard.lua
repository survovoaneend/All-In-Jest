local imageboard = {
    object_type = "Joker",
    order = 22,

    key = "imageboard",
    config = {
      extra = {
          has_been_played = nil
      }
    },
    rarity = 1,
    pos = { x = 20, y = 0 },
    atlas = 'joker_atlas',
    cost = 4,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
  
    end,
  
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            local cur_mult = 1
            card.ability.extra.has_been_played = card.ability.extra.has_been_played or {}
            local compare_id = context.other_card:get_id()
            card.ability.extra.has_been_played[compare_id] = card.ability.extra.has_been_played[compare_id] or 0
            card.ability.extra.has_been_played[compare_id] = card.ability.extra.has_been_played[compare_id] + 1
            return {
                mult = card.ability.extra.has_been_played[compare_id]
            }
        end
        if context.after then
            card.ability.extra.has_been_played = nil
        end
    end,

    joker_display_def = function(JokerDisplay)
        ---@type JDJokerDefinition
        return {
            text = {
                { text = "+" },
                { ref_table = "card.joker_display_values", ref_value = "mult", retrigger_type = "mult" }
            },
            text_config = { colour = G.C.MULT },
            calc_function = function(card)
                local mult = 0
                local text, _, scoring_hand = JokerDisplay.evaluate_hand()
                local has_been_played = nil
                if text ~= 'Unknown' then
                    for _, scoring_card in pairs(scoring_hand) do
                        for i=1, JokerDisplay.calculate_card_triggers(scoring_card, scoring_hand) do
                            has_been_played = has_been_played or {}
                            local compare_id = scoring_card:get_id()
                            has_been_played[compare_id] = has_been_played[compare_id] or 0
                            has_been_played[compare_id] = has_been_played[compare_id] + 1
                            mult = mult + has_been_played[compare_id]
                        end
                    end
                end
                card.joker_display_values.mult = mult
            end
        }
    end
  
}
return { name = {"Jokers"}, items = {imageboard} }
