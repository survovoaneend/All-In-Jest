local the_conflagration = {
    object_type = "Blind",
    key = 'the_conflagration',
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
    boss_colour = HEX("bc8866"),
    atlas = 'blinds',
    pos = { y = 8 },
    order = 509,
    dollars = 6,

    calculate = function(self, card, context)
        local temp = G.GAME.blind and G.GAME.blind.disabled
        if temp then
            return
        end
        if context.all_in_jest and context.all_in_jest.before_after and not temp then
            if (context.total_chips + G.GAME.chips >= (G.GAME.blind.chips)) then
                local total_cards = {}
                for i = 1, #context.full_hand do
                    if not context.full_hand[i].destroyed then
                        table.insert(total_cards, context.full_hand[i])
                        G.E_MANAGER:add_event(Event({
                            trigger = 'before',
                            func = function()
                                context.full_hand[i]:start_dissolve()
                                return true
                            end
                        })) 
                        context.full_hand[i].destroyed = true
                    end
                end
                for i = 1, #G.hand.cards do
                    if not G.hand.cards[i].destroyed then
                        table.insert(total_cards, G.hand.cards[i])
                        G.E_MANAGER:add_event(Event({
                            trigger = 'before',
                            func = function()
                                G.hand.cards[i]:start_dissolve()
                                return true
                            end
                        })) 
                        G.hand.cards[i].destroyed = true
                    end
                end
                SMODS.calculate_context({remove_playing_cards = true, removed = total_cards})
            end
        end
    end
}
return { name = {"Pit Blinds"}, items = {the_conflagration} }
