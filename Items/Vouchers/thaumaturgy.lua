local thaumaturgy = {
  object_type = "Voucher",
  key = 'thaumaturgy',
  config = {
    
  },
  requires = {
    'v_aij_embraced_arcane'
  },
  atlas = 'vouchers_atlas',
  pos = { x = 3, y = 1 },
  discovered = false,
  order = 9,

  loc_vars = function(self, info_queue)
    
  end,

  calculate = function(self, card, context)
    if context.starting_shop then
        G.E_MANAGER:add_event(Event ({
            trigger = 'before',
            func = function()
                SMODS.add_booster_to_shop(get_pack('thaumaturgy', 'Arcana').key)
                return true
            end 
        }))
    end
  end,
}
return {name = "Vouchers", items = {thaumaturgy}}