
SMODS.Shader {
    key = 'chaotic',
    path = 'chaotic.fs',
 }

-- Treat internally as a sticker, like Pinned cards
local chaotic_card = {
    object_type = "Sticker",
    key = "jest_chaotic_card",
	  no_collection = true,
    badge_colour = HEX('fda200'),
    pos = { x = 10, y = 10 }, -- No art
    rate = 0,
	  order = 1,
  
    loc_vars = function(self, info_queue, card)
        return {vars={1.5}}
    end,

    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play then
            return {
                xmult = 1.5
            }
        end
        if card.ability.aij_jest_chaotic_card and (card.config.center.set == "Enhanced" or card.config.center.set == "Default") and context.after and context.scoring_hand then
            local in_hand = false
            for _, scored_card in ipairs(context.scoring_hand) do
                if scored_card == card then
                    in_hand = true
                    break
                end
            end
            if in_hand then
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.1,
                    func = function()
                        local enhance = SMODS.poll_enhancement({guaranteed = true, key = 'jest_chaotic_card'})
                        play_sound('tarot2')
                    
                        card:juice_up(0.3, 0.3)
                        card:set_ability(G.P_CENTERS[enhance])
                        return true
                    end
                }))
                return {
                    message = localize("k_aij_chaos_ex")
                }
            end
        end
    end
}
return {name = {"Stickers"}, items = {chaotic_card}}