local maguelonne = {
    object_type = "Joker",
    order = 594,
    key = "maguelonne",
  
    config = {
        extra = {
            xmult = 1, 
            xmult_gain = 0.25
        }
    },
    rarity = 3,
    pos = { x = 7, y = 28 },
    atlas = 'joker_atlas',
    cost = 8,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,


    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.xmult_gain, 
                card.ability.extra.xmult
            }
        }
    end,

    calculate = function(self, card, context)
         if context.end_of_round and context.main_eval and not context.blueprint then
            local face_cards = {}
            for _, v in ipairs(G.deck.cards) do
                if v:is_face() then
                    face_cards[#face_cards + 1] = v
                end
            end
            if #face_cards > 0 then
                local destroyed_card = pseudorandom_element(face_cards, 'maguelonne')
                card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.xmult_gain
                
                G.E_MANAGER:add_event(Event({
                    func = function()
                        destroyed_card:start_dissolve()
                        return true
                    end
                }))

                return {
                    message = localize{type='variable', key='a_xmult', vars={card.ability.extra.xmult}},
                    colour = G.C.MULT
                }
            end
        end
        if context.joker_main then
            return {
                xmult = card.ability.extra.xmult
            }
        end
    end
}


return { name = { "Jokers" }, items = { maguelonne } }