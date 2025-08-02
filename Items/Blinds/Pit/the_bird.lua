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
        if G.GAME.round_resets.ante == G.GAME.all_in_jest.pit_blind_ante or G.GAME.won then
            if G.GAME.stake >= 5 or G.GAME.won then
                return true
            end
        end
    end,
    mult = 2,
    boss_colour = HEX("c7b28c"),
    atlas = 'blinds',
    pos = { y = 11 },
    order = 512,
    dollars = 6,

    calculate = function(self, card, context)
        local temp = G.GAME.blind and G.GAME.blind.disabled
        if temp then
            return
        end

        if context.before and G.jokers.cards and not temp then
            if #G.jokers.cards > 1 then 
                local joker = pseudorandom_element(G.jokers.cards, "tbjk")
                local old_index = 0
                for i = 1, #G.jokers.cards do
                    if joker == G.jokers.cards[i] then
                        old_index = i
                    end
                end
                local new_index = math.random(1, #G.jokers.cards)
                while joker == G.jokers.cards[new_index] do
                    new_index = math.random(1, #G.jokers.cards)
                end
                table.remove(G.jokers.cards, old_index)
                table.insert(G.jokers.cards, new_index, joker)
                play_sound('cardSlide1', 0.85)
            end
        end
    end
}
return { name = {"Pit Blinds"}, items = {the_bird} }
