SMODS.Joker {
  key = "alexandre",
  config = {
    extra = {
      mult = 0,
      mult_mod = 15,
    }
  },
  loc_txt = {
    name = "Alexandre",
    text ={
        "This Joker gains {C:red}+15{}",
        "Mult if {C:attention}played hand{}",
        "is only {C:clubs}Club{} {C:attention}Kings{}",
        "{C:inactive}(Currently{} {C:red}+#1#{}{C:inactive{} Mult)",

    },
},
  rarity = 3,
  pos = { x = 21, y = 9},
  atlas = 'joker_atlas',
  cost = 8,
  unlocked = true,
  discovered = true,
  blueprint_compat = true,
  eternal_compat = true,

  loc_vars = function(self, info_queue, card)
      return {
        vars = {
          card.ability.extra.mult
        }
      }
  end,

  calculate = function(self, card, context)
    local club_kings, all_cards = 0, 0
    if context.before then
      for k, v in ipairs(context.full_hand) do
        all_cards = all_cards + 1
        if v:get_id() == 13 and v:is_suit('Clubs') then
          club_kings = club_kings + 1
        end
      end
     if club_kings == all_cards and not context.blueprint then 
        card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_mod
        return {
          message = localize('k_upgrade_ex')
        }
      end
    end
    if context.joker_main then
      return {
          mult = card.ability.extra.mult,
      }
    end
  end
}