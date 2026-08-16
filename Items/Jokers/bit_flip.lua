local bit_flip = {
    object_type = "Joker",
    order = 965,

    key = "bit_flip",
    config = {
        extra = {
            odds = 3,
            score_mod = 1
        }
    },
    attributes = { 'chance', 'score' },
    rarity = 2,
    pos = { x = 14, y = 44},
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
                card.ability.extra.score_mod
            }
        }
    end,

    calculate = function(self, card, context)
        if context.all_in_jest and context.all_in_jest.before_round_end_check and context.total_chips > 0 then
            local num = context.total_chips
            local digits = {}
            for digit in tostring(num):gmatch("%d") do
                table.insert(digits, tonumber(digit))
            end
            local str = ''
            for k, v in pairs(digits) do
                if SMODS.pseudorandom_probability(card, 'bit_flip', 1, card.ability.extra.odds) then 
                    digits[k] = digits[k] + card.ability.extra.score_mod
                end
                if k ~= 1 and digits[k] >= 10 then
                    while digits[k] >= 10 do
                        digits[k-1] = digits[k-1] + 1
                        digits[k] = digits[k] - 10
                    end
                end
            end
            for k, v in pairs(digits) do
                str = str .. tostring(v)
            end
            local score_amt = tonumber(str) - context.total_chips
            if score_amt > 0 then
                card_eval_status_text(card, 'jokers', nil, percent, nil, {message = localize{type='variable',key= "a_score",vars={SMODS.signed(score_amt)}}, update_score = true, volume = 0.5, sound_override = "gong", colour =  G.C.PURPLE})
                G.E_MANAGER:add_event(Event({trigger = 'after', func = function()
                    juice_card(card)
                    G.GAME.chips = G.GAME.chips + score_amt
                return true end }))
            end
        end
    end
}
return { name = {"Jokers"}, items = {bit_flip} }