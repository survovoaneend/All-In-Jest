local aureate_coin = {
    object_type = "Blind",
    key = 'aureate_coin',
    boss = {
      min = 1,
      spent_money = 0,
      showdown = true,
    },
    in_pool = function(self)
        return true
    end,
    mult = 2,
    boss_colour = HEX("eba03a"),
    atlas = 'blinds',
    pos = { y = 30 },
    order = 1001,
    dollars = 8,
    config = {extra = {trigger = false}},

    calculate = function(self, card, context)
        local temp = G.GAME.blind and G.GAME.blind.disabled
        if temp then
            return
        end
        local ability = G.GAME.blind and G.GAME.blind.ability
        if not temp and math.abs(self.boss.spent_money) > 0 and ability and not ability.trigger then
            self.boss.orginal_score = G.GAME.blind.chips
            local final_chips = G.GAME.blind.chips + math.ceil(G.GAME.blind.chips * math.abs(self.boss.spent_money) * 0.01)
            local chip_mod -- iterate over ~120 ticks
            if type(G.GAME.blind.chips) ~= 'table' then
                chip_mod = math.ceil((G.GAME.blind.chips + final_chips) / 120)
            else
                chip_mod = (( G.GAME.blind.chips + final_chips) / 120):ceil()
            end
            local step = 0
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                blocking = true,
                func = function()
                    G.GAME.blind.chips = G.GAME.blind.chips + G.SETTINGS.GAMESPEED * chip_mod
                    if G.GAME.blind.chips < final_chips then
                        G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
                        if step % 5 == 0 then
                            play_sound('chips1', 0.8 + (step * 0.005))
                        end
                        step = step + 1
                    else
                        G.GAME.blind.chips = final_chips
                        G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
                        return true
                    end
                end
            }))
            ability.trigger = true
        end
    end,

    disable = function(self)
        if G.GAME.blind.chips ~= self.boss.orginal_score and math.abs(self.boss.spent_money) > 0 then
            local final_chips = self.boss.orginal_score or G.GAME.blind.chips
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
                        return true
                    end
                end
            }))
        end
    end,

    defeat = function(self)
        local temp = G.GAME.blind and G.GAME.blind.disabled
        if temp then
            return
        end
        if not temp and math.abs(self.boss.spent_money) > 0 then
            if G.GAME.blind.chips ~= self.boss.orginal_score then
                local final_chips = self.boss.orginal_score or G.GAME.blind.chips
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
                            return true
                        end
                    end
                }))
            end
        end
    end
}

return { name = {"Finisher Blinds"}, items = {aureate_coin} }