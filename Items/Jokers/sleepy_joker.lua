local sleepy_joker = {
    object_type = "Joker",
    order = 5,
 ignore = true,

    key = "sleepy_joker",
    config = {
      extra = {
        xmult = 3
      }
    },
    rarity = 2,
    pos = { x = 6, y = 0 },
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.xmult
            }
        }
    end,
  
    calculate = function(self, card, context)
        if context.joker_main then
            if context.full_hand and #context.full_hand > 0 then
                local all_dark_suits = true
                for _, played_card in ipairs(context.full_hand) do
                    if not (played_card:is_suit('Spades') or played_card:is_suit('Clubs')) then
                        all_dark_suits = false
                        break
                    end
                end

                if all_dark_suits then
                    return {
                        xmult = card.ability.extra.xmult
                    }
                end
            end
        end
        return nil
    end
  
}
return { name = {"Jokers"}, items = {sleepy_joker} }
