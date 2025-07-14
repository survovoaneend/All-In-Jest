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
      info_queue[#info_queue+1] = {set = 'Other', key = 'palindrome'}
    end,
  
    calculate = function(self, card, context)
      if context.joker_main then
        
        local chip_mod = next_palindrome(to_number(hand_chips)) - to_number(hand_chips)
        local mult_mod = next_palindrome(to_number(mult)) - to_number(mult)
        return {
          chips = chip_mod,
          mult = mult_mod,
        }
      end
    end
  
}
return { name = {"Jokers"}, items = {topsy_the_clown} }
