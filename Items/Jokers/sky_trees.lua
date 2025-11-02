local sky_trees = {
    object_type = "Joker",
    order = 318,
    key = "sky_trees",
    config = {
    },
    rarity = 2,
    pos = { x = 14, y = 12},
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = {set = 'Other', key = 'blue_seal'}
    end,
  
    calculate = function(self, card, context)
        
    end,
    in_pool = function(self, args)
        if G.GAME and G.playing_cards then
            for _, card in ipairs(G.playing_cards) do
                if card.seal and card.seal == 'Blue' then
                    return true
                end
            end
        end
        return false
    end,
}
return { name = {"Jokers"}, items = {sky_trees} }
