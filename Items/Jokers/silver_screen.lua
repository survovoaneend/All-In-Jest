local silver_screen = {
    object_type = "Joker",
    order = 98,

    key = "silver_screen",
    config = {
      
    },
    rarity = 2,
    pos = { x = 18, y = 3 },
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
  
    end,
  
    calculate = function(self, card, context)
        if context.remove_playing_cards then
            for k, v in pairs(context.removed) do
                if v:is_face() then
                    local hand_cards = {}
                    for i = 1, #G.hand.cards do
                        if G.hand.cards[i].edition == nil then
                            table.insert(hand_cards, G.hand.cards[i])
                        end
                    end
                    local playing_card = pseudorandom_element(hand_cards, pseudoseed('jest_silver_screen'))
                    local edition = {aij_silver = true}
                    card:juice_up(0.3, 0.5)
                    playing_card:set_edition(edition)
                end
            end
        end
    end
  
}
return { name = {"Jokers"}, items = {silver_screen} }
