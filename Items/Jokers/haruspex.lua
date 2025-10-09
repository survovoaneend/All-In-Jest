local haruspex = {
    object_type = "Joker",
    order = 77,

    key = "haruspex",
    config = {
      extra = {
          discards_to_spend = 1,
          cards_to_draw = 3
      }
    },
    rarity = 2,
    pos = { x = 22, y = 2 },
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
        local to_draw = G.deck and #G.deck.cards > 0 and math.min(card.ability.extra.cards_to_draw, #G.deck.cards) or card.ability.extra.cards_to_draw
        return {
            vars = {
                card.ability.extra.discards_to_spend,
                to_draw,
                colours = { 
                    G.C.SECONDARY_SET.Enhanced
                }
            }
        }
    end,

    all_in_jest = {
        can_use_ability = function(self, card, context)
            if G.deck and G.deck.cards and #G.deck.cards > 0 and G.GAME.current_round.discards_left >= card.ability.extra.discards_to_spend and G.STATE == G.STATES.SELECTING_HAND then
                return true
            end
        end,

        use_ability = function(self, card)
            ease_discard(-1 * card.ability.extra.discards_to_spend)
            local triggers = math.min(card.ability.extra.cards_to_draw, #G.deck.cards)
            for i = 1, triggers do
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    func = function() 
				        G.SETTINGS.paused = true
                        G.FUNCS.overlay_menu{
                            config = {no_esc = true},
                            definition = SMODS.jest_no_back_card_collection_UIBox(
                                G.deck.cards, 
                                {5,5,5}, 
                                {
                                    no_materialize = true, 
                                    from_area = true,
                                    hide_single_page = true,
                                    collapse_single_page = true,
                                    modify_card = function(card, center, i, j, index) 
                                        jest_create_select_card_ui(card, G.hand, {
                                            playing_card = true,
                                            remove_orginal = G.deck.cards,
                                            index = index,
                                        })
                                    end, 
                                    sort = function(table)
                                        pseudoshuffle(table, pseudoseed('haruspex'))
                                    end,
                                    h_mod = 1.05,
                                }
                            ),
                        }
                        return true 
                    end 
                }))
            end
        end,
    },
  
    calculate = function(self, card, context)
        
    end
  
}
return { name = {"Jokers"}, items = {haruspex} }
