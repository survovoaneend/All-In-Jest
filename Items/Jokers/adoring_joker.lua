local adoring_joker = {
    object_type = "Joker",
    order = 67,
  ignore = true,
    key = "adoring_joker",
    config = {
      jest_highest_scored_mult = {}
    },
    rarity = 3,
    pos = { x = 13, y = 2 },
    atlas = 'joker_atlas',
    cost = 8,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,
      
    loc_vars = function(self, info_queue, card)
        
    end,
      
    calculate = function(self, card, context)
      if context.final_scoring_step and context.cardarea == G.jokers then
        local Mult = mult
        table.insert(card.ability.jest_highest_scored_mult, Mult)
        for i = 1, #card.ability.jest_highest_scored_mult do
            Mult = math.max(Mult, card.ability.jest_highest_scored_mult[i])
        end
        if Mult > mult then
            return {
                mult = Mult - mult,
                remove_default_message = true
            }
        end
      end
      if (context.end_of_round or context.setting_blind) and context.cardarea == G.jokers then
        card.ability.jest_highest_scored_mult = {}
      end
    end
  
}
return { name = {"Jokers"}, items = {adoring_joker} }
