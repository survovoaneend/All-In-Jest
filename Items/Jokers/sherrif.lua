local sherrif = {
    object_type = "Joker",
    order = 337,
    
    key = "sherrif",
    config = {
        extra = {
            dollars = 5
        }
    },
    rarity = 2,
    pos = { x = 8, y = 13},
    atlas = 'joker_atlas',
    cost = 7,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    enhancement_gate = 'm_wild',
  
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = G.P_CENTERS.m_wild
        return { vars = { card.ability.extra.dollars } }
    end,
  
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and SMODS.has_enhancement(context.other_card, "m_wild") then
            local is_first_wild = false
            for i = 1, #context.scoring_hand do
                if SMODS.has_enhancement(context.scoring_hand[i], "m_wild") then
                    is_first_wild = context.scoring_hand[i] == context.other_card
                    break
                end
            end
            if is_first_wild then
                return {
                    dollars = card.ability.extra.dollars
                }
            end
        end
    end
  
}
return { name = {"Jokers"}, items = {sherrif} }
