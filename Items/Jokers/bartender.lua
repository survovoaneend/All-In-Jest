local bartender = {
    object_type = "Joker",
    order = 282,
    key = "bartender",
    config = {
      
    },
    attributes = { 'consumable', 'editions'},
    rarity = 1,
    pos = { x = 23, y = 10},
    atlas = 'joker_atlas',
    cost = 4,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
  
    loc_vars = function(self, info_queue, card)
  
    end,
  
    calculate = function(self, card, context)
        if context.ending_shop then
            local valid_consumables = {}

            for i = 1, #G.consumeables.cards do
                local c = G.consumeables.cards[i]
                if not c.edition then
                    valid_consumables[#valid_consumables + 1] = c
                end
            end

            if #valid_consumables > 0 then
                local target_consumable = pseudorandom_element(valid_consumables, pseudoseed('glimmer_target'))
                
                local editions = { { foil = true }, { holo = true }, { polychrome = true } }
                local chosen_edition = pseudorandom_element(editions, pseudoseed('glimmer_edition'))

                local juice_card = context.blueprint_card or card
                G.E_MANAGER:add_event(Event({
                    func = function()
                        juice_card:juice_up()
                        target_consumable:set_edition(chosen_edition, true)
                        return true
                    end
                }))

                return {
                    message = localize('k_aij_editioned_ex'),
                    colour = G.C.DARK_EDITION
                }
            end
        end
    end
  
}
return { name = {"Jokers"}, items = {bartender} }
