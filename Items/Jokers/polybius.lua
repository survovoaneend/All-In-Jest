local polybius = {
    object_type = "Joker",
    order = 61,

    key = "polybius",
    config = {
      
    },
    rarity = 3,
    pos = { x = 7, y = 2 },
    atlas = 'joker_atlas',
    cost = 8,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
  
    end,
  
    calculate = function(self, card, context)
        if context.joker_main then
            local chip_total = 0
            local mult_total = 0
            if context.scoring_name and context.poker_hands then
                for k, v in pairs(context.poker_hands) do
                    if G.GAME.hands[k] and next(context.poker_hands[k]) then
                        chip_total = chip_total + to_big(G.GAME.hands[k].chips)
                        mult_total = mult_total + to_big(G.GAME.hands[k].mult)
                    end
                end
            end
            if chip_total > to_big(0) and mult_total > to_big(0) then
                return {
                    mult = mult_total,
                    chips = chip_total
                }
            elseif chip_total > to_big(0) then
                return {
                    chips = chip_total
                }
            elseif mult_total > to_big(0) then
                return {
                    mult = mult_total
                }
            end
        end
    end,

    joker_display_def = function(JokerDisplay)
        ---@type JDJokerDefinition
        return {
            text = {
                { text = "+",                              colour = G.C.CHIPS },
                { ref_table = "card.joker_display_values",        ref_value = "chips", colour = G.C.CHIPS, retrigger_type = "mult" },
                { text = " +",                             colour = G.C.MULT },
                { ref_table = "card.joker_display_values",        ref_value = "mult",  colour = G.C.MULT,  retrigger_type = "mult" }
            },
            text_config = { colour = G.C.MULT },
            calc_function = function(card)
                local chip_total = 0
                local mult_total = 0
                local text, poker_hands, scoring_hand = JokerDisplay.evaluate_hand()
                if poker_hands then
                    for k, v in pairs(poker_hands) do
                        if G.GAME.hands[k] and next(poker_hands[k]) then
                            chip_total = chip_total + to_big(G.GAME.hands[k].chips)
                            mult_total = mult_total + to_big(G.GAME.hands[k].mult)
                        end
                    end
                end
                card.joker_display_values.mult = mult_total
                card.joker_display_values.chips = chip_total
            end
        }
    end
  
}
return { name = {"Jokers"}, items = {polybius} }
