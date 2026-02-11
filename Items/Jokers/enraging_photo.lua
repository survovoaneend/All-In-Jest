local enraging_photo = {
    object_type = "Joker",
    order = 190,

    key = "enraging_photo",
    config = {
        extra = {
            xmult = 2,
            active = false
        }
    },
    rarity = 2,
    pos = { x = 4, y = 7 },
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,

    loc_vars = function(self, info_queue, card)
        local active_text = "(" .. localize('k_inactive') .. ")"
        if card.ability.extra.active then
            active_text = "(" .. localize('k_active') .. ")"
        else
            active_text = "(" .. localize('k_inactive') .. ")"
        end
        return { vars = { card.ability.extra.xmult, active_text } }
    end,

    calculate = function(self, card, context)
        if context.jest_destroying_or_selling_joker or context.remove_playing_cards or context.selling_card then
            if not card.ability.extra.active then
                card.ability.extra.active = true
                return {
                    message = localize('k_active_ex')
                }
            end
        end
        if context.end_of_round and context.main_eval then
            if card.ability.extra.active then
                card.ability.extra.active = false
                return {
                    message = localize('k_reset')
                }
            end
        end
        if context.joker_main then
            if card.ability.extra.active then
                return {
                    xmult = card.ability.extra.xmult
                }
            end
        end
    end

}
return { name = { "Jokers" }, items = { enraging_photo } }
