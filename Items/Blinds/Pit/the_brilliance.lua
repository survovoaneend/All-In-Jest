local the_brilliance = {
    object_type = "Blind",
    key = 'the_brilliance',
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
    boss_colour = HEX("e8dd9d"),
    atlas = 'blinds',
    pos = { y = 13 },
    order = 514,
    dollars = 6,
    config = {extra = {score_met = false,}},

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

    calculate = function(self, blind, context)
        local temp = G.GAME.blind and G.GAME.blind.disabled
        if temp then
            return
        end
        if context.all_in_jest and context.all_in_jest.before_after and not temp then
            if G.GAME.blind.ability and (context.total_chips + G.GAME.chips >= G.GAME.blind.chips) and not G.GAME.blind.ability.extra.score_met then 
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',delay = 0.4,
                    func = (function()  update_hand_text({delay = 0}, {mult = 0, chips = 0, chip_total = 0, level = '', handname = "Again!"});play_sound('button', 0.9, 0.6);return true end)
                }))
                G.GAME.all_in_jest.reset_score.blind_total = true
                G.GAME.blind.ability.extra.score_met = true
            end
        end
    end
}
return { name = {"Pit Blinds"}, items = {the_brilliance} }
