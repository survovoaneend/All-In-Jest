local chromatist = {
    object_type = "Joker",
    order = 380,
    key = "chromatist",
    config = {
        extra = {
            xmult = 2,
        }
    },
    rarity = 3,
    pos = { x = 7, y = 15},
    atlas = 'joker_atlas',
    cost = 8,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card) 
        return {
            vars = {
                card.ability.extra.xmult,
            }
        }
    end,

    in_pool = function(self, args)
        if G.jokers and G.jokers.cards then
            for _, card in ipairs(G.jokers.cards) do
                if card.edition and card.edition.key == 'e_polychrome' then
                    return true
                end
            end
        end
        if G.playing_cards then
            for _, card in ipairs(G.playing_cards) do
                if card.edition and card.edition.key == 'e_polychrome' then
                    return true
                end
            end
        end
        return false
    end,

    calculate = function(self, card, context)
        if context.all_in_jest and context.all_in_jest.calculating_edition then
            if context.all_in_jest.edition.key == 'e_polychrome' then
                SMODS.calculate_effect({xmult = card.ability.extra.xmult}, card)
            end
        end
    end
}
return { name = {"Jokers"}, items = {chromatist} }
