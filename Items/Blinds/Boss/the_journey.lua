local the_journey = {
    object_type = "Blind",
    key = 'the_journey',
    boss = {
        min = 3,
        selected_suit = '[X]',
    },
    mult = 2,
    boss_colour = HEX("fdd879"),
    atlas = 'blinds',
    pos = { X = 0, y = 56},
    order = 28,
    dollars = 5,
    config = {
        extra = {
            trigger = false,
        }
    },

    loc_vars = function(self)
        local ability = G.GAME.blind.ability
        if self.boss.selected_suit == '[X]' then
            self.boss.selected_suit = pseudorandom_element(All_in_Jest.get_suits('key'), pseudoseed('the_journey'))
        end
        return {
            vars = {ability and ability.selected_suit or self.boss.selected_suit}
        }
    end,

    collection_loc_vars = function(self)
        return {
            vars = {'[X]'}
        }
    end,

    calculate = function(self, card, context)
        local temp = G.GAME.blind and G.GAME.blind.disabled
        if temp then
            return
        end
        local ability = G.GAME.blind.ability
        if ability and context.individual and context.cardarea == G.play and not temp then
            if context.other_card:is_suit(self.boss.selected_suit) and not ability.trigger then
                G.E_MANAGER:add_event(Event({
                    func = function()
                        G.GAME.win_ante = G.GAME.win_ante + 1
                        return true
                    end
                }))
                ability.trigger = true
            end
        end
    end,
    defeat = function(self)
        self.boss.selected_suit = '[X]'
    end,
    in_pool = function(self)
        if G.GAME.round_resets.ante < (G.GAME.win_ante-1) and not G.GAME.won then
            return true
        end
    end,
}
return { name = {"Blinds"}, items = {the_journey} }