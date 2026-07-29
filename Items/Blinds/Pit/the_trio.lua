local the_trio = {
    object_type = "Blind",
    key = 'the_trio',
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
    boss_colour = HEX("d3b994"),
    ignore = true,
    atlas = 'blinds_pit',
    pos = {y = 23},
    order = 524,
    dollars = 6,
    config = {},

    disable = function(self)
        for k, v in pairs(G.playing_cards) do
            SMODS.debuff_card(v, false, 'the_trio')
        end
    end,

    defeat = function(self)
        for k, v in pairs(G.playing_cards) do
            SMODS.debuff_card(v, false, 'the_trio')
        end
        G.GAME.the_trio_has_been_played = nil
    end,

    calculate = function(self, blind, context)
        local temp = G.GAME.blind and G.GAME.blind.disabled
        if temp then
            return
        end
        if (context.pre_discard or (context.before and not G.GAME.the_trio_has_been_played)) and not temp then
            G.GAME.the_trio_has_been_played = nil
            local contains_three = false
            for k, v in pairs(G.hand.cards) do
                local compare_id = v:get_id()
                G.GAME.the_trio_has_been_played = G.GAME.the_trio_has_been_played or {}
                G.GAME.the_trio_has_been_played[compare_id] = G.GAME.the_trio_has_been_played[compare_id] or 0
                G.GAME.the_trio_has_been_played[compare_id] = G.GAME.the_trio_has_been_played[compare_id] + 1
            end
            for k, v in pairs(G.GAME.the_trio_has_been_played) do
                if v == 3 then
                    contains_three = true
                end
            end
            if contains_three then
                local cards = {}
                for k, v in pairs(G.hand.cards) do
                    if not v.debuff then
                        local discarding = false
                        for _k, _v in pairs(context.full_hand) do
                            if v == _v then
                                discarding = true
                            end
                        end
                        if not discarding then
                            cards[k] = v
                        end
                    end
                end
                local val = 3
                while #cards ~= 0 and val > 0 do
                    local index = pseudorandom_element(cards, pseudoseed('jest_the_trio'))
                    if index then
                        val = val - 1
                        SMODS.debuff_card(index, true, 'the_trio')
                        for k, v in pairs(cards) do
                            if v.debuff then
                                cards[k] = nil
                            end
                        end
                    end
                end
            end
        end
        if context.after then
            G.GAME.the_trio_has_been_played = nil
        end
    end
}
return { name = {"Pit Blinds"}, items = {the_trio} }
