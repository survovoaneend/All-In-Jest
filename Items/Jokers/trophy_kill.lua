local trophy_kill = {
    object_type = "Joker",
    order = 252,
    key = "trophy_kill",
    config = {
        extra = {
            xmult = 3,
            triggered = false,
            rank = '',
            suit = '',
        }
    },
    rarity = 3,
    pos = { x = 0, y = 0 },
    soul_pos = { x = 1, y = 0 },
    atlas = 'trophy_kill',
    cost = 8,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,

    pixel_size = { w = 91, h = 95 },

    loc_vars = function(self, info_queue, card)
        local card_center = card.ability.extra
        if card_center.rank == '' then
            card_center.rank = '[rank]'
        end
        if card_center.suit == '' then
            card_center.suit = '[suit]'
        end
        local active_text = ""
        if not card.ability.extra.triggered then
            active_text = "(" .. localize('k_inactive') .. ")"
        else
            active_text = "(" .. localize('k_active') .. ")"
        end
        return {
            vars = {
                card.ability.extra.xmult,
                card_center.rank,
                card_center.suit,
                active_text
            }
        }
    end,

    calculate = function(self, card, context)
        local card_center = card.ability.extra
        if (context.remove_playing_cards or context.cards_destroyed) and not context.blueprint then
            local removed_cards = context.glass_shattered or context.removed
            local rank = nil
            local suit = nil
            for k, v in pairs(SMODS.Ranks) do
                if k == card_center.rank then rank = v.id end
            end
            for k, v in pairs(SMODS.Suits) do
                if k == card_center.suit then suit = v.key end
            end
            for k, val in ipairs(removed_cards) do
                if val:is_suit(suit) and val:get_id() == rank and not card.ability.extra.triggered then  
                    card.ability.extra.triggered = true
                    card_eval_status_text(card, 'extra', nil, nil, nil, {
                        message = localize('k_aij_hunted_ex')
                    })
                end
            end
        end
        if context.joker_main and card.ability.extra.triggered then
            if card.ability.extra.xmult > 1 then
                return {
                    xmult = card.ability.extra.xmult,
                }
            end
        end
    end,

    add_to_deck = function(self, card, from_debuff)
        card.ability.extra.triggered = false
        if G.playing_cards then
            local playing_card = pseudorandom_element(G.playing_cards, pseudoseed('trophy_kill'))
            local center = playing_card.config.card
            card.ability.extra.rank = tostring(center.value)
            card.ability.extra.suit = center.suit
        end
    end,
}
return { name = { "Jokers" }, items = { trophy_kill } }
