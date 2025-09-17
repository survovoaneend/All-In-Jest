local downing_street = {
    object_type = "Joker",
    order = 265,
    
    key = "downing_street",
    config = {
      extra = { odds = 10}
    },
    rarity = 2,
    pos = { x = 12, y = 10},
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds)
        return {
            vars = {
                numerator, denominator,
            }
        }
    end,
  
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            if context.other_card:get_id() == 10 and SMODS.pseudorandom_probability(card, 'downing', 1, card.ability.extra.odds) then
                return {
                    focus = card,
                    message = localize('aij_plus_tag'),
                    func = function()
                        G.E_MANAGER:add_event(Event({
                            trigger = 'before',
                            delay = 0.0,
                            func = (function()
                                jest_add_tag(jest_poll_tag("downing_tag"))
                                return true
                            end)
                        }))
                    end,
                    card = card
                }
            end
        end
    end
  
}
return { name = {"Jokers"}, items = {downing_street} }
