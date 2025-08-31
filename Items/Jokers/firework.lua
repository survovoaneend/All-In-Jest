local firework = {
    object_type = "Joker",
    order = 367,
   
    key = "firework",
    config = {
        extra = {
            xmult = 3
        }
    },
    rarity = 2,
    pos = { x = 0, y = 20},
    atlas = 'joker_atlas',
    cost = 7,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    enhancement_gate = "m_mult",
  
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.m_mult
        return { vars = { card.ability.extra.xmult } }
    end,
  
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and SMODS.has_enhancement(context.other_card, "m_mult") then
            local is_first_mult = false
            for i = 1, #context.scoring_hand do
                if SMODS.has_enhancement(context.scoring_hand[i], "m_mult") then
                    is_first_mult = context.scoring_hand[i] == context.other_card
                    break
                end
            end
            if is_first_mult then
                return {
                    xmult = card.ability.extra.xmult
                }
            end
        end
    end
  
}
return { name = {"Jokers"}, items = {firework} }
