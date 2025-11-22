local aureate_coin = {
    object_type = "Blind",
    key = 'aureate_coin',
    boss = {
      min = 1,
      spent_money = 0,
      showdown = true,
    },
    in_pool = function(self)
        return true
    end,
    mult = 2,
    boss_colour = HEX("eba03a"),
    atlas = 'blinds',
    pos = { y = 30 },
    order = 1001,
    dollars = 8,
    config = {extra = {trigger = false}},

    set_blind = function(self)
        if math.abs(self.boss.spent_money) > 0 then
            All_in_Jest.ease_blind_requirement(math.abs(self.boss.spent_money) * 0.1, 0)
        end
    end,

    disable = function()
        G.GAME.blind.chips = G.GAME.blind.original_chips
        G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
    end,

    defeat = function(self)
        local temp = G.GAME.blind and G.GAME.blind.disabled
        if temp then
            return
        end
    end
}

return { name = {"Finisher Blinds"}, items = {aureate_coin} }