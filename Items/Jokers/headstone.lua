local headstone = {
    object_type = "Joker",
    order = 329,
    key = "headstone",
    config = {
    },
    rarity = 1,
    pos = { x = 0, y = 13},
    atlas = 'joker_atlas',
    cost = 4,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)

    end,
  
    calculate = function(self, card, context)
        
    end,
    in_pool = function(self, args)
        if G.GAME and G.playing_cards then
            for _, card in ipairs(G.playing_cards) do
                if card:is_face() then
                    return true
                end
            end
        end
        return false
    end,
  
}
return { name = {"Jokers"}, items = {headstone} }
