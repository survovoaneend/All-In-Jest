local the_oil = {
    object_type = "Blind",
    key = 'the_oil',
    
    boss = {
        min = 1,
    },
    mult = 2,
    boss_colour = HEX("b3986a"),
    atlas = 'blinds',
    pos = { X = 0, y = 86},
    order = 86,
    dollars = 5,

    loc_vars = function(self, info_queue, card)
        local num, odds = SMODS.get_probability_vars(self, 1, 2)
        return {vars = {num, odds}}
    end,
    collection_loc_vars = function(self, blind)
        local num, odds = SMODS.get_probability_vars(blind, 1, 2)
        return {vars = {num, odds}}
    end,

    calculate = function(self, blind, context)
        local temp = G.GAME.blind and G.GAME.blind.disabled
        if temp then
            return false
        end
        if context.hand_drawn and not temp then
            for k, v in pairs(context.hand_drawn) do
                if next(SMODS.get_enhancements(v)) and SMODS.pseudorandom_probability(card, 'the_oil', 1, 2) then
                    draw_card(v.area,G.discard, 1*100/1,'down', nil, v, 0.07)
                end
            end
        end
    end
}
return { name = {"Blinds"}, items = {the_oil} }