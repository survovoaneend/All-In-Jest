local alexandre = {
  object_type = "Joker",
  order = 185,

  key = "alexandre",
  config = {
    extra = {
      mult = 0,
      mult_mod = 7,
    }
  },
  rarity = 3,
  pos = { x = 21, y = 9},
  atlas = 'joker_atlas',
  cost = 8,
  unlocked = true,
  discovered = false,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = false,

  loc_vars = function(self, info_queue, card)
      return {
        vars = {
          card.ability.extra.mult_mod,
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
return { name = {"Jokers"}, items = {alexandre} }
