local spiral_gestalt = {
    object_type = "Joker",
    order = 998,
    ignore = true,
    
    key = "spiral_gestalt",
    config = {
        extra = {
            active = false
        }
    },
    attributes = { "prevents_death" },
    rarity = 2,
    pos = { x = 4, y = 47},
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = false,
    perishable_compat = true,

    loc_vars = function(self, info_queue, card)
        return { }
    end,

    calculate = function(self, card, context)
        if context.ante_change and context.ante_change ~= 0 and context.ante_end then
            card.ability.extra.active = true
            save_run()
            table.remove(G.ARGS.save_run.cardAreas.jokers.cards, card.rank) -- Makes this joker removed in new save
            if G.FILE_HANDLER.run then
                G.SAVE_MANAGER.channel:push({
                    type = 'save_run_aij_spiral_gestalt',
                    save_table = G.ARGS.save_run,
                    profile_num = G.SETTINGS.profile})
            end
            return {
                message = localize('k_saved_ex'),
            }
        end
        if (context.game_over or context.selling_self) and card.ability.extra.active and not context.blueprint then
            G.E_MANAGER:add_event(Event({
                func = function()
                    G.hand_text_area.blind_chips:juice_up()
                    G.hand_text_area.game_chips:juice_up()
                    play_sound('tarot1')
                    card:start_dissolve()
                    G.SAVED_GAME = get_compressed(G.SETTINGS.profile..'/'..'save_aij_spiral_gestalt.jkr')
                    if G.SAVED_GAME ~= nil then 
                        G.SAVED_GAME = STR_UNPACK(G.SAVED_GAME) 
                        G.SAVED_GAME.aij_spiral_gestal_save = true
                    end
                    G.FUNCS.start_run(nil, {savetext = G.SAVED_GAME})
                    return true
                end
            })) 
            return {
                message = localize('k_saved_ex'),
                saved = true,
                colour = G.C.RED
            }
        end
    end
}

return { name = {"Jokers"}, items = {spiral_gestalt} }