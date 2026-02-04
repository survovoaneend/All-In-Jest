local read_em_and_weep = {
    object_type = "Joker",
    order = 92,

    key = "read_em_and_weep",
    config = { },
    rarity = 3,
    pos = { x = 12, y = 3 },
    atlas = 'joker_atlas',
    cost = 8,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,

    loc_vars = function(self, info_queue, card)

    end,

    calculate = function(self, card, context)
        if context.aij_before_before and context.scoring_name and not context.blueprint then
            if context.poker_hands and next(context.poker_hands['Straight']) then
                local temp_suit = pseudorandom_element(SMODS.Suits, pseudoseed('jest_read_em_and_weep' .. G.GAME.round_resets.ante)).key

                if G.play then
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            update_hand_text({immediate = true, nopulse = true, delay = 0}, {mult = 0, chips = 0, level = '', handname = ''})
                            return true
                        end
                    }))

                    for i = 1, #G.play.cards do
                        if G.play.cards[i].ability then
                            G.play.cards[i].ability.played_this_ante = false
                        end
                        SMODS.change_base(G.play.cards[i], temp_suit, nil, true) -- Changes suit without changing visual
                        if G.play.cards[i].ability then
                            G.play.cards[i].ability.played_this_ante = true
                        end
                    end
                    return {
                        message = localize("k_aij_change_ex"),
                        func = function()
                            All_in_Jest.change_card(temp_suit, nil, G.play.cards)
                            delay(0.2)
                            G.E_MANAGER:add_event(Event({
                                func = function()
                                    local text,disp_text,poker_hands,scoring_hand,non_loc_disp_text = G.FUNCS.get_poker_hand_info(G.play.cards)

                                    local calculated_text = nil
                                    if text == 'aij_Royal Flush' then
                                        calculated_text = 'aij_Royal Flush'
                                        text = 'Straight Flush'
                                    end

                                    update_hand_text({
                                        sound = G.GAME.current_round.current_hand.handname ~= disp_text and 'button' or nil, 
                                        volume = 0.4, 
                                        immediate = true, 
                                        nopulse = nil,
                                        delay = G.GAME.current_round.current_hand.handname ~= disp_text and 0.4 or 0}, 
                                        {handname=disp_text, level=G.GAME.hands[calculated_text or text].level, 
                                        mult = G.GAME.hands[calculated_text or text].mult, 
                                        chips = G.GAME.hands[calculated_text or text].chips})
                                    return true
                                end
                            }))
                        end
                    }
                end
            end
        end
    end

}
return { name = { "Jokers" }, items = { read_em_and_weep } }
