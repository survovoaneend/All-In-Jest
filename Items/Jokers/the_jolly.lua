local the_jolly = {
    object_type = "Joker",
    order = 395,
    key = "the_jolly",
    config = {
        extra = {
            
        }
    },
    rarity = 2,
    pos = { x = 3, y = 16 },
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                
            }
        }
    end,

    calculate = function(self, card, context)
        if context.before and context.main_eval then
            if next(context.poker_hands['Straight Flush']) and context.scoring_name then
                local levels = (G.GAME.hands['Straight'].level or 1) + (G.GAME.hands['Flush'].level or 1)
                level_up_hand(card, context.scoring_name, true, levels)
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
                card.the_jolly_levels_to_remove = levels
            end
        end
        if context.after and context.scoring_name and card.the_jolly_levels_to_remove then
            level_up_hand(card, context.scoring_name, true, -card.the_jolly_levels_to_remove)
            card.the_jolly_levels_to_remove = nil
        end
    end
}

return { name = { "Jokers" }, items = { the_jolly } }
