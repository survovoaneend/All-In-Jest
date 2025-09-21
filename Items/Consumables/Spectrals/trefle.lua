local trefle_spectral = {
    object_type = "Consumable",
    key = 'trefle',
    set = 'Spectral',
    pos = { x = 1, y = 4 },
    cost = 4,
    unlocked = true,
    discovered = false,
    order = 0.5,
    config = {},
    atlas = 'consumable_atlas',
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = { set = 'Other', key = 'reroll_joker' }
    end,
    can_use = function(self, card)
       
        if G.jokers.highlighted and (#G.jokers.highlighted == 1) and G.jokers.highlighted[1] and not G.jokers.highlighted[1].ability["eternal"] then
            local target = G.jokers.highlighted[1]
            if target.ability.set == 'Joker' and not target.ability.eternal and target.area == G.jokers then
                return true
            end
        end
        return false
    end,

    
    use = function(self, card, area, copier)
      
        All_in_Jest.reroll_joker(G.jokers.highlighted[1], nil, 'trefle')

        return true 
    end
}
return { name = { "Spectrals" }, items = { trefle_spectral } }
