local tetrominoker = {
    object_type = "Joker",
    order = 281,
    key = "tetrominoker",
    config = {
      extra = {
          odds = 4
      }
    },
    rarity = 2,
    pos = { x = 4, y = 11},
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds)
        return {
            vars = {
                numerator, denominator,
            }
        }
    end,
  
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            if context.other_card:get_id() == 4 then
                if SMODS.pseudorandom_probability(card, 'tetrominoker', 1, card.ability.extra.odds) then
                    local copied_card = copy_card(context.other_card, nil, nil, G.playing_card)
                    copied_card.states.visible = nil
                    return {
                        func = function ()
                            G.E_MANAGER:add_event(Event({
                                func = function()
                                    G.playing_card = (G.playing_card and G.playing_card + 1) or 1
                                    copied_card:add_to_deck()
                                    G.deck.config.card_limit = G.deck.config.card_limit + 1
                                    table.insert(G.playing_cards, copied_card)
                                    G.hand:emplace(copied_card)
                                    copied_card:start_materialize()
                                    return true
                                end
                            }))
                        end,
                        extra = { -- In extra so that the "Copied!" message happens at the same time as the copying
                            message_card = context.blueprint_card or card,
                            juice_card = context.other_card,
                            message = localize('k_copied_ex'),
                            playing_cards_created = {copied_card}
                        }
                    }
                end
            end
        end
    end
  
}
return { name = {"Jokers"}, items = {tetrominoker} }
