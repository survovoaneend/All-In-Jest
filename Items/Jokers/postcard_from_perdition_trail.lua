local postcard_from_perdition_trail = {
  object_type = "Joker",
  order = 209,

  key = "postcard_from_perdition_trail",
  config = {
    extra = {
      perma_mult = 0.5,
    }
  },
  attributes = { 'modify_card', 'seals', 'xmult', 'perma_bonus' },
  rarity = 3,
  pos = { x = 17, y = 7 },
  atlas = 'joker_atlas',
  cost = 8,
  unlocked = true,
  discovered = false,
  blueprint_compat = true,
  eternal_compat = true,

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.perma_mult
      }
    }
  end,

  calculate = function(self, card, context)
    if context.before and not context.blueprint then
      for _, v in ipairs(context.scoring_hand) do
        if v.seal ~= nil then
          v:set_seal(nil)
          v:juice_up()
          v.ability.perma_x_mult = (v.ability.perma_x_mult or 0) + card.ability.extra.perma_mult
        end
      end
    end
  end,
  in_pool = function(self, args)
    if G.GAME and G.playing_cards then
      for _, card in ipairs(G.playing_cards) do
        if card.seal then
          return true
        end
      end
    end
    return false
  end,
}
return { name = { "Jokers" }, items = { postcard_from_perdition_trail } }
