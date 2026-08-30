local recursion = {
  object_type = "Voucher",
  key = 'recursion',
  config = {
    extra = {
      slots = 1,
    }
  },
  attributes = {'voucher', 'shop'},
  atlas = 'vouchers_atlas',
  pos = { x = 6, y = 0 },
  discovered = false,
  order = 12,

  loc_vars = function(self, info_queue, card)
    return {vars = {card.ability.extra.slots}}
  end,

  redeem = function(self, card)
    SMODS.change_voucher_limit(card.ability.extra.slots)
  end,
}
return {name = "Vouchers", items = {recursion}}