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
            local hand_cards = {}
            for i = 1, #G.hand.cards do
                if G.hand.cards[i].edition == nil then
                    local to_be_destroyed = false
                    for k, v in pairs(context.removed) do
                        if G.hand.cards[i] == v then
                            to_be_destroyed = true
                        end
                    end
                    if not to_be_destroyed then
                        table.insert(hand_cards, G.hand.cards[i])
                    end
                end
            end
            
            local enhanced = 0
            for k, v in pairs(context.removed) do
                if v:is_face() then
                    enhanced = enhanced + 1

                    local playing_card, chosen_index = pseudorandom_element(hand_cards, pseudoseed('jest_silver_screen'))
                    table.remove(hand_cards, chosen_index) -- Should prevent one card being enhanced multiple times
                    local edition = {aij_silver = true}
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            card:juice_up(0.3, 0.5)
                            playing_card:set_edition(edition, true)
                            return true
                        end
                    }))
                end
            end
            if enhanced > 0 then
                return {
                    message = localize("aij_silver", "labels") .. "!",
                    colour = G.C.GREY
                }
            end
        end
    end
  
}
return { name = {"Jokers"}, items = {silver_screen} }
