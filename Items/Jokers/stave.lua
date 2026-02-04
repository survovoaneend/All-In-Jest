local stave = {
    object_type = "Joker",
    order = 254,
    
    key = "stave",
    config = {
      
    },
    rarity = 3,
    pos = { x = 1, y = 10},
    atlas = 'joker_atlas',
    cost = 10,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
  
    end,
  
    calculate = function(self, card, context)
        if context.selling_card and context.card.ability.set == 'Joker' and context.card.edition and not context.blueprint then
            
            local targets = {}
            for i = 1, #G.jokers.cards do
                local j = G.jokers.cards[i]
                if j ~= context.card and not j.edition then
                    table.insert(targets, j)
                end
            end

            if #targets > 0 then
                local target_joker = pseudorandom_element(targets, pseudoseed('stave'))
                
                G.E_MANAGER:add_event(Event({
                    func = function()
                        target_joker:set_edition(context.card.edition, true)
                        target_joker:juice_up(0.5, 0.5)
                        return true
                    end
                }))

                return {
                    message = localize('k_aij_editioned_ex'),
                    colour = G.C.DARK_EDITION,
                    card = card
                }
            end
        end
    end
  
}
return { name = {"Jokers"}, items = {stave} }
