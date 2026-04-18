local brass_joker = {
    object_type = "Joker",
    order = 443,
    key = "brass_joker",
    config = {
        extra = {
            mult = 0,
            mult_mod = 0
        }
    },
    rarity = 2,
    pos = { x = 13, y = 22 },
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.mult,
                colours = {
                    G.C.SECONDARY_SET.Enhanced
                }
            }
        }
    end,

    calculate = function(self, card, context)
        if context.all_in_jest and context.all_in_jest.joker_ability_used and not context.blueprint then
            local other_card = context.all_in_jest.card
            local center = other_card.config.center.all_in_jest
            card.ability.extra.mult_mod = center.ability_cost(center, other_card)
            SMODS.scale_card(card, {
	            ref_table = card.ability.extra,
                ref_value = "mult",
	            scalar_value = "mult_mod",
            })
        end
        if context.joker_main then
            return {
                mult = card.ability.extra.mult
            }
        end
    end,

    in_pool = function(self, args)
        if G.jokers then
            if #G.jokers.cards > 0 then
                for i = 1, #G.jokers.cards do
                    if G.jokers.cards[i].config.center.all_in_jest and G.jokers.cards[i].config.center.all_in_jest.ability_cost then
                        return true
                    end
                end
            end
        end
        return false
    end,
}

return { name = { "Jokers" }, items = { brass_joker } }
