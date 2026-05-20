local curse_of_scotland = {
    object_type = "Joker",
    order = 243,

    key = "curse_of_scotland",
    config = {

    },
    rarity = 2,
    pos = { x = 10, y = 9 },
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,

    loc_vars = function(self, info_queue, card)

    end,

    calculate = function(self, card, context)
        if context.first_hand_drawn and not context.blueprint then
            local eval = function() return G.GAME.current_round.hands_played == 0 and not G.RESET_JIGGLES end
            juice_card_until(card, eval, true)
        end
        if context.after and not context.blueprint and G.GAME.current_round.hands_played == 0 and #context.full_hand == 1 then
            if not (context.full_hand[1]:is_suit("Diamonds") and context.full_hand[1]:get_id() == 9) then
                return {
                    message = localize("k_aij_change_ex"),
                    func = function()
                        All_in_Jest.change_card("Diamonds", '9', context.full_hand)
                        delay(0.5)
                    end
                }
            end
        end
    end

}
return { name = { "Jokers" }, items = { curse_of_scotland } }
