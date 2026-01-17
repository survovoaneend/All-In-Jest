local seal_of_the_realm = {
  object_type = "Voucher",
  key = 'seal_of_the_realm',
  config = {
    
  },
  requires = {
    'v_aij_wax_stamp'
  },
  atlas = 'vouchers_atlas',
  pos = { x = 1, y = 1 },
  discovered = false,
  order = 7,

  loc_vars = function(self, info_queue)
    
  end,

  calculate = function(self, card, context)
    if context.all_in_jest and context.all_in_jest.modify_booster_cards and not context.all_in_jest.before_added then
        if context.all_in_jest.card.ability.name:find('Standard') then
            for k, v in pairs(context.all_in_jest.pack_cards) do
                if v.seal then
                    local _edition = poll_edition('standard_seal_edition'..G.GAME.round_resets.ante, 4, true, nil, get_current_pool("seal_edition_pool")) --Made twice as common as it only triggers on cards with seals
                    if _edition then v:All_in_Jest_set_seal_edition(_edition) end 
                end
            end
        end
    end
  end,
}
return {name = "Vouchers", items = {seal_of_the_realm}}