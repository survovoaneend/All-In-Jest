local mahoney = {
    object_type = "Joker",
    order = 276,

    key = "mahoney",
    config = {
      extra = {
        odds = 2
      }
    },
    rarity = 2,
    pos = { x = 24, y = 10},
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = {set = 'Tag', key = 'tag_voucher'}
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds)
        return {
            vars = {
                numerator, denominator,
            }
        }
    end,
  
    calculate = function(self, card, context)
        if context.skip_blind and SMODS.pseudorandom_probability(card, 'mahoney', 1, card.ability.extra.odds) then
            G.E_MANAGER:add_event(Event({
                func = (function()
                    card:juice_up()
                    jest_add_tag('tag_voucher')
                    return true
                end)
            }))
        end
    end
  
}
return { name = {"Jokers"}, items = {mahoney} }
