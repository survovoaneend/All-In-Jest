local bad_sun = {
    object_type = "Joker",
    order = 344,
    key = "bad_sun",
    config = {
      extra = {
        suit_count = 3,
      }
    },
    rarity = 2,
    pos = { x = 15, y = 13},
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.suit_count,
            }
        }
    end,
  
    calculate = function(self, card, context)
        if context.after and context.full_hand then
            local heart_count = 0
            for i = 1, #context.full_hand do
                if context.full_hand[i]:is_suit('Hearts') then
                    heart_count = heart_count + 1
                end
            end
            if heart_count >= card.ability.extra.suit_count then
                local temp_card = pseudorandom_element(context.full_hand, pseudoseed('bad_sun'))
                G.E_MANAGER:add_event(Event({
                    func = function()
                        temp_card:start_dissolve()
                        return true
                    end
                }))
            end
        end
    end
  
}
return { name = {"Jokers"}, items = {bad_sun} }
