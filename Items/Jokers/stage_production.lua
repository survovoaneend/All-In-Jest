local stage_production = {
    object_type = "Joker",
    order = 369,
    key = "stage_production",
    config = {
        extra = {
            trigger = true,
        }
    },
    rarity = 2,
    pos = { x = 9, y = 14},
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,

    all_in_jest = {
        can_use_ability = function(self, card)
            local viable_options = {}
            for k, v in pairs(G.jokers.cards) do
                if v == card and G.jokers.cards[k+1] and G.jokers.cards[k+1].ability and (not G.jokers.cards[k+1].ability.all_in_jest or (G.jokers.cards[k+1].ability.all_in_jest and not G.jokers.cards[k+1].ability.all_in_jest.has_been_rerolled)) then
                    viable_options[#viable_options+1] = k+1
                end
            end
            if card.ability.extra.trigger and #viable_options > 0 then
                return true
            end
        end,

        use_ability = function(self, card)
            local right_card = nil
            for k, v in pairs(G.jokers.cards) do
                if v == card and G.jokers.cards[k+1] and G.jokers.cards[k+1].ability and (not G.jokers.cards[k+1].ability.all_in_jest or (G.jokers.cards[k+1].ability.all_in_jest and not G.jokers.cards[k+1].ability.all_in_jest.has_been_rerolled)) then
                    right_card = G.jokers.cards[k+1]
                end
            end
            
            if right_card then
                All_in_Jest.reroll_joker(right_card, nil, 'stage_production', right_card.config.center.key)
                card.ability.extra.trigger = false
            end
        end,
    },
  
    loc_vars = function(self, info_queue, card) 
        info_queue[#info_queue + 1] = { set = 'Other', key = 'reroll_joker' }
        local active_text = ""
        if not card.ability.extra.trigger then 
            active_text = "("..localize('k_inactive')..")"
        else
            active_text = "("..localize('k_active')..")"
        end
        return {
            vars = {
                active_text,
                colours = { 
                    G.C.SECONDARY_SET.Enhanced
                }
            }
        }
    end,

    calculate = function(self, card, context)
        if context.setting_blind and not context.blueprint then
            card.ability.extra.trigger = true
        end
    end
}
return { name = {"Jokers"}, items = {stage_production} }
