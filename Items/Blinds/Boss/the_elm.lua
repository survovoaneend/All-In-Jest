local the_elm = {
    object_type = "Blind",
    key = 'the_elm',
    boss = {
      min = 2,
    },
    mult = 2,
    boss_colour = HEX("5a835e"),
    atlas = 'blinds',
    pos = {X = 0, y = 1 },
    order = 2,
    dollars = 5,

    disable = function(self)
        G.deck:shuffle('nr'..G.GAME.round_resets.ante)
    end,

    calculate = function(self, blind, context)
        local temp = G.GAME.blind and G.GAME.blind.disabled
        if temp then
            return
        end

    end
}
local shuffleref = CardArea.shuffle
function CardArea:shuffle(_seed)
    local ref = shuffleref(self, _seed)

    local the_elm = G.GAME.blind and G.GAME.blind.config.blind.key == 'bl_aij_the_elm' and not G.GAME.blind.disabled
    if the_elm then
        local clubs = {}

        for i = #self.cards, 1, -1 do
            local card = self.cards[i]
            if card:is_suit('Clubs') then
                table.insert(clubs, card)
                table.remove(self.cards, i)
            end
        end

        for _, card in ipairs(clubs) do
            table.insert(self.cards, 1, card)
        end
    end

    return ref
end
return { name = {"Blinds"}, items = {the_elm} }