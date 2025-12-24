local four_leaf_clover = {
    object_type = "Joker",
    order = 267,
    key = "four_leaf_clover",
    config = {
      
    },
    rarity = 2,
    pos = { x = 14, y = 10},
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = true, 
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
        local fours = 0
        if G.playing_cards then
            for k, v in pairs(G.playing_cards) do
                if v:get_id() == 4 then
                    fours = fours + 1
                end
            end
        end
        return {
            vars = {
                fours,
            }
        }
    end,
  
    calculate = function(self, card, context)
        if context.starting_shop or context.reroll_shop then
            G.E_MANAGER:add_event(Event ({
                trigger = 'before',
                func = function()
                    local index = 0
                    local fours = 0
                    if G.playing_cards then
                        for k, v in pairs(G.playing_cards) do
                            if v:get_id() == 4 then
                                fours = fours + 1
                            end
                        end
                    end
                    for k, v in pairs(G.shop_jokers.cards) do
                        if v.config.center.set == "Joker" then
                            local force_rarity = v.config.center.rarity or 1
                            if (G.GAME.jest_legendary_pool.in_shop and force_rarity <= 3 and force_rarity >= 1) or (force_rarity <= 2 and force_rarity >= 1) then 
                                force_rarity = force_rarity + 1
                            end
                            local mult = force_rarity == 4 and 0.5 or 1
                            if SMODS.pseudorandom_probability(card, 'four_leaf_clover'..index, fours*mult, 100, nil, true) then
                                if force_rarity ~= (v.config.center.rarity or 1) then
                                    All_in_Jest.reroll_joker(v, nil, 'four_leaf_clover'..index, nil, nil, {forced_rarity = force_rarity})
                                    card_eval_status_text(v, 'extra', nil, nil, nil, {
                                        message = localize('k_upgrade_ex'),
                                    })
                                    index = index + 1
                                end
                            end
                        end
                    end
                    return true
                end 
            }))
        end
    end
  
}
return { name = {"Jokers"}, items = {four_leaf_clover} }
