local the_willow = {
    object_type = "Blind",
    key = 'the_willow',
    boss = {
        min = 2,
    },
    mult = 2,
    boss_colour = HEX("6f9282"),
    atlas = 'blinds',
    pos = { X = 0, y = 17 },
    order = 4,
    dollars = 5,

    disable = function(self)
        G.deck:shuffle('nr'..G.GAME.round_resets.ante)
    end,

    calculate = function(self, blind, context)

    end
}
local shuffleref = CardArea.shuffle
function CardArea:shuffle(_seed)
    local ref = shuffleref(self, _seed)

    local the_willow = G.GAME.blind and G.GAME.blind.config.blind.key == 'bl_aij_the_willow' and not G.GAME.blind.disabled
    if the_willow then
        local spades = {}

        for i = #self.cards, 1, -1 do
            local card = self.cards[i]
            if card:is_suit('Spades') then
                table.insert(spades, card)
                table.remove(self.cards, i)
            end
        end

        for _, card in ipairs(spades) do
            table.insert(self.cards, 1, card)
        end
    end

    return ref
end

return { name = { "Blinds" }, items = { the_willow } }
