local skytower = {
    object_type = "Joker",
    order = 547,
    key = "skytower",
    config = {
        extra = {
            levels = 5
        }
    },
    rarity = 2,
    pos = { x = 5, y = 26 },
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.levels,
            }
        }
    end,

    calculate = function(self, card, context)
        if context.before and context.main_eval then
            local most_played_hand = nil
            local val = 1
            for k, v in pairs(G.GAME.hands) do
                if v.played >= val and v.visible then
                    val = v.played
                    most_played_hand = k
                end
            end
            if most_played_hand ~= context.scoring_name then
                level_up_hand(card, context.scoring_name, true, card.ability.extra.levels)
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
                card.skytower_levels_to_remove = card.ability.extra.levels
            end
        end
        if context.after and context.scoring_name and card.skytower_levels_to_remove then
            level_up_hand(card, context.scoring_name, true, -card.skytower_levels_to_remove)
            card.skytower_levels_to_remove = nil
        end
    end
}

return { name = { "Jokers" }, items = { skytower } }
