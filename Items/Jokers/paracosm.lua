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
        card.ability.extra.hand = most_played_hand or "None"
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
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_upgrade_ex')})
                level_up_hand(context.blueprint_card or card, most_played_hand)
            end
            return nil, true
        end
        
    end
  
}
return { name = {"Jokers"}, items = {paracosm} }
