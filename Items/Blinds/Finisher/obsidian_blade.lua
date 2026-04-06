local obsidian_blade = {
    object_type = "Blind",
    key = 'obsidian_blade',
    boss = {
      min = 1,
      showdown = true,
    },
    in_pool = function(self)
        return true
    end,
    mult = 3,
    lite = true,
    boss_colour = HEX("635d91"),
    atlas = 'blinds',
    pos = { y = 31 },
    order = 1002,
    dollars = 8,

    set_blind = function(self)
        G.hand:change_size(-1)
        ease_hands_played(-1)
        ease_discard(-1)
    end,

    disable = function(self)
        G.hand:change_size(1)
        ease_hands_played(1)
        ease_discard(1)
        G.GAME.blind.chips = G.GAME.blind.chips/2
        G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
    end,

    defeat = function(self)
        local temp = G.GAME.blind and G.GAME.blind.disabled
        if temp then
            return
        end
        if not temp then
            G.hand:change_size(1)
            ease_hands_played(1)
            ease_discard(1)
            G.GAME.blind.chips = G.GAME.blind.chips/2
            G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
        end
    end
}
return { name = {"Finisher Blinds"}, items = {obsidian_blade} }
