local the_arrow = {
    object_type = "Blind",
    key = 'the_arrow',
    boss = {
      min = 4,
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
    boss_colour = HEX("967465"),
    atlas = 'blinds',
    pos = { y = 12 },
    order = 513,
    dollars = 6,

    calculate = function(self, blind, context)
        local temp = G.GAME.blind and G.GAME.blind.disabled
        if temp then
            return
        end
        if context.all_in_jest and context.all_in_jest.before_after and not temp then
            local bool = false
            for i = 1, #G.all_in_jest.advanced_hand_usage do
                if context.total_chips <= G.all_in_jest.advanced_hand_usage[i].total_chips then
                    bool = true
                end
            end
            if bool then 
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',delay = 0.4,
                    func = (function()  update_hand_text({delay = 0}, {mult = 0, chips = 0, chip_total = 0, level = '', handname = "Not Allowed!"});play_sound('button', 0.9, 0.6);return true end)
                }))
                G.GAME.all_in_jest.reset_score.chip_total = true
            end
        end
    end
}
return { name = {"Pit Blinds"}, items = {the_arrow} }
