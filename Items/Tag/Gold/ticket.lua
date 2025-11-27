local ticket_tag = {
  object_type = "Tag",
  key = 'ticket',

  pos = { x = 10, y = 3 },
  atlas = 'tag_atlas',
  config = {
    aij = {
      upgrade = 'voucher',
    },
  },

  discovered = false,
  order = 8,
  min_ante = 3,

  loc_vars = function(self, info_queue, tag)
    return { vars = {} }
  end,

  apply = function(self, tag, context)
    if context.type == 'new_blind_choice' then
      tag:jest_apply('+', G.C.GOLD, function()
          local _pool, _ = get_current_pool('Voucher', nil, nil, nil)

          -- Check if there are any base vouchers that haven't already been redeemed
          local _bases = 0
          for i = 1, #_pool do
            if _pool[i] ~= 'UNAVAILABLE' and not G.P_CENTERS[_pool[i]].requires then
              _bases = _bases + 1
            end
          end
          if _bases > 0 then
            local _pool_key = 'Voucher_fromtag'
            local _voucher_key = pseudorandom_element(_pool, pseudoseed(_pool_key))
            local iv = 1
            while _voucher_key == 'UNAVAILABLE' or G.P_CENTERS[_voucher_key].requires do
              iv = iv + 1
              _voucher_key = pseudorandom_element(_pool, pseudoseed(_pool_key .. '_resample' .. iv))
            end

            local vouchers_to_create = { _voucher_key }
            for _, v in ipairs(G.P_CENTER_POOLS["Voucher"]) do
              if v.requires and type(v.requires) == "table" then
                for _, requirement in ipairs(v.requires) do
                  if requirement == _voucher_key then
                    table.insert(vouchers_to_create, v.key)
                    break
                  end
                end
              end
            end

            local cards_to_redeem = {}
            for _, key in ipairs(vouchers_to_create) do
              local voucher_card = create_card('Voucher', G.hand, nil, nil, nil, nil, key, 'ticket')
              G.hand:emplace(voucher_card)
              voucher_card.cost = 0
              table.insert(cards_to_redeem, voucher_card)
            end
            local prev_state = G.STATE
            delay(0.2)
            for _, voucher_card in ipairs(cards_to_redeem) do
              G.STATE = prev_state
              G.FUNCS.use_card({ config = { ref_table = voucher_card } })
              delay(0.6)
            end
          end
          G.E_MANAGER:add_event(Event({
            func = function()
              for i = 1, #G.GAME.tags do
                if G.GAME.tags[i]:apply_to_run({ type = 'new_blind_choice' }) then
                  break
                end
              end
              return true
            end
          }))
          return true
        end,
        function()
          return true
        end)
      tag.triggered = true
      return true
    end
  end,
}
return { name = "Tags", items = { ticket_tag } }
