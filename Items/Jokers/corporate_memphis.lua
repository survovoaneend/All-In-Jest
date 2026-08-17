local corporate_memphis = {
    object_type = "Joker",
    order = 927,
    ignore = true,
    key = "corporate_memphis",
    config = {
        extra = {
            bonus_slots = 2,
            pending_slots = 0,
            applied_slots = 0
        }
    },
    attributes = {'shop'},
    rarity = 2,
    pos = { x = 1, y = 43},
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,

    loc_vars = function(self, info_queue, card)
        return { 
            vars = {
                card.ability.extra.bonus_slots,
                card.ability.extra.pending_slots
            }
        }
    end,

    calculate = function(self, card, context)
        if context.skip_blind and not context.blueprint then
            card.ability.extra.pending_slots = card.ability.extra.pending_slots + card.ability.extra.bonus_slots
            return {
                message = localize { type = 'variable', key = 'a_aij_slots', vars = { card.ability.extra.bonus_slots }},
                colour = G.C.BLUE
            }
        end

        if context.starting_shop and card.ability.extra.pending_slots > 0 then
            change_shop_size(card.ability.extra.pending_slots)
            card.ability.extra.applied_slots = card.ability.extra.pending_slots
            card.ability.extra.pending_slots = 0
        end

        if context.ending_shop and card.ability.extra.applied_slots > 0 then
            change_shop_size(-card.ability.extra.applied_slots)
            card.ability.extra.applied_slots = 0
        end
    end,

    remove_from_deck = function(self, card, from_debuff)
        if card.ability.extra.applied_slots > 0 then
            change_shop_size(-card.ability.extra.applied_slots)
            card.ability.extra.applied_slots = 0
        end
    end
}
return { name = {"Jokers"}, items = {corporate_memphis} }