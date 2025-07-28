local the_child = {
    object_type = "Blind",
    key = 'the_child',
    boss = {
      min = 4,
      all_in_jest = {
          pit = true
      }
    },
    in_pool = function(self)
        if G.GAME.round_resets.ante == G.GAME.all_in_jest.pit_blind_ante or G.GAME.won then
            if G.GAME.stake >= 5 or G.GAME.won then
                return true
            end
        end
    end,
    mult = 2,
    boss_colour = HEX("c1b297"),
    atlas = 'blinds',
    pos = {X = 0, y = 2 },
    order = 503,
    dollars = 6,

    calculate = function(self, card, context)
        local temp = G.GAME.blind and G.GAME.blind.disabled
        if temp then
            return
        end

        if context.after and context.scoring_hand and not temp then
            G.E_MANAGER:add_event(Event({
                trigger = 'before',
                delay = 1.5,
                func = (function()
                    for k, v in pairs(context.scoring_hand) do
                        if v:get_id() ~= 2 then
                            v:juice_up(1, 0.5)
                            assert(SMODS.modify_rank(v, -1))
                        end
                    end
                    return true 
                end
            )}))
        end
    end
}
return { name = {"Pit Blinds"}, items = {the_child} }
