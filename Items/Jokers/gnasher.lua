local gnasher = {
    object_type = "Joker",
    order = 166,

    key = "gnasher",
    config = {
        extra = {
            trigger = true,
        }
    },
    rarity = 2,
    pos = { x = 10, y = 6 },
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,

    all_in_jest = {
        can_use_ability = function(self, card, context)
            local viable_options = {}
            for k, v in pairs(G.consumeables.cards) do
                if G.consumeables.cards[k]:can_use_consumeable() then
                    viable_options[#viable_options + 1] = k
                end
            end
            if card.ability.extra.trigger and #viable_options > 0 then
                return true
            end
        end,

        use_ability = function(self, card)
            local viable_options = {}
            for k, v in pairs(G.consumeables.cards) do
                if G.consumeables.cards[k]:can_use_consumeable() then
                    viable_options[k] = k
                end
            end
            local used_consumeable = copy_card(G.consumeables.cards
                [pseudorandom_element(viable_options, pseudoseed('gnasher_consumeable'))])
            local prev_state = G.STATE
            G.STATE = G.STATES.PLAY_TAROT
            G.CONTROLLER.locks.use = true
            if G.booster_pack and not G.booster_pack.alignment.offset.py then
                G.booster_pack.alignment.offset.py = G.booster_pack.alignment.offset.y
                G.booster_pack.alignment.offset.y = G.ROOM.T.y + 29
            end
            if G.shop and not G.shop.alignment.offset.py then
                G.shop.alignment.offset.py = G.shop.alignment.offset.y
                G.shop.alignment.offset.y = G.ROOM.T.y + 29
            end
            if G.blind_select and not G.blind_select.alignment.offset.py then
                G.blind_select.alignment.offset.py = G.blind_select.alignment.offset.y
                G.blind_select.alignment.offset.y = G.ROOM.T.y + 39
            end
            if G.round_eval and not G.round_eval.alignment.offset.py then
                G.round_eval.alignment.offset.py = G.round_eval.alignment.offset.y
                G.round_eval.alignment.offset.y = G.ROOM.T.y + 29
            end
            G.E_MANAGER:add_event(Event({
                trigger = 'before',
                delay = 0.4,
                func = function()
                    draw_card(G.hand, G.play, 1, 'up', true, used_consumeable, nil, true)
                    card:juice_up()
                    used_consumeable:use_consumeable(used_consumeable.area)

                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        delay = 0.7,
                        func = function()
                            used_consumeable:start_dissolve()
                            card:juice_up()
                            G.STATE = prev_state
                            G.CONTROLLER.locks.use = false
                            if G.shop then
                                G.shop.alignment.offset.y = G.shop.alignment.offset.py
                                G.shop.alignment.offset.py = nil
                            end
                            if G.blind_select then
                                G.blind_select.alignment.offset.y = G.blind_select.alignment.offset.py
                                G.blind_select.alignment.offset.py = nil
                            end
                            if G.round_eval then
                                G.round_eval.alignment.offset.y = G.round_eval.alignment.offset.py
                                G.round_eval.alignment.offset.py = nil
                            end
                            if G.booster_pack then
                                if G.booster_pack.alignment.offset.py then
                                    G.booster_pack.alignment.offset.y = G.booster_pack.alignment.offset.py
                                    G.booster_pack.alignment.offset.py = nil
                                end
                            end
                            return true
                        end
                    }))
                    return true
                end
            }))


            card.ability.extra.trigger = false
        end,
    },

    loc_vars = function(self, info_queue, card)
        local active_text = ""
        if not card.ability.extra.trigger then
            active_text = "(" .. localize('k_inactive') .. ")"
        else
            active_text = "(" .. localize('k_active') .. ")"
        end
        return {
            vars = {
                active_text,
                colours = {
                    G.C.SECONDARY_SET.Enhanced
                }
            }
        }
    end,

    calculate = function(self, card, context)
        if context.ante_change and context.ante_change ~= 0 and context.ante_end then
            card.ability.extra.trigger = true
        end
    end
}
return { name = { "Jokers" }, items = { gnasher } }
