local pellucid_joker = {
    object_type = "Joker",
    order = 142,

    key = "pellucid_joker",
    config = {
      
    },
    rarity = 2,
    pos = { x = 11, y = 5 },
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
  
    end,
  
    calculate = function(self, card, context)
        if context.jest_destroying_or_selling_joker and context.jest_destroyed_joker.edition ~= nil then
            local juice_card = context.blueprint_card or card
            G.E_MANAGER:add_event(Event({
                func = function()
                    juice_card:juice_up()
                    local new_card = create_playing_card({
                        front = pseudorandom_element(G.P_CARDS, pseudoseed('pellucid_joker')),
                        center = G.P_CENTERS.c_base}, juice_card, true, nil, {G.C.SECONDARY_SET.Enhanced}, true)
                    new_card:set_edition(context.jest_destroyed_joker.edition)
                    new_card:start_materialize()
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        delay = 0.3,
                        func = function()
                            G.deck:emplace(new_card)
                            G.deck.config.card_limit = G.deck.config.card_limit + 1
                            return true
                        end})
                    )
                    playing_card_joker_effects({new_card})
                    return true
                end})
            )
            return nil, true
        end
    end
  
}

return { name = {"Jokers"}, items = {pellucid_joker} }
