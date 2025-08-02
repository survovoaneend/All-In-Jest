local the_branch = {
    object_type = "Blind",
    key = 'the_branch',
    boss = {
      min = 2,
    },
    mult = 2,
    boss_colour = HEX("88715a"),
    atlas = 'blinds',
    pos = {X = 0, y = 18 },
    order = 5,
    dollars = 5,

    calculate = function(self, card, context)
        
    end
    
}
local shuffleref = CardArea.shuffle
function CardArea:shuffle(_seed)
    local ref = shuffleref(self, _seed)

    local the_branch = G.GAME.blind and G.GAME.blind.config.blind.key == 'bl_aij_the_branch' and not G.GAME.blind.disabled
    if the_branch then
        
        local face_cards = {}

        for i = #self.cards, 1, -1 do
            local card = self.cards[i]
            if card:is_face() then
                table.insert(face_cards, card)
                table.remove(self.cards, i)
            end
        end

        for _, card in ipairs(face_cards) do
            table.insert(self.cards, 1, card) 
        end
    end

    return ref
end
return { name = {"Blinds"}, items = {the_branch} }