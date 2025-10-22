local adoring_joker = {
    object_type = "Joker",
    order = 67,
    key = "adoring_joker",
    config = {
      highest_mult = 0
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
        return {
          vars = {
            card.ability.highest_mult
          }
        }
    end,
      
    calculate = function(self, card, context)
      -- BUG:
      -- final_scoring_step isn't actually final
      if context.final_scoring_step and context.cardarea == G.jokers and not context.blueprint then
        card.ability.highest_mult = math.max(card.ability.highest_mult, mult)
        if card.ability.highest_mult > mult then
            return {
                mult = card.ability.highest_mult - mult,
                remove_default_message = true,
                message = '=' .. card.ability.highest_mult .. ' Mult',
                colour = G.C.RED,
                sound = 'multhit1'
            }
        end
      end
      if (context.end_of_round and context.beat_boss) and context.cardarea == G.jokers then
        card.ability.highest_mult = 0
      end
    end
  
}
return { name = {"Jokers"}, items = {adoring_joker} }
