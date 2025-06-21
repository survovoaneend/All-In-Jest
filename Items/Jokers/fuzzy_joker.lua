local fuzzy_joker = {
    object_type = "Joker",
    order = 259,
    key = "fuzzy_joker",
    config = {
      
    },
    rarity = 2,
    pos = { x = 6, y = 10},
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
  
    end,
  
    calculate = function(self, card, context)
        if context.joker_main then
            card:juice_up(0.4, 0.3)
            if hand_chips <= 0 then return 1 end
            local power = math.ceil(math.log10(hand_chips))
            hand_chips = 10 ^ power
            mult = mult
            update_hand_text({ delay = 0 }, { mult = mult, chips = hand_chips })
        end
    end
}
return { name = {"Jokers"}, items = {fuzzy_joker} }
