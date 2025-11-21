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
        return All_in_Jest.pit_blinds_in_play()
    end,
    mult = 2,
    boss_colour = HEX("c1b297"),
    atlas = 'blinds',
    pos = { y = 2 },
    order = 503,
    dollars = 6,

    calculate = function(self, blind, context)
        local temp = G.GAME.blind and G.GAME.blind.disabled
        if temp then
            return
        end

        if context.after and context.scoring_hand and not temp then
            for i=1, #context.scoring_hand do
                local percent = 1.15 - (i-0.999)/(#context.scoring_hand-0.998)*0.3
                G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.15,func = function() context.scoring_hand[i]:flip();play_sound('card1', percent);context.scoring_hand[i]:juice_up(0.3, 0.3);return true end }))
            end
            G.E_MANAGER:add_event(Event({
                trigger = 'before',
                delay = 1.5,
                func = (function()
                    local index = 1
                    for k, v in pairs(context.scoring_hand) do
                        local percent = 0.85 + (index-0.999)/(#context.scoring_hand-0.998)*0.3
                        if v:get_id() ~= 2 then
                            assert(SMODS.modify_rank(v, -1))
                        end
                        v:flip()
                        play_sound('tarot2', percent, 0.6)
                        v:juice_up(0.3, 0.3)
                    end
                    return true 
                end
            )}))
        end
    end
}
return { name = {"Pit Blinds"}, items = {the_child} }
