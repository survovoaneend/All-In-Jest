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
        return All_in_Jest.pit_blinds_in_play()
    end,
    mult = 2,
    boss_colour = HEX("bc8866"),
    atlas = 'blinds_pit',
    pos = { y = 8 },
    order = 509,
    dollars = 6,

    calculate = function(self, blind, context)
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
                    end
                end
                for i = 1, #G.hand.cards do
                    if not G.hand.cards[i].destroyed then
                        table.insert(total_cards, G.hand.cards[i])
                    end
                end
                SMODS.destroy_cards(total_cards)
            end
        end
    end
}
return { name = {"Pit Blinds"}, items = {the_conflagration} }
