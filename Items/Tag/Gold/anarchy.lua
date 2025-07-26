local anarchy_tag = {
    object_type = "Tag",
    key = 'anarchy',

    pos = { x = 11, y = 3 },
    atlas = 'tag_atlas',
    config = {
        aij = {
            upgrade = 'aij_chaos',
        },
        effects = {
            "money",
            "boss_reroll",
            "open_booster",
            "create_jokers",
            "create_neg_joker",
            "create_consumables",
            "apply_edition", 
            "dupe_joker",
            "voucher",
            "minus_ante",
            "plus_hand",
            "plus_discard",
            "plus_ran_enhance",
            "give_ran_enhance",
            "ran_tag",
            "ran_gold_tag",
        }
    },

    discovered = false,
    order = 26,
    min_ante = 3,

    loc_vars = function(self, info_queue, tag)
        return {vars = {}}
    end,

    apply = function(self, tag, context)
        local effect_index = math.random(1, #self.config.effects) 
        local effect = self.config.effects[effect_index]
        if context.type == 'new_blind_choice' then
            tag:jest_apply("+", G.C.ATTENTION, function()
                if effect == "money" then
                    local money = math.random(1,150)
                    ease_dollars(money)
                elseif effect == "boss_reroll" then
                    local bosses = {}
                    local showdown_bosses = {}
                    for k, v in pairs(G.P_BLINDS) do
                        if v and v.boss and v.boss.showdown then
                            table.insert(showdown_bosses, v)
                        end
                    end
                    for k, v in pairs(G.P_BLINDS) do
                        if v and v.boss then
                            table.insert(bosses, v)
                            if not v.boss.showdown then
                                local ran = math.random(1, #showdown_bosses)
                                table.insert(bosses, showdown_bosses[ran])
                            end
                        end
                    end
                    local _blind = pseudorandom_element(bosses, pseudoseed('jest_anarchy_tag'))
                    local par = G.blind_select_opts.boss.parent
                    G.GAME.round_resets.blind_choices.Boss = _blind.key

                    G.blind_select_opts.boss:remove()
                    G.blind_select_opts.boss = UIBox {
                        T = {par.T.x, 0, 0, 0},
                        definition = {
                            n = G.UIT.ROOT,
                            config = {
                                align = "cm",
                                colour = G.C.CLEAR
                            },
                            nodes = {UIBox_dyn_container({create_UIBox_blind_choice('Boss')}, false,
                                get_blind_main_colour('Boss'), mix_colours(G.C.BLACK, get_blind_main_colour('Boss'), 0.8))}
                        },
                        config = {
                            align = "bmi",
                            offset = {
                                x = 0,
                                y = G.ROOM.T.y + 9
                            },
                            major = par,
                            xy_bond = 'Weak'
                        }
                    }
                    par.config.object = G.blind_select_opts.boss
                    par.config.object:recalculate()
                    G.blind_select_opts.boss.parent = par
                    G.blind_select_opts.boss.alignment.offset.y = 0

                    for i = 1, #G.GAME.tags do
                        if G.GAME.tags[i]:apply_to_run({
                            type = 'new_blind_choice'
                        }) then
                            break
                        end
                    end
                elseif effect == "open_booster" then
                    local boosters = {}
                    for k, v in pairs(G.P_CENTERS) do
                        if v.set == 'Booster' then 
                            table.insert(boosters, k)
                        end
                    end
                    local key = boosters[math.random(1, #boosters)]
                    local card = Card(G.play.T.x + G.play.T.w/2 - G.CARD_W*1.27/2,
                    G.play.T.y + G.play.T.h/2-G.CARD_H*1.27/2, G.CARD_W*1.27, G.CARD_H*1.27, G.P_CARDS.empty, G.P_CENTERS[key], {bypass_discovery_center = true, bypass_discovery_ui = true})
                    card.ability.choose = math.random(1, 4)
                    card.ability.extra = math.random(1, 7)
                    if card.ability.choose > card.ability.extra then
                        card.ability.choose = card.ability.extra
                    end
                    card.cost = 0
                    card.from_tag = true
                    G.FUNCS.use_card({config = {ref_table = card}})
                    card:start_materialize()
                elseif effect == "create_jokers" then
                    local jokers_to_create = math.min(math.random(1, 4), G.jokers.config.card_limit - (#G.jokers.cards + G.GAME.joker_buffer))
                    G.GAME.joker_buffer = G.GAME.joker_buffer + jokers_to_create
                    G.E_MANAGER:add_event(Event({
                        func = function() 
                            for i = 1, jokers_to_create do
                                local card = create_card('Joker', G.jokers, nil, nil, nil, nil, nil, 'jest_anarchy_tag')
                                card:add_to_deck()
                                G.jokers:emplace(card)
                                card:start_materialize()
                                G.GAME.joker_buffer = 0
                            end
                            return true
                        end})) 
                elseif effect == "create_neg_joker" then
                    local jokers_to_create = 1
                    G.E_MANAGER:add_event(Event({
                        func = function() 
                            local edition = {negative = true}
                            for i = 1, jokers_to_create do
                                local card = create_card('Joker', G.jokers, nil, nil, nil, nil, nil, 'jest_anarchy_tag')
                                card:add_to_deck()
                                G.jokers:emplace(card)
                                card:set_edition(edition)
                                card:start_materialize()
                                G.GAME.joker_buffer = 0
                            end
                            return true
                        end})) 
                elseif effect == "create_consumables" then
                    local consumeables_to_create = math.random(3, 4)
                    local c_edition = {negative = true}
                    for i = 1, consumeables_to_create do
                        local card_to_create = create_consumable("Consumeables", nil, nil, {edition = c_edition})
                    end
                elseif effect == "dupe_joker" then
                    local joker = pseudorandom_element(G.jokers.cards, pseudoseed('jest_anarchy_tag'))
                    local edition = {negative = true}
                    G.E_MANAGER:add_event(Event({trigger = 'before', delay = 0.4, func = function()
                        local card = copy_card(joker)
                        card:start_materialize()
                        card:set_edition(edition)
                        card:add_to_deck()
                        G.jokers:emplace(card)
                        return true end }))
                elseif effect == "apply_edition" then
                    local jokers = {}
                    for i = 1, #G.jokers.cards do
                        if G.jokers.cards[i].edition == nil then
                            table.insert(jokers, G.jokers.cards[i])
                        end
                    end
                    for i = 1, #jokers do
                        local edition = poll_edition('jest_anarchy_tag'..G.GAME.round_resets.ante, 2, false, true)
                        jokers[i]:set_edition(edition)
                    end
                elseif effect == "voucher" then
                    local _pool, _pool_key = get_current_pool('Voucher', nil, nil, nil)
                    _pool_key = 'Voucher_fromtag'
                    _voucher = pseudorandom_element(_pool, pseudoseed(_pool_key))

                    local iv = 1
                    while _voucher == 'UNAVAILABLE' do
                        iv = iv + 1
                        _voucher = pseudorandom_element(_pool, pseudoseed(_pool_key..'_resample'..iv))
                    end
                    voucher_card = create_card('Voucher',G.play, nil, nil, nil, nil, _voucher, 'ticket')
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
                elseif effect == "minus_ante" then
                    ease_ante(-1)
                    G.GAME.round_resets.blind_ante = G.GAME.round_resets.blind_ante or G.GAME.round_resets.ante
                    G.GAME.round_resets.blind_ante = G.GAME.round_resets.blind_ante-1
                elseif effect == "plus_hand" then
                    G.GAME.round_resets.hands = G.GAME.round_resets.hands + 1
                    ease_hands_played(1)
                elseif effect == "plus_discard" then
                    G.GAME.round_resets.discards = G.GAME.round_resets.discards + 1
                    ease_discard(1)
                elseif effect == "plus_ran_enhance" then
                    local ran_amt = math.random(2, 4)
                    local temp_card = create_card("Base", G.play, nil, nil, true, nil, nil, 'nonsta')
                    for i = 1, ran_amt do
                        local new_code = pseudorandom_element(SMODS.Suits, pseudoseed('jest_anarchy_tag'..G.GAME.round_resets.ante)).card_key
                        local new_val = pseudorandom_element(SMODS.Ranks, pseudoseed('jest_anarchy_tag'..G.GAME.round_resets.ante)).card_key
                        local new_card = G.P_CARDS[new_code..'_'..new_val]
                        G.playing_card = (G.playing_card and G.playing_card + 1) or 1
                        local cur_card = copy_card(temp_card)

                        cur_card:set_base(new_card)
                        local cen_pool = {}
                        for k, v in pairs(G.P_CENTER_POOLS["Enhanced"]) do
                            if v.key ~= 'm_stone' then 
                                cen_pool[#cen_pool+1] = v
                            end
                        end
                        local enhance = pseudorandom_element(cen_pool, pseudoseed('jest_anarchy_tag'..G.GAME.round_resets.ante)).key
                        cur_card:set_ability(G.P_CENTERS[enhance])
                        cur_card:add_to_deck()
                        G.deck:emplace(cur_card)
                        table.insert(G.playing_cards, cur_card)
                        G.deck.config.card_limit = G.deck.config.card_limit + 1
                        cur_card:start_materialize()
                    end
                    temp_card:start_dissolve()
                elseif effect == "give_ran_enhance" then
                    local cur_ran = math.random(3, 8)
                    local cen_pool = {}
                    for k, v in pairs(G.P_CENTER_POOLS["Enhanced"]) do
                        if v.key ~= 'm_stone' then 
                            cen_pool[#cen_pool+1] = v
                        end
                    end
                    for i = 1, cur_ran do
                        local deck_cards = {}
                        local enhance = pseudorandom_element(cen_pool, pseudoseed('jest_anarchy_tag'..G.GAME.round_resets.ante)).key
                        for i = 1, #G.deck.cards do
                            table.insert(deck_cards, G.deck.cards[i])
                        end
                        local playing_card = pseudorandom_element(deck_cards, pseudoseed('jest_anarchy_tag'))
                        playing_card:set_ability(G.P_CENTERS[enhance])
                    end
                elseif effect == "ran_tag" then
                    local num_ran = math.random(1, 5)
                    G.E_MANAGER:add_event(Event({
                        func = (function()
                            for i = 1, num_ran do
                                local _temp_pool, _pool_key = get_current_pool('Tag', nil, nil, nil)
                                _pool = {}
                                for i = 1, #_temp_pool do
                                     _pool[i] = _temp_pool[i]
                                end
                                local t = 1
                                _tag = pseudorandom_element(_pool, pseudoseed(_pool_key..'_jest_anarchy_tag'))
                                while _tag == 'UNAVAILABLE' do
                                    _tag = pseudorandom_element(_pool, pseudoseed(_pool_key..'_jest_anarchy_tag_resample'..t))
                                    t = t + 1
                                end
                                add_tag(Tag(_tag))
                            end
                            return true
                        end)
                    }))
                elseif effect == "ran_gold_tag" then
                    local num_ran = math.random(1, 2)
                    G.E_MANAGER:add_event(Event({
                        func = (function()
                            for i = 1, num_ran do
                                local _temp_gold_pool, _gold_pool_key = get_current_pool('Jest Golden Tag', nil, nil, '_gold')
                                _gold_pool = {}
                                for i = 1, #_temp_gold_pool do
                                     _gold_pool[i] = _temp_gold_pool[i]
                                end
                                local gt = 1
                                _tag = pseudorandom_element(_gold_pool, pseudoseed(_gold_pool_key..'_jest_anarchy_tag_gold'))
                                while _tag == 'UNAVAILABLE' do
                                    _tag = pseudorandom_element(_gold_pool, pseudoseed(_gold_pool_key..'_jest_anarchy_tag_gold_resample'..gt))
                                    gt = gt + 1
                                end
                                add_tag(Tag(_tag))
                            end
                            return true
                        end)
                    }))
                end
                return true
			end,
            function() 
                if effect == "create_jokers" then
                    return #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit
                end
                if effect == "apply_edition" then
                    if #G.jokers.cards > 0 then
                        for i = 1, #G.jokers.cards do
                            if G.jokers.cards[i].edition == nil then
                                return true
                            end
                        end
                    end
                    return false
                end
                if effect == "dupe_joker" then
                    return #G.jokers.cards > 0
                end
                if effect == "ran_gold_tag" then
                    local _temp_gold_pool, _gold_pool_key = get_current_pool('Jest Golden Tag', nil, nil, '_gold')
                    _gold_pool = {}
                    for i = 1, #_temp_gold_pool do
                            _gold_pool[i] = _temp_gold_pool[i]
                    end
                    if #_gold_pool > 0 and _gold_pool[1] ~= 'tag_handy' then
                        return true
                    end
                    return false
                end
                return true
            end)
            if tag.HUD_tag.states.visible == false then
                tag.triggered = true
            end
            return true
        end
    end,
}
return {name = "Tags", items = {anarchy_tag}}