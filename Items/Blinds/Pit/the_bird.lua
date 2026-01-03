local the_bird = {
    object_type = "Blind",
    key = 'the_bird',
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
    boss_colour = HEX("c7b28c"),
    atlas = 'blinds_pit',
    pos = { y = 11 },
    order = 512,
    dollars = 6,

    calculate = function(self, blind, context)
        local temp = G.GAME.blind and G.GAME.blind.disabled
        if temp then
            return
        end

        if context.before and G.jokers.cards and not temp then
            blind.triggered = false
            if #G.jokers.cards > 1 then 
                blind.triggered = true
                local joker = pseudorandom_element(G.jokers.cards, "tbjk")
                local old_index = 0
                for i = 1, #G.jokers.cards do
                    if joker == G.jokers.cards[i] then
                        old_index = i
                    end
                end
                local new_index = pseudorandom('bl_aij_the_bird', 1, #G.jokers.cards)
                while joker == G.jokers.cards[new_index] do
                    new_index = pseudorandom('bl_aij_the_bird', 1, #G.jokers.cards)
                end
                G.E_MANAGER:add_event(Event({
                    type = "after",
                    delay = 0.2,
                    func = function() 
                        blind:wiggle()
                        table.remove(G.jokers.cards, old_index)
                        table.insert(G.jokers.cards, new_index, joker)
                        play_sound('cardSlide1', 0.85)
                        return true
                    end
                }))
                delay(0.2)
            end
        end
    end
}
return { name = {"Pit Blinds"}, items = {the_bird} }
