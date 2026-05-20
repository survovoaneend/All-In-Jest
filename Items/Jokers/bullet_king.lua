local bullet_king = {
    object_type = "Joker",
    order = 568,
    key = "bullet_king",
    config = {
        extra = {
            
        }
    },
    rarity = 2,
    pos = { x = 6, y = 27 },
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                
            }
        }
    end,

    calculate = function(self, card, context)
        
    end
}
function All_in_Jest.bullet_king_end_of_round(context, cards, bullet_king)
    for _, card in ipairs(cards) do
        card.bullet_king = bullet_king
        local reps = {1}
        local j = 1
        while j <= #reps do
            percent = (1-0.999)/(#context.cardarea.cards-0.998) + (j-1)*0.1
            if reps[j] ~= 1 then
                local _, eff = next(reps[j])
                SMODS.calculate_effect(eff, eff.card)
                percent = percent + 0.08
            end
            
            context.playing_card_end_of_round = true
            --calculate the hand effects
            local effects = {eval_card(card, context)}
            SMODS.calculate_quantum_enhancements(card, effects, context)
    
            context.playing_card_end_of_round = nil
            context.individual = true
            context.other_card = card
            -- context.end_of_round individual calculations
            
            SMODS.calculate_card_areas('jokers', context, effects, { main_scoring = true })
            SMODS.calculate_card_areas('individual', context, effects, { main_scoring = true })
            local flags = SMODS.trigger_effects(effects, card)

            context.individual = nil
            context.repetition = true
            context.card_effects = effects
            if reps[j] == 1 then
                SMODS.calculate_repetitions(card, context, reps)
            end
    
            context.repetition = nil
            context.card_effects = nil
            context.other_card = nil
            j = j + (flags.calculated and 1 or #reps)
        end
    end
end

local bullet_king_trigger_effects = SMODS.calculate_effect
SMODS.calculate_effect = function(effect, scored_card, from_edition, pre_jokers)
    if scored_card and scored_card.bullet_king then
        local bullet_king = scored_card.bullet_king
        scored_card.bullet_king = nil
        if #effect > 0 then 
            SMODS.calculate_effect({message = localize('k_aij_bullet_king_ex'), colour = G.C.SECONDARY_SET.Enhanced, juice_card = bullet_king, message_card = scored_card}, scored_card) 
        end
    end
    return bullet_king_trigger_effects(effect, scored_card, from_edition, pre_jokers)
end
return { name = { "Jokers" }, items = { bullet_king } }
