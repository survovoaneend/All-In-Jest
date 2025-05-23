local chitty = {
  object_type = "Joker",
  order = 263,

  key = "chitty",
  config = {
    extra = {
      slot_count = 1,
    }
  },
  rarity = 3,
  pos = { x = 11, y = 10 },
  atlas = 'joker_atlas',
  cost = 8,
  unlocked = true,
  discovered = false,
  blueprint_compat = false,
  eternal_compat = true,

  pixel_size = { w = 61, h = 95 },

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.slot_count
      }
    }
  end,

  add_to_deck = function(self, card, from_debuff)
    SMODS.change_voucher_limit(card.ability.extra.slot_count)
  end,


  remove_from_deck = function(self, card, from_debuff)
    SMODS.change_voucher_limit(-card.ability.extra.slot_count)
  end,

  calculate = function(self, card, context)
    
  end


}
return { name = {"Jokers"}, items = {chitty} }
