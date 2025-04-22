SMODS.Joker {
  key = "scurra",
  config = {
      extra = {
          retriggers = 1
      }
  },
  rarity = 2,
  pos = { x = 18, y = 6 }, 
  atlas = 'joker_atlas',   
  cost = 6,
  unlocked = true,
  discovered = true,
  blueprint_compat = true,
  eternal_compat = true, 

  loc_vars = function(self, info_queue, card)
      info_queue[#info_queue + 1] = {set = 'Other', key = 'red_seal'}
      return { vars = { card.ability.extra.retriggers } }
  end,

  calculate = function(self, card, context)
      if context.repetition and context.cardarea == G.play then
          if context.other_card and context.other_card:get_seal() == 'Red' and not context.other_card.debuff then
              return {
                  message = localize('k_again_ex'), 
                  repetitions = card.ability.extra.retriggers, 
                  card = card 
              }
          end
      end
  end
}