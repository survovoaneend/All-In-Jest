local doctors_orders = {
    object_type = "Joker",
    order = 284,

    key = "doctors_orders",
    config = {
        extra = {
            xmult = 1,
            nine_tally = 0
        }
    },
    rarity = 2,
    pos = { x = 7, y = 11 },
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = false,

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.xmult } }
    end,

    calculate = function(self, card, context)
        if context.before and not context.blueprint then
            for _, playing_card in ipairs(context.full_hand) do
                if playing_card:get_id() == 9 then card.ability.extra.nine_tally = card.ability.extra.nine_tally + card.ability.extra.xmult end
            end
        end
        if context.joker_main then
            if card.ability.extra.nine_tally > 0 then
                return {
                    xmult = card.ability.extra.nine_tally,
                }
            end
        end
        if context.after and not context.blueprint then
            if card.ability.extra.nine_tally == 0 then
                SMODS.destroy_cards(card, nil, nil, true)
                return {
                    message = localize('k_eaten_ex'),
                }
            else
                card.ability.extra.nine_tally = 0
            end
        end
    end

}
return { name = { "Jokers" }, items = { doctors_orders } }
