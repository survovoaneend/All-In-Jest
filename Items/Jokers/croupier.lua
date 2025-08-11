local croupier = {
    object_type = "Joker",
    order = 327,
    key = "croupier",
    config = {
        extra = {
            money = 10,
        }
    },
    rarity = 1,
    pos = { x = 23, y = 12 },
    atlas = 'joker_atlas',
    cost = 4,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.money,
            }
        }
    end,

    calculate = function(self, card, context)
        if context.all_in_jest and context.all_in_jest.before_after then
            if (context.total_chips + G.GAME.chips > (G.GAME.blind.chips * 2)) then
                return {
                    dollars = card.ability.extra.money, 
                    card = card,
                }
            end
        end
    end

}
return { name = { "Jokers" }, items = { croupier } }
