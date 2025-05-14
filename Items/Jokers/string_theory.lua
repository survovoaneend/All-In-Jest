local string_theory = {
    object_type = "Joker",
    order = 94,
     ignore = true,
    key = "string_theory",
    config = {
      
    },
    rarity = 2,
    pos = { x = 14, y = 3 },
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
  
    end,
  
    calculate = function(self, card, context)
        if context.poker_hands and context.scoring_hand and not next(context.poker_hands["Straight"]) then
            table.insert(context.poker_hands["Straight"], context.scoring_hand)
        end
    end
  
}
return { name = {"Jokers"}, items = {string_theory} }
