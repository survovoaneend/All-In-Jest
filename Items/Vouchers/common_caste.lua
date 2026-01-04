local common_caste = {
  object_type = "Voucher",
  key = 'common_caste',
  config = {
    
  },
  atlas = 'vouchers_atlas',
  pos = { x = 4, y = 1 },
  discovered = false,
  order = 10,

  loc_vars = function(self, info_queue)
    
  end,

  calculate = function(self, card, context)
    if context.starting_shop then
        G.E_MANAGER:add_event(Event ({
            trigger = 'before',
            func = function()
                local prev = G.GAME.aij_common_packs_rate
                G.GAME.aij_common_packs_rate = 1
                SMODS.add_booster_to_shop(get_pack('common_caste', 'aij_common').key)
                G.GAME.aij_common_packs_rate = prev
                return true
            end 
        }))
    end
  end,
}
return {name = "Vouchers", items = {common_caste}}