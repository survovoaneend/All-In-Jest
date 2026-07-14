local madcap = {
    object_type = "Back",
    key = 'madcap',
    atlas = 'deck_atlas',
    order = 6,
    pos = { x = 1, y = 1 },
    unlocked = false,
    ignore = true,
    unlock_condition = { hidden = true },
    config = {
        
    },
    loc_vars = function(self)
        return { vars = { self.config.joker_slot } }
    end,
    locked_loc_vars = function(self, info_queue, card)
        if not self.unlocked then
            return { key = "b_aij_madcap_hidden" }
        end
    end,
    check_for_unlock = function(self, args)
        -- Currently none
        return true
    end,
    apply = function(self, back)
        G.GAME.all_in_jest.weird_enhancements = true
    end,
    calculate = function(self, card, context)
        if context.open_booster then
            if context.card.config.center.kind == "Standard" and G.GAME.jest_change_booster_options.pack_choices ~= "unlimited" then
                G.GAME.jest_change_booster_options.option = "size"
                G.GAME.jest_change_booster_options.trigger = true
                G.GAME.jest_change_booster_options.op.add = 2
                G.E_MANAGER:add_event(Event({
                    func = function()
                        G.GAME.jest_change_booster_options.option = ""
                        G.GAME.jest_change_booster_options.trigger = false
                        G.GAME.jest_change_booster_options.op.add = 0
                        return true
                    end
                }))
            end
        end
        if context.open_booster and context.card.ability.name then
            if (context.open_booster and context.card.config.center.kind == 'Standard') then
                G.E_MANAGER:add_event(Event({
                    func = function()
                        if G.pack_cards and G.pack_cards.cards and G.pack_cards.cards[1] and G.pack_cards.VT.y < G.ROOM.T.h then
                            local i = 1
                            for _, v in ipairs(G.pack_cards.cards) do
                                if v.config.center == G.P_CENTERS.c_base then
                                    local enhance = SMODS.poll_enhancement({guaranteed = true, key = 'madcap'..i})
                                    v:set_ability(G.P_CENTERS[enhance], nil, true)
                                end
                                i = i + 1
                            end
                            return true
                        end
                    end
                }))
            end
        end
    end,
}
return { name = { "Decks" }, items = { madcap } }
