local blood_artist = {
    object_type = "Joker",
    order = 86,

    key = "blood_artist",
    config = {
        extra = {
            blind_reduction = 25
        }
    },
    rarity = 2,
    pos = { x = 6, y = 3 },
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.blind_reduction,
            }
        }
    end,

    calculate = function(self, card, context)
        -- Removing non-playing cards and selling cards
        if (context.joker_type_destroyed or context.selling_card) and G.GAME.blind.in_blind then
            -- Have to do this mess of code to make banana man say "Again!" at the correct time
            return {
                extra = {
                    message = localize("k_aij_blood_spilt_ex")
                },
                func = function ()
                    All_in_Jest.ease_blind_requirement(nil, -1 * math.ceil(G.GAME.blind.chips * card.ability.extra.blind_reduction * 0.01))
                    -- Ends blind if blind requirement is now met
                    -- Copied from blind:disable()
                    G.E_MANAGER:add_event(Event({
                        trigger = 'immediate',
                        func = function()
                            if G.STATE ~= G.STATES.NEW_ROUND and G.GAME.chips - G.GAME.blind.chips >= to_big(0) and not next(SMODS.find_card("j_aij_electric_snow")) then
                                G.STATE = G.STATES.NEW_ROUND
                                G.STATE_COMPLETE = false
                            end
                            return true
                        end
                    }))
                end
            }
        end

        -- Removing playing cards
        if context.remove_playing_cards and G.GAME.blind.in_blind then
            local destroyed_count = #context.removed
            return {
                extra = {
                    message = localize("k_aij_blood_spilt_ex")
                },
                func = function ()
                    All_in_Jest.ease_blind_requirement(nil, -1 * math.ceil(G.GAME.blind.chips * card.ability.extra.blind_reduction * 0.01) * destroyed_count)
                    -- Ends blind if blind requirement is now met
                    -- Copied from blind:disable()
                    G.E_MANAGER:add_event(Event({
                        trigger = 'immediate',
                        func = function()
                            if G.STATE ~= G.STATES.NEW_ROUND and G.GAME.chips - G.GAME.blind.chips >= to_big(0) and not next(SMODS.find_card("j_aij_electric_snow")) then
                                G.STATE = G.STATES.NEW_ROUND
                                G.STATE_COMPLETE = false
                            end
                            return true
                        end
                    }))
                end
            }
        end

        -- return nil, true
    end
}

return { name = { "Jokers" }, items = { blood_artist } }
