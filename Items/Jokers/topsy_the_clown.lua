local topsy_the_clown = {
    object_type = "Joker",
    order = 79,

    key = "topsy_the_clown",
    config = {
      
    },
    rarity = 1,
    pos = { x = 24, y = 2 },
    atlas = 'joker_atlas',
    cost = 4,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
  
    end,
  
    calculate = function(self, card, context)
      if context.joker_main then
        card:juice_up(0.4, 0.3)
        hand_chips = next_palindrome(hand_chips)
        mult = next_palindrome(mult)
        update_hand_text({ delay = 0 }, { mult = mult, chips = hand_chips })
      end
    end
  
}
return { name = {"Jokers"}, items = {topsy_the_clown} }
