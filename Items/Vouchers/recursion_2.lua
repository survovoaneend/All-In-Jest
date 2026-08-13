local recursion = {
  object_type = "Voucher",
  key = 'recursion_2',
  config = {
    extra = {
      slots = 1,
      discount = 2,
    }
  },
  requires = {
    'v_aij_recursion'
  },
  atlas = 'vouchers_atlas',
  pos = { x = 7, y = 0 },
  discovered = false,
  order = 13,

  loc_vars = function(self, info_queue, card)
    return {vars = {card.ability.extra.slots, card.ability.extra.discount}}
  end,

  redeem = function(self, card)
    SMODS.change_voucher_limit(card.ability.extra.slots)
    G.GAME.all_in_jest.voucher_discount = G.GAME.all_in_jest.voucher_discount + card.ability.extra.discount
    G.E_MANAGER:add_event(Event ({
      trigger = 'after',
      func = function()
        if G.shop_vouchers then
          for _, v in ipairs(G.shop_vouchers.cards) do
            v:set_cost()
          end
        end
        return true
      end 
    }))
  end,
}

local aij_card_set_cost_ref = Card.set_cost_value
function Card:set_cost_value()
  if self.ability.set == 'Voucher' and G.GAME.all_in_jest.voucher_discount then
    self.extra_cost = self.extra_cost - G.GAME.all_in_jest.voucher_discount
  end
  aij_card_set_cost_ref(self)
end

return {name = "Vouchers", items = {recursion}}