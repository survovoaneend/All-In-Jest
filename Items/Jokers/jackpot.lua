local jackpot = {
    object_type = "Joker",
    order = 929,
    
    key = "jackpot",
    config = {
        extra = {
            dollars = 0,
            gain = 1,
        }
    },
    attributes = {'scaling', 'economy', 'enhancements'},
    rarity = 2,
    pos = { x = 3, y = 43},
    atlas = 'joker_atlas',
    cost = 7,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,
    enhancement_gate = 'm_lucky',

    loc_vars = function(self, info_queue, card)
        return { 
            vars = {
                card.ability.extra.dollars,
                card.ability.extra.gain
            }
        }
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and context.other_card.lucky_trigger and not context.blueprint then
            card.ability.extra.dollars = card.ability.extra.dollars + card.ability.extra.gain
            return {
                message = localize('k_upgrade_ex'),
                colour = G.C.MONEY,
                message_card = card
            }
        end
    end,
    

    calc_dollar_bonus = function(self, card)
        return card.ability.extra.dollars > 0 and card.ability.extra.dollars or nil
    end
}
return { name = {"Jokers"}, items = {jackpot} }