local the_alder = {
    object_type = "Blind",
    key = 'the_alder',
    boss = {
      min = 2,
    },
    mult = 2,
    boss_colour = HEX("af6457"),
    atlas = 'blinds',
    pos = {X = 0, y = 2 },
    order = 3,
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

    local the_alder = G.GAME.blind and G.GAME.blind.config.blind.key == 'bl_aij_the_alder' and not G.GAME.blind.disabled
    if the_alder then
        local hearts = {}

        for i = #self.cards, 1, -1 do
            local card = self.cards[i]
            if card:is_suit('Hearts') then
                table.insert(hearts, card)
                table.remove(self.cards, i)
            end
        end

        for _, card in ipairs(hearts) do
            table.insert(self.cards, 1, card)
        end
    end

    return ref
end

return { name = {"Blinds"}, items = {the_alder} }