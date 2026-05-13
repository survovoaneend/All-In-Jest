local fruity_joker = {
    object_type = "Joker",
    order = 45,

    key = "fruity_joker",
    config = {
      extra = {
        mult = 15
      }
    },
    rarity = 1,
    pos = { x = 17, y = 1 },
    atlas = 'joker_atlas',
    cost = 5,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,

    in_pool = function(self, args)
        if G.jokers and G.jokers.cards then
            for _, card in ipairs(G.jokers.cards) do
                if card.edition and card.edition.key == 'e_polychrome' then
                    return true
                end
            end
        end
        if G.playing_cards then
            for _, card in ipairs(G.playing_cards) do
                if card.edition and card.edition.key == 'e_polychrome' then
                    return true
                end
            end
        end
        return false
    end,
  
    loc_vars = function(self, info_queue, card)
        if not card.edition or (card.edition and not card.edition.key == 'e_polychrome') then
        info_queue[#info_queue+1] = G.P_CENTERS.e_polychrome
        end
        return {
          vars = {
            card.ability.extra.mult
          }
        }
    end,
  
    calculate = function(self, card, context)
      if context.other_joker then
        if context.other_joker.edition and context.other_joker.edition.key == 'e_polychrome' then
            G.E_MANAGER:add_event(Event({
                    func = function()
                        context.other_joker:juice_up(0.5, 0.5)
                        return true
                    end
                })) 
                return {
                    mult = card.ability.extra.mult
                }
            end
      end
      if context.individual and context.cardarea == G.play then
        if context.other_card.edition and context.other_card.edition.key == 'e_polychrome' then
            return {
                mult = card.ability.extra.mult,
                card = card
            }
        end
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
                card.joker_display_values.x_mult = 0
                local count = 0
                local text, _, scoring_hand = JokerDisplay.evaluate_hand()
                if text ~= 'Unknown' then
                    for _, scoring_card in pairs(scoring_hand) do
                        if scoring_card.edition and scoring_card.edition.key == 'e_polychrome' then
                            count = count + 1
                        end
                    end
                end
                if G.jokers then
                    for _, joker_card in ipairs(G.jokers.cards) do
                        if joker_card.edition and joker_card.edition.key == 'e_polychrome' then
                            count = count + 1
                        end
                    end
                end
                card.joker_display_values.mult = card.ability.extra.mult * count
            end
        }
    end
}
return { name = {"Jokers"}, items = {fruity_joker} }
