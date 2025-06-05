local adoring_joker = {
    object_type = "Joker",
    order = 67,
    key = "adoring_joker",
    config = {
      jest_highest_scored_mult = {},
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
      if context.final_scoring_step and context.cardarea == G.jokers then
        local Mult = mult
        table.insert(card.ability.jest_highest_scored_mult, Mult)
        for i = 1, #card.ability.jest_highest_scored_mult do
            Mult = math.max(Mult, card.ability.jest_highest_scored_mult[i])
            card.ability.highest_mult = Mult
        end
        if Mult > mult then
            return {
                mult = Mult - mult,
                remove_default_message = true,
                message = '=' .. Mult .. ' Mult',
                colour = G.C.RED,
                sound = 'multhit1'
            }
        end
      end
      if (context.end_of_round and G.GAME.blind.boss) and context.cardarea == G.jokers then
        card.ability.jest_highest_scored_mult = {}
        card.ability.highest_mult = 0
      end
    end
  
}
return { name = {"Jokers"}, items = {adoring_joker} }
