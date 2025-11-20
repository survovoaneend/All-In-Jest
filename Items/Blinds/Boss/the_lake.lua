local the_lake = {
    object_type = "Blind",
    key = 'the_lake',
    
    boss = {
        min = 1,
    },
    mult = 2,
    boss_colour = HEX("449d95"),
    atlas = 'blinds',
    pos = { X = 0, y = 29},
    order = 48,
    dollars = 5,


    calculate = function(self, blind, context)
        
    end,

}
local shuffleref = CardArea.shuffle
function CardArea:shuffle(_seed)
    local ref = shuffleref(self, _seed)

    local the_lake = G.GAME.blind and G.GAME.blind.config.blind.key == 'bl_aij_the_lake' and not G.GAME.blind.disabled
    if the_lake then
        local cards = {}

        for i = #self.cards, 1, -1 do
            local card = self.cards[i]
            if card.ability.played_this_ante then
                table.insert(cards, card)
                table.remove(self.cards, i)
            end
        end

        for _, card in ipairs(cards) do
            table.insert(self.cards, 1, card)
        end
    end

    return ref
end
return { name = {"Blinds"}, items = {the_lake} }