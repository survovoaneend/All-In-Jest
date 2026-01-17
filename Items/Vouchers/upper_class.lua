local upper_class = {
  object_type = "Voucher",
  key = 'upper_class',
  config = {
    
  },
  requires = {
    'v_aij_common_caste'
  },
  atlas = 'vouchers_atlas',
  pos = { x = 5, y = 1 },
  discovered = false,
  order = 11,

  loc_vars = function(self, info_queue)
    
  end,

  calculate = function(self, card, context)
    if context.starting_shop then
        G.E_MANAGER:add_event(Event ({
            trigger = 'before',
            func = function()
                local prev = G.GAME.aij_uncommon_packs_rate
                G.GAME.aij_uncommon_packs_rate = 1
                SMODS.add_booster_to_shop(get_pack('upper_class', 'aij_uncommon').key)
                aij_uncommon_packs_rate = prev
                return true
            end 
        }))
    end
  end,
}
return {name = "Vouchers", items = {upper_class}}