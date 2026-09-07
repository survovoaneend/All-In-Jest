local vanha_erkki = {
    object_type = "Joker",
    order = 699,

    key = "vanha_erkki",
    config = {
        extra = {
            chosen_timing = 'joker_main',
            xmult = 3
        }
    },
    attributes = {'xmult'},
    rarity = 3,
    pos = { x = 0, y = 32},
    atlas = 'joker_atlas',
    cost = 8,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,

    loc_vars = function(self, info_queue, card)
        return { 
            vars = {
                card.ability.extra.xmult
            }
        }
    end,

    calculate = function(self, card, context)
        if context.before and not context.blueprint then
            local possible_timings = { 'before', 'after_cards', 'joker_main', 'after_jokers' }
            card.ability.extra.chosen_timing = pseudorandom_element(possible_timings, 'vanha_erkki_' .. G.GAME.round_resets.ante)
        end

        -- 1. Before cards score
        if context.before and card.ability.extra.chosen_timing == 'before' then
            return {
                xmult = card.ability.extra.xmult
            }
        end

        -- 2. After cards score, but before Jokers trigger
        if context.all_in_jest and context.all_in_jest.after_scoring_cards and card.ability.extra.chosen_timing == 'after_cards' then
            return {
                x_mult = card.ability.extra.xmult
            }
        end

        -- 3. In the main Joker scoring cycle
        if context.joker_main and card.ability.extra.chosen_timing == 'joker_main' then
            return {
                xmult = card.ability.extra.xmult
            }
        end

        -- 4. After all Jokers have trigger
        if context.final_scoring_step and card.ability.extra.chosen_timing == 'after_jokers' then
            return {
                xmult = card.ability.extra.xmult
            }
        end
    end
}
return { name = {"Jokers"}, items = {vanha_erkki} }