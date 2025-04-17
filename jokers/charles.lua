SMODS.Joker {
  key = "charles",
  config = {
    extra = {
      xmult = 1,
      xmult_mod = 0.25
    }
  },
  loc_txt = {
    name = "Charles",
    text ={
        "This Joker gains {X:red,C:white}X0.25{}",
        "Mult if {C:attention}played hand{}",
        "is only {C:hearts}Heart{} {C:attention}Kings{}",
        "{C:inactive}(Currently{} {X:red,C:white}X#1#{}{C:inactive{} Mult)",

    },
},
  rarity = 3,
  pos = { x = 19, y = 9},
  atlas = 'joker_atlas',
  cost = 8,
  unlocked = true,
  discovered = true,
  blueprint_compat = true,
  eternal_compat = true,

  loc_vars = function(self, info_queue, card)
      return {
        vars = {
          card.ability.extra.xmult
        }
      }
  end,

  calculate = function(self, card, context)
    local heart_kings, all_cards = 0, 0
    if context.before then
      for k, v in ipairs(context.full_hand) do
        all_cards = all_cards + 1
        if v:get_id() == 13 and v:is_suit('Hearts') then
          heart_kings = heart_kings + 1
        end
      end
     if heart_kings == all_cards and not context.blueprint then 
        card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.xmult_mod
        return {
          message = localize('k_upgrade_ex')
        }
      end
    end
    if context.joker_main then
      return {
          xmult = card.ability.extra.xmult,
      }
    end
  end
}