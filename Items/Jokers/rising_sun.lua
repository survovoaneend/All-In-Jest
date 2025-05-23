local rising_sun = {
    object_type = "Joker",
    order = 124,

    key = "rising_sun",
    config = {
        extra = {
            retriggers = 1,
        }
    },
    rarity = 1,
    pos = { x = 18, y = 4 },
    atlas = 'joker_atlas',
    cost = 4,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
  
    end,
  
    calculate = function(self, card, context)
      if context.repetition and context.cardarea == G.play and (G.GAME.current_round.hands_left == 0 or G.GAME.current_round.hands_played == 0)then
        if context.other_card == context.scoring_hand[1] or context.other_card == context.scoring_hand[#context.scoring_hand] then
            return {
                message = localize('k_again_ex'),
                repetitions = card.ability.extra.retriggers,
                card = card
            }
        end
      end 
    end
  
}
return { name = {"Jokers"}, items = {rising_sun} }
