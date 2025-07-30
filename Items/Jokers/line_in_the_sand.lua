local line_in_the_sand = {
    object_type = "Joker",
    order = 81,
    
    key = "line_in_the_sand",
    config = {
      
    },
    rarity = 2,
    pos = { x = 1, y = 3 },
    atlas = 'joker_atlas',
    cost = 8,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
  
    end,

    remove_from_deck = function(self, card, from_debuff)
        local discard_count = #G.jest_super_discard.cards
        for i=1, discard_count do 
            draw_card(G.jest_super_discard, G.discard, i*100/discard_count,'up', nil ,nil, 0.005, i%2==0, nil, math.max((21-i)/20,0.7))
        end
    end,
}
return { name = {"Jokers"}, items = {line_in_the_sand} }
