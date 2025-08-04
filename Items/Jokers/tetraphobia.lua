local tetraphobia = {
  object_type = "Joker",
  order = 139,

  key = "tetraphobia",
  config = {
    extra = { 
        mult = 0,
        mult_mod = 1}
  },
  rarity = 1,
  pos = {x = 8, y = 5 },
  atlas = 'joker_atlas',
  cost = 5,
  unlocked = true,
  discovered = false,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = false,

  loc_vars = function(self, info_queue, card)
      return { vars = { card.ability.extra.mult or 0, card.ability.extra.mult_mod } }
  end,

  calculate = function(self, card, context)
      
      if context.discard and context.other_card and context.other_card:get_id() == 4 and not context.other_card.debuff then
          card.ability.extra.mult = (card.ability.extra.mult or 0) + card.ability.extra.mult_mod
          card_eval_status_text(card, 'extra', nil, nil, nil, {
              message = '+'..(card.ability.extra.mult or 0)..' Mult',
              colour = G.C.MULT
          })
          return { card = card }
      end

      
      if context.individual and context.cardarea == G.play and context.other_card and context.other_card:get_id() == 4 then
          if (card.ability.extra.mult or 0) > 0 then
               card.ability.extra.mult = 0
               card_eval_status_text(card, 'extra', nil, nil, nil, {
                  message = localize('k_reset')..'!',
                  colour = G.C.RED
               })
               return { card = card } 
          end
      end

    
      if context.joker_main and (card.ability.extra.mult or 0) > 0 then
          return {
              mult = card.ability.extra.mult,
          }
        end
  end
}
return { name = {"Jokers"}, items = {tetraphobia} }
