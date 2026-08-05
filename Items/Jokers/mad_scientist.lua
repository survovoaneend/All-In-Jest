local mad_scientist = {
    object_type = "Joker",
    order = 426,
    key = "mad_scientist",
    config = {
        extra = {
            
        }
    },
    attributes = { 'modify_card', 'enhancements', },
    rarity = 2,
    pos = { x = 17, y = 14 },
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
        if context.setting_ability and not context.unchanged and not context.blueprint and not context.other_card.mad_scientist_processing then
            local can_proceed = false
            local enhancements = get_current_pool("Enhanced")
            local valid_enhancements = {}
            for k, v in pairs(enhancements) do
                if (context.old == 'c_base' or context.old == v) then 
                    can_proceed = true
                end
                if v ~= context.new then
                    valid_enhancements[#valid_enhancements + 1] = v
                end
            end
            local other_enhancement = pseudorandom_element(valid_enhancements, pseudoseed('mad_scientist'))
            if can_proceed and other_enhancement then
                context.other_card.mad_scientist_processing = true
                play_sound('card1', 0.9 + 0.05, 0.5) 
                context.other_card:juice_up(0.2, 0.1)
                if G.GAME.selected_back.name == "b_aij_melded" then
                    context.other_card:set_ability(G.P_CENTERS[other_enhancement], nil, true)
                else
                    All_in_Jest.set_other_enhancement(context.other_card, other_enhancement)
                end
                local juice_card = card
                juice_card:juice_up(0.5, 0.2)
            elseif context.setting_ability and not context.unchanged and not context.blueprint and context.other_card.mad_scientist_processing then
                context.other_card.mad_scientist_processing = nil
            end
        end
    end
}
return { name = { "Jokers" }, items = { mad_scientist } }
