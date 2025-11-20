local the_enigma = {
    object_type = "Blind",
    key = 'the_enigma',
    boss = {
        min = 4,
    },
    in_pool = function(self)
        if G.playing_cards then
            local count = 0
            for k, v in ipairs(G.playing_cards) do
                if next(SMODS.get_enhancements(v)) then
                    count = count + 1
                end
            end
            return count >= 4
        end
    end,
    mult = 1.5,
    boss_colour = HEX("6b4d74"),
    atlas = 'blinds',
    pos = { X = 0, y = 42 },
    order = 21,
    dollars = 5,


    calculate = function(self, blind, context)

    end,

}
local shuffleref = CardArea.shuffle
function CardArea:shuffle(_seed)
    local ref = shuffleref(self, _seed)

    local the_enigma = G.GAME.blind and G.GAME.blind.config.blind.key == 'bl_aij_the_enigma' and
    not G.GAME.blind.disabled
    if the_enigma then
        local enhanced_cards = {}

        for i = #self.cards, 1, -1 do
            local card = self.cards[i]
            if next(SMODS.get_enhancements(card)) then
                table.insert(enhanced_cards, card)
                table.remove(self.cards, i)
            end
        end

        for _, card in ipairs(enhanced_cards) do
            table.insert(self.cards, 1, card)
        end
    end

    return ref
end

return { name = { "Blinds" }, items = { the_enigma } }
