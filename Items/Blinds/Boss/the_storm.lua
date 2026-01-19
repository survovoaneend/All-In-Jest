local the_storm = {
    object_type = "Blind",
    key = 'the_storm',
    boss = {
        min = 3,
    },
    mult = 2,
    boss_colour = HEX("b48b52"),
    atlas = 'blinds',
    pos = { X = 0, y = 53 },
    order = 37,
    dollars = 5,


    calculate = function(self, blind, context)
        local temp = G.GAME.blind and G.GAME.blind.disabled
        if temp then
            return
        end
        if context.after and context.full_hand and context.scoring_hand and not temp then
            if #context.scoring_hand >= 3 then
                local cards_to_destroy = {}
                for i = 1, #context.full_hand do
                    cards_to_destroy[#cards_to_destroy + 1] = context.full_hand[i]
                end
                if #cards_to_destroy > 0 then
                    blind:wiggle()
                    SMODS.destroy_cards(cards_to_destroy)
                end
            end
        end
    end

}
return { name = { "Blinds" }, items = { the_storm } }
