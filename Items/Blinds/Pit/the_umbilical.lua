local the_umbilical = {
    object_type = "Blind",
    key = 'the_umbilical',
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
    boss_colour = HEX("ae7a8a"),
    atlas = 'blinds',
    pos = { y = 9 },
    order = 510,
    dollars = 6,

    calculate = function(self, card, context)
        local temp = G.GAME.blind and G.GAME.blind.disabled
        if temp then
            return
        end
        if context.after and not temp then
            local cards = {}
            for k, v in pairs(G.hand.cards) do
                if not v.ability.aij_marked then
                    cards[k] = v
                end
            end
            local hand_card = pseudorandom_element(cards, pseudoseed('jest_the_umbilical'..G.GAME.round_resets.ante))
            if hand_card then
                G.E_MANAGER:add_event(Event({
                    func = function()
                        hand_card.ability.aij_marked = true
                        hand_card:juice_up()
                        return true
                    end
                })) 
            end
        end
    end,

    disable = function(self)
        for k, v in pairs(G.playing_cards) do
            if v.ability.aij_marked then
                v.ability.aij_marked = false
            end
        end
    end,

    defeat = function(self)
        for k, v in pairs(G.playing_cards) do
            if v.ability.aij_marked then
                v.ability.aij_marked = false
            end
        end
    end
}
return { name = {"Pit Blinds"}, items = {the_umbilical} }
