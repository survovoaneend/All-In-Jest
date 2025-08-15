local the_brilliance = {
    object_type = "Blind",
    key = 'the_brilliance',
    boss = {
      min = 4,
      score_met = false,
      all_in_jest = {
          pit = true
      }
    },
    in_pool = function(self)
        if G.GAME.round_resets.ante == G.GAME.all_in_jest.pit_blind_ante or G.GAME.won then
            if G.GAME.stake >= 5 or G.GAME.won or not All_in_Jest.config.blue_stake_rework then
                return true
            end
        end
    end,
    mult = 2,
    boss_colour = HEX("e8dd9d"),
    atlas = 'blinds',
    pos = { y = 13 },
    order = 514,
    dollars = 6,

    set_blind = function(self)
        ease_hands_played(2)
    end,

    disable = function(self)
        ease_hands_played(-2)
    end,

    defeat = function(self)
        local temp = G.GAME.blind and G.GAME.blind.disabled
        if temp then
            return
        end
        if not temp then
            ease_hands_played(-2)
        end
    end,

    calculate = function(self, card, context)
        local temp = G.GAME.blind and G.GAME.blind.disabled
        if temp then
            return
        end
        if context.all_in_jest and context.all_in_jest.before_after and not temp then
            if (context.total_chips + G.GAME.chips >= G.GAME.blind.chips) and not G.GAME.blind.config.blind.boss.score_met then 
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',delay = 0.4,
                    func = (function()  update_hand_text({delay = 0}, {mult = 0, chips = 0, chip_total = 0, level = '', handname = "Again!"});play_sound('button', 0.9, 0.6);return true end)
                }))
                G.GAME.all_in_jest.reset_score.blind_total = true
                G.GAME.blind.config.blind.boss.score_met = true
            end
        end
    end
}
return { name = {"Pit Blinds"}, items = {the_brilliance} }
