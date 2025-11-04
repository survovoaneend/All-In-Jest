local pierrot = {
    object_type = "Joker",
    order = 11,

    key = "pierrot",
    config = {
      
    },
    rarity = 1,
    pos = { x = 10, y = 0 },
    atlas = 'joker_atlas',
    cost = 4,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
  
    end,
  
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.hand and not context.end_of_round and context.other_card:get_id() <= 10 then
            if context.other_card.debuff then
                 return {
                    message = localize('k_debuffed'),
                    colour = G.C.RED
                }
            else
                return {
                    chips = context.other_card:get_chip_bonus()
                }
            end
        end
    end,

    joker_display_def = function(JokerDisplay)
        ---@type JDJokerDefinition
        return {
            text = {
                { text = "+" },
                { ref_table = "card.joker_display_values", ref_value = "chips", retrigger_type = "mult" }
            },
            text_config = { colour = G.C.CHIPS },
            calc_function = function(card)
                card.joker_display_values.chips = 0
                local playing_hand = next(G.play.cards)
                local count = 0
                for _, playing_card in ipairs(G.hand.cards) do
                    if playing_hand or not playing_card.highlighted then
                        local rank = SMODS.Ranks[playing_card.base.value]
                        local id = playing_card:get_id()
                        if not (playing_card.facing == 'back') and not playing_card.debuff and to_big(playing_card:get_chip_bonus()) > to_big(0) and (to_big(id) > to_big(0) and rank and not rank.face) then
                            card.joker_display_values.chips = card.joker_display_values.chips + playing_card:get_chip_bonus() * JokerDisplay.calculate_card_triggers(playing_card, nil, true)
                        end
                    end
                end
            end
        }
    end
  
}
return { name = {"Jokers"}, items = {pierrot} }
