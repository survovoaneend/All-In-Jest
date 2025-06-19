local paracosm = {
    object_type = "Joker",
    order = 288,
    key = "paracosm",
    config = {
      extra = {hand = "[Most played hand]"}
    },
    rarity = 2,
    pos = { x = 11, y = 11},
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
        local most_played_hand = nil
        local val = 1
        for k, v in pairs(G.GAME.hands) do
            if v.played >= val and v.visible then
                val = v.played
                most_played_hand = k
            end
        end
        card.ability.extra.hand = most_played_hand or "[Most played poker hand]"
        return { vars = {card.ability.extra.hand}}
    end,
  
    calculate = function(self, card, context)
        if context.skip_blind then
            local most_played_hand = nil
            local val = 1
            for k, v in pairs(G.GAME.hands) do
                if v.played >= val and v.visible then
                    val = v.played
                    most_played_hand = k
                end
            end
            if most_played_hand ~= nil then
                card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize('k_upgrade_ex')})
                update_hand_text({sound = 'button', volume = 0.7, pitch = 0.8, delay = 0.3}, {handname=localize(most_played_hand, 'poker_hands'),chips = G.GAME.hands[most_played_hand].chips, mult = G.GAME.hands[most_played_hand].mult, level=G.GAME.hands[most_played_hand].level})
                level_up_hand(card, most_played_hand, nil, 1)
                update_hand_text({sound = 'button', volume = 0.7, pitch = 1.1, delay = 0}, {mult = 0, chips = 0, handname = '', level = ''})
            end
        end
    end
  
}
return { name = {"Jokers"}, items = {paracosm} }
