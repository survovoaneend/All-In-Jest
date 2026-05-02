local scorched_shader = {
    object_type = "Shader",
    key = 'burnt', 
    path = 'burnt.fs',
    send_vars = function(sprite)
        local atlas = G.ASSET_ATLAS["aij_enhancements_atlas"]
        local overlayPos = {x = 8, y = 0}
        local maskPos = {x = 7, y = 0}
        local w, h = 71, 95 
        local texW, texH = atlas.image:getDimensions()
    
        return {
            enhancementsTex = atlas.image,
            overlayUV = { overlayPos.x * atlas.px / texW, overlayPos.y * atlas.py / texH, w / texW, h / texH },
            maskUV = { maskPos.x * atlas.px / texW, maskPos.y * atlas.py / texH, w / texW, h / texH },
        }
    end
} 
local scorched = {
    object_type = "Enhancement",
    key = 'scorched',
    atlas = 'enhancements_atlas',
    order = 7,
    pos = { x = 7, y = 0 },
    config = {
        extra = {
            odds = 3,
            levels = 1
        }
    },
    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds)
        return {
            vars = {
                numerator, denominator,
                card.ability.extra.levels
            }
        }
    end,
    calculate = function(self, card, context)
        if context.discard and context.other_card == card then
            if SMODS.pseudorandom_probability(card, 'scorched' .. G.SEED, 1, card.ability.extra.odds) then
                local text,disp_text = G.FUNCS.get_poker_hand_info(G.hand.highlighted)
                card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize('k_upgrade_ex')})
                level_up_hand(card, text, nil, card.ability.extra.levels)
            end
        end
    end
}
return {name = {"Enhancements"}, items = {scorched, scorched_shader}}