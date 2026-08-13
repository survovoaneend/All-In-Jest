local skinsuit = {
    object_type = "Joker",
    order = 362,
    key = "skinsuit",
    config = {
    },
    attributes = { 'modify_card', 'patches', 'destroy_card' },
    rarity = 1,
    pos = { x = 24, y = 13 },
    atlas = 'joker_atlas',
    cost = 4,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,

    loc_vars = function(self, info_queue, card)

    end,

    calculate = function(self, card, context)
        if context.destroying_card and #context.full_hand == 1 and G.GAME.current_round.hands_played == 0 then
            local destroyed_card = context.destroying_card

            if not SMODS.has_no_suit(destroyed_card) then
                local destroyed_suit = destroyed_card.base.suit
                local valid_cards = {}
                for i = 1, #G.hand.cards do
                    local h_card = G.hand.cards[i]
                    if h_card.base.suit ~= destroyed_suit and not All_in_Jest.has_patches(h_card, destroyed_suit) then
                        valid_cards[#valid_cards + 1] = h_card
                    end
                end
                if #valid_cards > 0 then
                    local target_card = pseudorandom_element(valid_cards, pseudoseed('skinsuit'))
                    All_in_Jest.add_patch(target_card, destroyed_suit)

                    local juice_card = context.blueprint_card or card
                    G.E_MANAGER:add_event(Event({
                        func = (function()
                            juice_card:juice_up()
                            return true
                        end)
                    }))
                end
            end
            return {
                remove = true
            }
        end
    end
}

return { name = {"Jokers"}, items = {skinsuit} }