local scorched_shader = {
    object_type = "Shader",
    key = 'burnt', 
    path = 'burnt.fs',
    send_vars = function(sprite)
        local atlas = G.ASSET_ATLAS["aij_enhancements_atlas"]
        local pos = {x = 8, y = 0}
        local postwo = {x = 7, y = 0}
        local w, h = 71, 95 
        local texW, texH = atlas.image:getDimensions()
    
        return {
            maskTex = atlas.image,
            maskUV = { pos.x * atlas.px / texW, pos.y * atlas.py / texH, w / texW, h / texH },
            otherUV = { postwo.x * atlas.px / texW, postwo.y * atlas.py / texH, w / texW, h / texH },
        }
    end
} 
local scorched = {
    object_type = "Enhancement",
    key = 'scorched',
    -- atlas = 'centers',
    order = 7,
    pos = { x = 1, y = 0 },
    config = {
        extra = {
            odds = 3,
            levels = 1
        }
    },
    all_in_jest = {
        multi_enhancement_z_order = 2
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

function process_texture_scorched(image)
    local enhancements_atlas = G.ASSET_ATLAS["aij_enhancements_atlas"]
    local pos = {x = 8, y = 0}
    local postwo = {x = 7, y = 0}
    local w, h = 71, 95 
    local texW, texH = enhancements_atlas.image:getDimensions()

    local width, height = image:getDimensions()
    local canvas = love.graphics.newCanvas(width, height, {type = '2d', readable = true, dpiscale = image:getDPIScale()})

    love.graphics.push("all")

    love.graphics.setCanvas( canvas )
    love.graphics.clear({1, 1, 1, 0})
    
    love.graphics.setColor(1, 1, 1, 1)

    G.SHADERS['aij_burnt_spritesheet']:send("enhancement_image_dims", {texW, texH})
    G.SHADERS['aij_burnt_spritesheet']:send("old_image_dims", {image:getDimensions()})
    G.SHADERS['aij_burnt_spritesheet']:send('maskTex', enhancements_atlas.image)
    G.SHADERS['aij_burnt_spritesheet']:send('maskUV', { pos.x * enhancements_atlas.px / texW, pos.y * enhancements_atlas.py / texH, w / texW, h / texH })
    G.SHADERS['aij_burnt_spritesheet']:send('otherUV', { postwo.x * enhancements_atlas.px / texW, postwo.y * enhancements_atlas.py / texH, w / texW, h / texH })
    love.graphics.setShader( G.SHADERS['aij_burnt_spritesheet'] )
    
    -- Draw image with scorched shader on new canvas
    love.graphics.draw( image )

    love.graphics.pop()

    return love.graphics.newImage(canvas:newImageData(), {mipmaps = true, dpiscale = image:getDPIScale()})
end

function pre_scorcheded(a)
    local atlas = a.name or a.key
    local name = atlas.."_scorcheded"
    if G.ASSET_ATLAS[name] then
        return {
            old_name = atlas,
            new_name = name,
            atlas = G.ASSET_ATLAS[name],
        }
    else
        return {
            old_name = atlas,
            new_name = name,
            atlas = nil
        }
    end
end

function scorched_atlas(a)
    local scorcheded = pre_scorcheded(a)

    if not scorcheded.atlas then
        G.ASSET_ATLAS[scorcheded.new_name] = {}
        G.ASSET_ATLAS[scorcheded.new_name].scorched = true
        G.ASSET_ATLAS[scorcheded.new_name].name = G.ASSET_ATLAS[scorcheded.old_name].name .. "_scorcheded"
        G.ASSET_ATLAS[scorcheded.new_name].type = G.ASSET_ATLAS[scorcheded.old_name].type
        G.ASSET_ATLAS[scorcheded.new_name].px = G.ASSET_ATLAS[scorcheded.old_name].px
        G.ASSET_ATLAS[scorcheded.new_name].py = G.ASSET_ATLAS[scorcheded.old_name].py
        G.ASSET_ATLAS[scorcheded.new_name].image = process_texture_scorched(G.ASSET_ATLAS[scorcheded.old_name].image)
    end

    return G.ASSET_ATLAS[scorcheded.new_name]
end

return {name = {"Enhancements"}, items = {scorched, scorched_shader}}