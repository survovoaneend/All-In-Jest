local rubber_duck = {
    object_type = "Blind",
    key = 'rubber_duck',
    boss = {
      min = 1,
      showdown = true,
    },
    in_pool = function(self)
        return true
    end,
    mult = 2,
    boss_colour = HEX("e6c56f"),
    atlas = 'blinds_final',
    pos = { y = 6},
    order = 1007,
    dollars = 8,

    set_blind = function(self)
        G.GAME.aij_rubber_duck_hand_stats = {}
        for k, v in pairs(G.GAME.hands) do
            G.GAME.aij_rubber_duck_hand_stats[k] = SMODS.shallow_copy(v)
            v.mult = v.s_mult
            v.chips = v.s_chips
            v.level = 1
        end
    end,

    disable = function(self)
        local newer_stats = {}
        for k, v in pairs(G.GAME.hands) do
            newer_stats[k] = SMODS.shallow_copy(v)
            newer_stats[k].mult = newer_stats[k].mult - v.s_mult
            newer_stats[k].chips = newer_stats[k].chips - v.s_chips
            newer_stats[k].level = newer_stats[k].level - 1
        end
        for k, v in pairs(G.GAME.aij_rubber_duck_hand_stats) do
            G.GAME.hands[k] = v 
        end
        for k, v in pairs(newer_stats) do
            G.GAME.hands[k].mult = G.GAME.hands[k].mult + newer_stats[k].mult
            G.GAME.hands[k].chips = G.GAME.hands[k].chips + newer_stats[k].chips
            G.GAME.hands[k].level = G.GAME.hands[k].level + newer_stats[k].level
        end
        G.GAME.aij_rubber_duck_hand_stats = nil
    end,

    defeat = function(self)
        local temp = G.GAME.blind and G.GAME.blind.disabled
        if temp then
            return
        end
        local newer_stats = {}
        for k, v in pairs(G.GAME.hands) do
            newer_stats[k] = SMODS.shallow_copy(v)
            newer_stats[k].mult = newer_stats[k].mult - v.s_mult
            newer_stats[k].chips = newer_stats[k].chips - v.s_chips
            newer_stats[k].level = newer_stats[k].level - 1
        end
        for k, v in pairs(G.GAME.aij_rubber_duck_hand_stats) do
            G.GAME.hands[k] = v 
        end
        for k, v in pairs(newer_stats) do
            G.GAME.hands[k].mult = G.GAME.hands[k].mult + newer_stats[k].mult
            G.GAME.hands[k].chips = G.GAME.hands[k].chips + newer_stats[k].chips
            G.GAME.hands[k].level = G.GAME.hands[k].level + newer_stats[k].level
        end
        G.GAME.aij_rubber_duck_hand_stats = nil
    end
}
return { name = {"Finisher Blinds"}, items = {rubber_duck} }
