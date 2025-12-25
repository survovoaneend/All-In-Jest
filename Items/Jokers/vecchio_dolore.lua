local vecchio_dolore = {
    object_type = "Joker",
    order = 366,
    key = "vecchio_dolore",
    config = {

    },
    rarity = 3,
    pos = { x = 24, y = 19},
    atlas = 'joker_atlas',
    cost = 8,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)

    end,
  
    calculate = function(self, card, context)
        if context.all_in_jest and context.all_in_jest.before_reroll_shop then
            for k, v in pairs(G.shop_jokers.cards) do
                G.E_MANAGER:add_event(Event({
                    trigger = 'before',
                    delay = 0.2,
                    func = function()
                        if v.config.center.set == "Joker" then
                            local temp_card = create_card('Joker', G.jokers, nil, nil, nil, nil, v.config.center.key, 'vecchio_dolore')
                            temp_card:set_edition({ negative = true })
                            temp_card:start_materialize()
                            G.jokers:emplace(temp_card)
                        elseif v.config.center.consumeable then
                            local temp_card = create_card('Consumeables', G.consumeables, nil, nil, nil, nil, v.config.center.key, 'vecchio_dolore')
                            temp_card:set_edition({ negative = true })
                            temp_card:add_to_deck()
                            G.consumeables:emplace(temp_card)
                        end
                        return true
                    end
                }))
            end
            SMODS.destroy_cards(card)
        end
    end
  
}
return { name = {"Jokers"}, items = {vecchio_dolore} }
