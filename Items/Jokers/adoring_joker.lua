local adoring_joker = {
    object_type = "Joker",
    order = 67,
    ignore = true,
    key = "adoring_joker",
    config = {
      
    },
    rarity = 3,
    pos = { x = 13, y = 2 },
    atlas = 'joker_atlas',
    cost = 8,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                G.GAME.current_round.jest_highest_scored_mult.amount
            }
        }
    end,
  
    calculate = function(self, card, context)
      if context.joker_main then
          local xmlt = G.GAME.current_round.jest_highest_scored_mult.amount
          if xmlt > 0 then
              return {
                  mult = xmlt,
                  card = card
              }
          end
      end
      if (context.end_of_round or context.setting_blind) and context.cardarea == G.jokers then
        G.GAME.current_round.jest_highest_scored_mult.amount = 0
      end
    end
  
}
return { name = {"Jokers"}, items = {adoring_joker} }
