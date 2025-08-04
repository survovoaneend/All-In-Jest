local tract = {
    object_type = "Joker",
    order = 252,
    
    key = "tract",
    config = {
      extra = {
        chips = 0,
        chip_mod = 50
      }
    },
    rarity = 3,
    pos = { x = 24, y = 9},
    atlas = 'joker_atlas',
    cost = 8,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,

    pixel_size = { w = 47, h = 95 },

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.chip_mod,
                redeemed_voucher_count() * card.ability.extra.chip_mod
            }
        }
    end,
  
    calculate = function(self, card, context)
      if context.buying_card and context.card.ability.set == "Voucher" then
            G.E_MANAGER:add_event(Event({
                func = function() card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize{type='variable',key='a_chips',vars={redeemed_voucher_count() * card.ability.extra.chip_mod}}}); return true
                end}))
            return
        end
        if context.joker_main then
            local chips = redeemed_voucher_count() * card.ability.extra.chip_mod
            if chips > 0 then
                return {
                    chips = chips
                }
            end
        end
    end
  
}
return { name = {"Jokers"}, items = {tract} }
