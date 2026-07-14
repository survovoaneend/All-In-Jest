local silent_sam = {
    object_type = "Joker",
    order = 151,

    key = "silent_sam",
    config = {
      extra = {
        xmult = 0.2
      }
    },
    rarity = 2,
    pos = { x = 20, y = 5 },
    atlas = 'joker_atlas',
    cost = 7,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                1 + card.ability.extra.xmult
            }
        }
    end,
  
    calculate = function(self, card, context)
      if context.individual and context.cardarea == G.hand and not context.end_of_round then
        if context.other_card.debuff then 
            return {
                message = localize('k_debuffed'),
                colour = G.C.RED,
                card = card,
            }
        else
        return {
            Xmult = 1 + card.ability.extra.xmult,
            card = card
        }
    end
      end
    end,

    joker_display_def = function(JokerDisplay)
        ---@type JDJokerDefinition
        return {
            text = {
                {
                    border_nodes = {
                        { text = "X" },
                        { ref_table = "card.joker_display_values", ref_value = "x_mult", retrigger_type = "exp" }
                    }
                }
            },
            calc_function = function(card)
                local playing_hand = next(G.play.cards)
                local count = 0
                for _, playing_card in ipairs(G.hand.cards) do
                    if playing_hand or not playing_card.highlighted then
                        if not (playing_card.facing == 'back') and not playing_card.debuff then
                            count = count + JokerDisplay.calculate_card_triggers(playing_card, nil, true)
                        end
                    end
                end
                card.joker_display_values.x_mult = (1 + card.ability.extra.xmult) ^ count
            end
        }
    end
  
}
return { name = {"Jokers"}, items = {silent_sam} }
