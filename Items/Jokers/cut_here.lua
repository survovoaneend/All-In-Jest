local cut_here = {
    object_type = "Joker",
    order = 361,
    key = "cut_here",
    config = {

    },
    rarity = 2,
    pos = { x = 4, y = 14},
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = false,
  
    loc_vars = function(self, info_queue, card)

    end,
  
    calculate = function(self, card, context)
        if context.joker_type_destroyed then
            local this_card = context.blueprint_card or card
            if context.card == this_card then
                local temp_card = create_card('Joker', G.jokers, nil, 1, nil, nil, nil, 'cut_here')
                temp_card:start_materialize()
                G.jokers:emplace(temp_card)
                return nil, true
            end
        end
    end
}

return { name = {"Jokers"}, items = {cut_here} }
