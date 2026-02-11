local abandoned_joker = {
    object_type = "Joker",
    order = 566,
    key = "abandoned_joker",
    
    config = {
        extra = {
            
        }
    },
    rarity = 2,
    pos = { x = 4, y = 27 },
    atlas = 'joker_atlas',
    cost = 7,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = false,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                
            }
        }
    end,

    calculate = function(self, card, context)
        if context.after and G.GAME.current_round.hands_played == 0 and not context.blueprint then
            local face_cards = {}
            
            for i = 1, #context.full_hand do
                if context.full_hand[i]:is_face() then
                    table.insert(face_cards, context.full_hand[i])
                end
            end

            if #face_cards > 0 then
                SMODS.destroy_cards(face_cards)
                
                return {
                    message = localize('k_aij_destroyed_ex'),
                    colour = G.C.RED
                }
            end
        end
    end
}

return { name = { "Jokers" }, items = { abandoned_joker } }
