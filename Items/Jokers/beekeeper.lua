local beekeeper = {
    object_type = "Joker",
    order = 911,

    key = "beekeeper",
    config = {
        extra = {
            chips = 20,
            mult = 4
        }
    },
    attributes = {'six', 'mult', 'chips', 'rank'},
    rarity = 1,
    pos = { x = 7, y = 42},
    atlas = 'joker_atlas',
    cost = 4,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,

    loc_vars = function(self, info_queue, card)
        return { 
            vars = {
                card.ability.extra.chips,
                card.ability.extra.mult
            }
        }
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.hand and not context.end_of_round and context.other_card:get_id() == 6 then
            if context.other_card.debuff then
                return {
                    message = localize('k_debuffed'),
                    colour = G.C.RED
                }
            else
                return {
                    mult = card.ability.extra.mult,
                    chips = card.ability.extra.chips
                }
            end
        end
    end
}
return { name = {"Jokers"}, items = {beekeeper} }