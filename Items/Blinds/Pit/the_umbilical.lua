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
        return All_in_Jest.pit_blinds_in_play()
    end,
    mult = 2,
    boss_colour = HEX("ae7a8a"),
    atlas = 'blinds',
    pos = { y = 9 },
    order = 510,
    dollars = 6,

    calculate = function(self, blind, context)
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
