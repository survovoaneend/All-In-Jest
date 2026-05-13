local petrushka = {
    object_type = "Joker",
    order = 110,
    lite = true,
    key = "petrushka",
    config = {
      
    },
    rarity = 3,
    pos = { x = 5, y = 4 },
    atlas = 'joker_atlas',
    cost = 8,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
  
    end,
  
     calculate = function(self, card, context)
        if context.joker_main and context.scoring_hand then
            local rank_sum = 0
    
            for _, scoring_card in ipairs(context.scoring_hand) do
                local rank_value = scoring_card:get_id()
                if rank_value > 0 then
                    rank_sum = rank_sum + rank_value
                end
            end

            if rank_sum > 0 then
                local mult_mod = math.floor(rank_sum)
                return {
                    mult= mult_mod,
                }
              end
        end

        return nil
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
                local count = 0
                active = false
                local text, _, scoring_hand = JokerDisplay.evaluate_hand()
                if text ~= 'Unknown' then
                    for _, scoring_card in pairs(scoring_hand) do
                        if scoring_card:get_id() > 0 then
                            count = count + scoring_card:get_id()
                        end
                    end
                end
                card.joker_display_values.mult = count
            end,
        }
    end,
  
}
return { name = {"Jokers"}, items = {petrushka} }
