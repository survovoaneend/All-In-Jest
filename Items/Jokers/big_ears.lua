local big_ears = {
    object_type = "Joker",
    order = 74,

    key = "big_ears",
    config = {
        extra = {
            chips = 0,
            chip_mod = 2,
            chip_dec = 1
        }
    },
    rarity = 2,
    pos = { x = 19, y = 2 },
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.chips,
                card.ability.extra.chip_mod,
                card.ability.extra.chip_dec
            }
        }
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and not context.blueprint then
            if (context.other_card:get_id() <= 10 and context.other_card:get_id() >= 0 and context.other_card:get_id() % 2 == 0) then
                card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chip_mod
                return {
                    message = localize('k_upgrade_ex'),
                    colour = G.C.CHIPS,
                    message_card = card
                }
            elseif ((context.other_card:get_id() <= 10 and context.other_card:get_id() >= 0 and context.other_card:get_id() % 2 == 1) or (context.other_card:get_id() == 14)) then
               local prev_chips = card.ability.extra.chips
                card.ability.extra.chips = math.max(0, card.ability.extra.chips - card.ability.extra.chip_dec)
                 if card.ability.extra.chips ~= prev_chips then
                return {
                    message = localize('k_aij_downgrade_ex'),
                    colour = G.C.CHIPS,
                    message_card = card
                }
            end
            end
        end
        if context.joker_main then
            return {
                chips = card.ability.extra.chips
            }
        end
    end

}
return { name = { "Jokers" }, items = { big_ears } }
