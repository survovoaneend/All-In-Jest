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
        return All_in_Jest.pit_blinds_in_play()
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
            for i = 1, #G.GAME.all_in_jest.advanced_hand_usage_blind do
                if context.total_chips <= G.GAME.all_in_jest.advanced_hand_usage_blind[i].total_chips then
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
