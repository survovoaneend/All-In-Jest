local pedrolino = {
    object_type = "Joker",
    order = 99,

    key = "pedrolino",
    config = {
        extra = { blind_reduction = 90 }
    },
    rarity = 2,
    pos = { x = 19, y = 3 },
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = false,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.blind_reduction,
            }
        }
    end,

    calculate = function(self, card, context)
        if context.selling_self and not context.blueprint and G.GAME.blind.in_blind then
           
            local final_chips = G.GAME.blind.chips -
            math.ceil(G.GAME.blind.chips * card.ability.extra.blind_reduction * 0.01)
            if final_chips == math.abs(final_chips) then
                final_chips = math.min(final_chips, G.GAME.blind.chips - 1)
            else
                final_chips = 1
            end
            local chip_mod -- iterate over ~120 ticks
            if type(G.GAME.blind.chips) ~= 'table' then
                chip_mod = math.ceil((G.GAME.blind.chips - final_chips) / 120)
            else
                chip_mod = (( G.GAME.blind.chips - final_chips) / 120):ceil()
            end
            local step = 0
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                blocking = true,
                func = function()
                    G.GAME.blind.chips = G.GAME.blind.chips - G.SETTINGS.GAMESPEED * chip_mod
                    if G.GAME.blind.chips > final_chips then
                        G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
                        if step % 5 == 0 then
                            play_sound('chips1', 0.8 + (step * 0.005))
                        end
                        step = step - 1
                    else
                        G.GAME.blind.chips = final_chips
                        G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
                        G.GAME.blind:wiggle()
                        return true
                    end
                end
            }))
        end
    end

}
return { name = { "Jokers" }, items = { pedrolino } }
