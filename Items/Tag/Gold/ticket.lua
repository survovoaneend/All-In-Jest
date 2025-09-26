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
        return {vars = {}}
    end,

    apply = function(self, tag, context)
        if context.type == 'immediate' then
            local _pool, _pool_key = get_current_pool('Voucher', nil, nil, nil)
            _pool_key = 'Voucher_fromtag'
            _voucher = pseudorandom_element(_pool, pseudoseed(_pool_key))

            local upgrade_index = 0
            local _bases = 0
            for i = 1, #_pool do
                if _pool[i] ~= 'UNAVAILABLE' and not G.P_CENTERS[_pool[i]].requires then
                    _bases = _bases + 1
                end
            end

            if _bases == 0 then
                tag:nope()
            end
        
            local iv = 1
            while _voucher == 'UNAVAILABLE' or G.P_CENTERS[_voucher].requires do
                iv = iv + 1
                _voucher = pseudorandom_element(_pool, pseudoseed(_pool_key..'_resample'..iv))
            end
            for i = 1, #_pool do
                if _pool[i] ~= 'UNAVAILABLE' and _pool[i] == _voucher then
                    upgrade_index = i + 1
                end
            end

            tag:yep('+', G.C.GOLD,function() 
                G.E_MANAGER:add_event(Event({
                    delay = 0,
                    func = function()
                        voucher_card = create_card('Voucher',G.play, nil, nil, nil, nil, _voucher, 'ticket')
                        G.hand.states.visible = false
                        G.GAME.aij_show_hand = true
                        voucher_card.cost = 0
                        voucher_card:redeem()
                        G.E_MANAGER:add_event(Event({
                            trigger = 'after',
                            delay = 0.8,
                            func = function()
                                voucher_card:start_dissolve()
                                return true 
                            end 
                            }))
                        G.E_MANAGER:add_event(Event({
                            trigger = 'after',
                            delay = 0.5,
                            func = function()
                                _pool, _pool_key = get_current_pool('Voucher', nil, nil, nil)
                                _upgrade_voucher = _pool[upgrade_index]
                                if _pool[upgrade_index] ~= 'UNAVAILABLE' then
                                    upgrade_voucher_card = create_card('Voucher',G.play, nil, nil, nil, nil, _upgrade_voucher, 'ticket')
                                    upgrade_voucher_card.cost = 0
                                    upgrade_voucher_card:redeem()
                                    G.E_MANAGER:add_event(Event({
                                        trigger = 'after',
                                        delay = 0.8,
                                        func = function()
                                            upgrade_voucher_card:start_dissolve()
                                            return true 
                                        end 
                                    }))
                                end
                                return true 
                            end 
                            }))
                        return true 
                    end 
                    }))
                return true
            end)
            tag.triggered = true
            return true
        end
    end,
}
return {name = "Tags", items = {ticket_tag}}