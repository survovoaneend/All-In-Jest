local lucina = {
    object_type = "Joker",
    order = 286,
    key = "lucina",
    config = {
      
    },
    rarity = 3,
    pos = { x = 9, y = 11},
    atlas = 'joker_atlas',
    cost = 8,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
  
    end,
  
    calculate = function(self, card, context)
        if context.setting_blind and not self.getting_sliced then
            local my_pos = nil
            for i = 1, #G.jokers.cards do
                if G.jokers.cards[i] == card then my_pos = i; break end
            end
            if my_pos and G.jokers.cards[my_pos-1] and not card.getting_sliced and not G.jokers.cards[my_pos-1].ability.eternal and not G.jokers.cards[my_pos-1].getting_sliced then 
                local sliced_card = G.jokers.cards[my_pos-1]
                sliced_card.getting_sliced = true
                G.GAME.joker_buffer = G.GAME.joker_buffer - 1
                G.E_MANAGER:add_event(Event({func = function()
                    G.GAME.joker_buffer = 0
                    if G.jokers.cards[my_pos+1] then
                        local edition = poll_edition('lucina', nil, false, true)
                        local right_card = G.jokers.cards[my_pos+1]
                        right_card:set_edition(edition, true)
                    end
                    card:juice_up(0.8, 0.8)
                    sliced_card:start_dissolve({HEX("57ecab")}, nil, 1.6)
                    play_sound('slice1', 0.96+math.random()*0.08)
                return true end }))
                return nil, true
            end
        end
    end
  
}
return { name = {"Jokers"}, items = {lucina} }
