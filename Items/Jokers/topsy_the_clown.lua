local topsy_the_clown = {
    object_type = "Joker",
    order = 82,

    key = "topsy_the_clown",
    config = {
      
    },
    attributes = { 'chips', 'mult' },
    rarity = 1,
    pos = { x = 24, y = 2 },
    atlas = 'joker_atlas',
    cost = 4,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
  
    loc_vars = function(self, info_queue, card)
      info_queue[#info_queue+1] = {set = 'Other', key = 'palindrome'}
    end,
  
    calculate = function(self, card, context)
      if context.joker_main then
        
        local new_chips = next_palindrome(hand_chips)
        if next_palindrome(hand_chips) == hand_chips then
            new_chips = next_palindrome(hand_chips+1)
        end
        local new_mult = next_palindrome(mult)
        if next_palindrome(mult) == mult then
            new_mult = next_palindrome(mult+1)
        end
        return {
          aij_set_chips = new_chips,
          aij_set_mult = new_mult,
        }
      end
    end
  
}
return { name = {"Jokers"}, items = {topsy_the_clown} }
