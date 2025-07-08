local taikomochi = {
  object_type = "Joker",
  order = 164,

  key = "taikomochi",
  config = {
    extra = {
      chips = 100
    }
  },
  rarity = 3,
  pos = { x = 8, y = 6},
  atlas = 'joker_atlas',
  cost = 8,
  unlocked = true,
  discovered = false,
  blueprint_compat = true,
  eternal_compat = true,

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.chips
      }
    }
  end,

  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.hand and not context.end_of_round then
      if context.other_card:get_id() == 11 then
        if context.other_card.debuff then
          return {
            message = localize('k_debuffed'),
            colour = G.C.RED,
            card = card,
          }
        else
          return {
            chips = card.ability.extra.chips,
            card = card
          }
        end
      end
    end
  end
}
return { name = {"Jokers"}, items = {taikomochi} }
