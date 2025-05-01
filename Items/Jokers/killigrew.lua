local killigrew = {
    object_type = "Joker",
    order = 276,

    key = "killigrew",
    config = {
        extra = {
            Xmult_mod = 1
        }
    },
    rarity = 4,
		unlock_condition = {hidden = true},
    pos = { x = 0, y = 6},
    atlas = 'legendary_atlas',
    in_pool = function(self, args)
        return (redeemed_voucher_count() >= 1)
    end,
    cost = 4,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    soul_pos = { x = 0, y = 7},
  
    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.Xmult_mod, redeemed_voucher_count() * card.ability.extra.Xmult_mod}}
    end,

    calculate = function(self, card, context)
        if context.buying_card and context.card.ability.set == "Voucher" then
            G.E_MANAGER:add_event(Event({
                func = function() card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize{type='variable',key='a_xmult',vars={redeemed_voucher_count() * card.ability.extra.Xmult_mod}}}); return true
                end}))
            return
        end
        if context.joker_main then
            local xmlt = redeemed_voucher_count() * card.ability.extra.Xmult_mod
            if xmlt > 1 then
                return {
                    message = localize{type='variable',key='a_xmult',vars={xmlt}},
                    Xmult_mod = xmlt,
                }
            end
        end
    end,
  
}
return { name = {"Jokers"}, items = {killigrew} }
