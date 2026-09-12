local the_real = {
    object_type = "Blind",
    key = 'the_real',
    
    boss = {
        min = 5,
    },
    mult = 2,
    attributes = {'rank', 'suit'},
    boss_colour = HEX("3e4b4d"),
    atlas = 'blinds',
    pos = { X = 0, y = 53},
    order = 54,
    dollars = 5,


    calculate = function(self, blind, context)
        
    end
}

local aij_card_is_suit_ref = Card.is_suit
function Card:is_suit(suit, bypass_debuff, flush_calc)
    if G.GAME.blind and G.GAME.blind.config.blind.key == 'bl_aij_the_real' and not G.GAME.blind.disabled then
        if SMODS.has_no_suit(self) then
            return false
        else
            return self.base.suit == suit
        end
    else
        return aij_card_is_suit_ref(self, suit, bypass_debuff, flush_calc)
    end
end

return { name = {"Blinds"}, items = {the_real} }