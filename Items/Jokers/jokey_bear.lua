local jokey_bear = {
    object_type = "Joker",
    order = 520,

    key = "jokey_bear",
    config = {
        extra = {
            dollars = 5,
            temp_chips = '0'
        }
    },
    rarity = 2,
    pos = { x = 20, y = 24 },
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,

    loc_vars = function(self, info_queue, card)
        return { 
            vars = {
                0.75,
                card.ability.extra.dollars,
            } 
        }
    end,

    calculate = function(self, card, context)
        if context.all_in_jest and context.all_in_jest.before_after then
            card.ability.extra.temp_chips = tostring(math.floor(SMODS.calculate_round_score()))
            if context.total_chips >= G.GAME.blind.chips then
                return {
                    x_mult = 0.75,
                    dollars = card.ability.extra.dollars,
                }
            end
        end
        if context.repetition_only or (context.retrigger_joker_check) then
            local chip_amt = tonumber(card.ability.extra.temp_chips)
            chip_amt = chip_amt * 0.75
            local reps = 0
            while chip_amt >= G.GAME.blind.chips do 
                reps = reps + 1
                chip_amt = chip_amt * 0.75
            end
            if context.other_card == card and reps > 0 then
                return {
                    repetitions = reps,
                    card = card,
                    message = localize('k_again_ex')
                }  
            end
        end
    end
}
return { name = { "Jokers" }, items = { jokey_bear } }
