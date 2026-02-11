local crypto_trader = {
    object_type = "Joker",
    order = 507,

    key = "crypto_trader",
    config = {
        extra = {
            interest = 5,
            odds = 3,
            multpliers = {},
        }
    },
    rarity = 2,
    pos = { x = 2, y = 22 },
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,

    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds)
        return {
            vars = {
                numerator, denominator,
                card.ability.extra.interest,
            }
        }
    end,

    calculate = function(self, card, context)
        if context.end_of_round and context.cardarea == G.jokers then
            local amount = 0
            local string = tostring(context.blueprint_card or card).."crypto_trader"
            if SMODS.pseudorandom_probability(card, 'crypto_trader', 1, card.ability.extra.odds) then
                amount = card.ability.extra.interest
            end
            apply_multiplier(G.GAME, "interest_amount", amount, string)
            card.ability.extra.multpliers[#card.ability.extra.multpliers+1] = string
		        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize { type = 'variable', key = "a_aij_times_interest", vars = { amount }}, colour = G.C.FILTER})
        end
        if context.cashing_out then
            for k, v in pairs(card.ability.extra.multpliers) do
                remove_multiplier(G.GAME, "interest_amount", v)
            end
        end
    end, 

    remove_from_deck = function(self, card, from_debuff)
        remove_multiplier(G.GAME, "interest_amount", tostring(card).."crypto_trader")
    end,
}
return { name = { "Jokers" }, items = { crypto_trader } }
