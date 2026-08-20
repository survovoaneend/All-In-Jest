local numbertaker = {
    object_type = "Joker",
    order = 535,
    key = "numbertaker",
    config = {
        extra = {
            cur_mult = 0
        }
    },
    attributes = { 'modify_card', 'rank', 'mult', 'scaling' },
    rarity = 3,
    pos = { x = 2, y = 25 },
    atlas = 'joker_atlas',
    cost = 8,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.cur_mult
            }
        }
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and not context.blueprint then
            if not SMODS.has_no_rank(context.other_card) then
                local numbers = {}
                for _, v in ipairs(SMODS.Rank.obj_buffer) do
                    local r = SMODS.Ranks[v]
                    if v ~= 'Ace' and not r.face then numbers[v] = true end
                end
                local other_card_rank = context.other_card.base.value
                if numbers[other_card_rank] then
                    SMODS.scale_card(card, {
                        ref_table = card.ability.extra,
                        ref_value = "cur_mult",
                        scalar_table = {value = context.other_card.base.nominal},
                        scalar_value = "value",
                        no_message = true
                    })
                    return {
                        func = function()
                            aij_remove_rank(context.other_card)
                            card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize('k_upgrade_ex')})
                        end
                    }
                end
            end
        end
        if context.joker_main then
            return {
                mult = card.ability.extra.cur_mult
            }
        end
    end
}

return { name = { "Jokers" }, items = { numbertaker } }
