local magic_hat = {
    object_type = "Joker",
    order = 192,

    key = "magic_hat",
    config = {
        extra = {
            handsize_mod = 3,
            to_remove = '0'
        }
    },
    rarity = 1,
    pos = { x = 6, y = 7},
    atlas = 'joker_atlas',
    cost = 4,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.handsize_mod,
            }
        }
    end,
  
    calculate = function(self, card, context)
        if context.open_booster then
            if context.card.config.center.draw_hand then
                local amount = card.ability.extra.handsize_mod
                G.hand:change_size(amount)
                card.ability.extra.to_remove = tostring(tonumber(card.ability.extra.to_remove) + amount)
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize { type = 'variable', key = "a_aij_handsize", vars = { amount }}, colour = G.C.FILTER})
            end
        end
        if context.ending_booster then
            local amount = tonumber(card.ability.extra.to_remove)
            if amount > 0 then
                G.hand:change_size(-amount)
                card.ability.extra.to_remove = '0'
            end
        end
    end,

    remove_from_deck = function(self, card, from_debuff)
        local amount = tonumber(card.ability.extra.to_remove)
        if amount > 0 then
            G.hand:change_size(-amount)
            card.ability.extra.to_remove = '0'
        end
    end,
}
return { name = {"Jokers"}, items = {magic_hat} }
