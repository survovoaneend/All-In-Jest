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
        -- Select which card to destroy early, since context.destroy_card triggers once per card
        if context.before and context.full_hand then
            local heart_count = 0
            for i = 1, #context.full_hand do
                if context.full_hand[i]:is_suit('Hearts', false, true) then
                    heart_count = heart_count + 1
                end
            end
            if heart_count >= card.ability.extra.suit_count then
                local can_destroy = {}
                for _, v in ipairs(context.full_hand) do
                    if not v.aij_bad_sun_marked_for_destruction then -- This doesnt work at the moment?
                        table.insert(can_destroy, v)
                    end
                end
                if #can_destroy > 0 then
                    local temp_card = pseudorandom_element(can_destroy, pseudoseed('bad_sun'))
                    temp_card.ability.aij_bad_sun_marked_for_destruction = true
                end
            end
        end

        -- Destroy the card
        -- Should this have a message?
        if context.destroy_card and context.destroy_card.ability.aij_bad_sun_marked_for_destruction then
            context.destroy_card.ability.aij_bad_sun_marked_for_destruction = nil
            return {
              juice_card = card,
              remove = true
            }
        end
    end
  
}
return { name = {"Jokers"}, items = {bad_sun} }
