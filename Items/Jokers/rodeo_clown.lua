local rodeo_clown = {
  object_type = "Joker",
  order = 173,

  key = "rodeo_clown",
  config = {
    extra = {
      mult = 0,
      mult_mod = 5
    }
  },
  rarity = 1,
  pos = { x = 16, y = 6},
  atlas = 'joker_atlas',
  cost = 5,
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
    if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
      if G.GAME.current_round.hands_left == 0 then
        SMODS.scale_card(card, {
          ref_table = card.ability.extra,
          ref_value = "mult",
          scalar_value = "mult_mod",
          operation = '+',
        })
      end
    end
    if context.joker_main then
      return {
        mult = card.ability.extra.mult
      }
    end 
  end
}
return { name = {"Jokers"}, items = {rodeo_clown} }
