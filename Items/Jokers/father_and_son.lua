local father_and_son = {
    object_type = "Joker",
    order = 492,
    key = "father_and_son",
    
    config = {
        extra = {
            gain = 0.25,
            xmult = 1
        }
    },
    rarity = 2,
    pos = { x = 8, y = 24 },
    atlas = 'joker_atlas',
    cost = 7,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.xmult,
                card.ability.extra.gain
            }
        }
    end,

    calculate = function(self, card, context)
         if context.before and not context.blueprint then
            local kings = 0
            local jacks = 0
            for _, v in ipairs(context.scoring_hand) do
                if v:get_id() == 13 then kings = kings + 1 end
                if v:get_id() == 11 then jacks = jacks + 1 end
            end
            
            if kings == 1 and jacks == 1 then
                card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.gain
                return {
                    message = localize('k_upgrade_ex'),
                    colour = G.C.MULT
                }
            end
        end
        if context.joker_main then
            if card.ability.extra.xmult > 1 then
                return {
                    xmult = card.ability.extra.xmult
                }
            end
        end
    end
}

return { name = { "Jokers" }, items = { father_and_son } }
