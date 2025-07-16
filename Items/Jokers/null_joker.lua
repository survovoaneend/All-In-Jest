local null_joker = {
  object_type = "Joker",
  order = 87,

  key = "null_joker",
  config = {
    extra = { }
  },
  rarity = 1,
  pos = { x = 7, y = 3 },
  atlas = 'joker_atlas',
  cost = 4,
  unlocked = true,
  discovered = false,
  blueprint_compat = false,
  eternal_compat = true,

  loc_vars = function(self, info_queue, card)
      return {}
  end,

  calculate = function(self, card, context)
    if context.mod_probability and context.trigger_obj then
        return {
            numerator = context.numerator * 0,
            denominator = context.denominator
        }
    end
  end
}
return { name = {"Jokers"}, items = {null_joker} }
