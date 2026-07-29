local wenge_wand = {
    object_type = "Blind",
    key = 'wenge_wand',
    boss = {
      min = 1,
      showdown = true,
    },
    in_pool = function(self)
        return true
    end,
    mult = 2,
    boss_colour = HEX("645452"),
    atlas = 'blinds_final',
    pos = { y = 3},
    ignore = true,
    order = 1004,
    dollars = 8,
    -- Doesn't do anything yet
    loc_vars = function(self, info_queue, card)
        local num, odds = SMODS.get_probability_vars(self, 1, 2)
        return {vars = {num, odds}}
    end,
    collection_loc_vars = function(self, blind)
        local num, odds = SMODS.get_probability_vars(blind, 1, 2)
        return {vars = {num, odds}}
    end,

    set_blind = function(self)
        G.GAME.wenge_wand_is_active = true
    end,

    disable = function(self)
        G.GAME.wenge_wand_is_active = nil
    end,

    defeat = function(self)
        G.GAME.wenge_wand_is_active = nil
    end
}
return { name = {"Finisher Blinds"}, items = {wenge_wand} }
