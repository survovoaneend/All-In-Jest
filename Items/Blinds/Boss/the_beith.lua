local the_beith = {
    object_type = "Blind",
    key = 'the_beith',
    boss = {
      min = 2,
    },
    mult = 2,
    boss_colour = HEX("ddebe5"),
    atlas = 'blinds',
    pos = {X = 0, y = 14 },
    order = 1,
    dollars = 5,

    calculate = function(self, card, context)
        
    end
}
local shuffleref = CardArea.shuffle
function CardArea:shuffle(_seed)
    local ref = shuffleref(self, _seed)

    local the_beith = G.GAME.blind and G.GAME.blind.config.blind.key == 'bl_aij_the_beith' and not G.GAME.blind.disabled
    if the_beith then
        local diamonds = {}

        for i = #self.cards, 1, -1 do
            local card = self.cards[i]
            if card:is_suit('Diamonds') then
                table.insert(diamonds, card)
                table.remove(self.cards, i)
            end
        end

        for _, card in ipairs(diamonds) do
            table.insert(self.cards, 1, card)
        end
    end

    return ref
end
return { name = {"Blinds"}, items = {the_beith} }