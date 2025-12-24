local happy_as_larry = {
    object_type = "Joker",
    order = 537,
    key = "happy_as_larry",
    config = {
        extra = {
            xmult = 0.25,
            odds = 5,
            new_odds = 5,
            decrease_odds = 1
        }
    },
    rarity = 1,
    pos = { x = 21, y = 25 },
    atlas = 'joker_atlas',
    cost = 4,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = false,

    loc_vars = function(self, info_queue, card)
        local mult = card.ability.extra.xmult + 1
        local numerator, denominator = SMODS.get_probability_vars(card, card.ability.extra.new_odds, card.ability.extra.odds)
        return {
            vars = {
                mult,
                numerator, denominator,
                card.ability.extra.decrease_odds
            }
        }
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            local mult = card.ability.extra.xmult + 1
            if mult > 1 then
                return {
                    xmult = mult,
                }
            end
        end
        if context.repetition_only or (context.retrigger_joker_check) then
            local retriggers = 0
            while SMODS.pseudorandom_probability(card, 'happy_as_larry'.. G.SEED, card.ability.extra.new_odds, card.ability.extra.odds) do
                card.ability.extra.new_odds = card.ability.extra.new_odds - 1
                retriggers = retriggers + 1
            end
            if context.other_card == card and retriggers > 0 then
                card.ability.extra.new_odds = card.ability.extra.odds
                return {
                    repetitions = retriggers,
                    card = card,
                    message = localize('k_again_ex')
                }  
            end
        end
    end
}

return { name = { "Jokers" }, items = { happy_as_larry } }
