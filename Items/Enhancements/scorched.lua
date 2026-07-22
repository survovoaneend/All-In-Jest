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
    local enhancements_atlas = SMODS.get_atlas("aij_enhancements_atlas")
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

    image_data = canvas:newImageData()

    return love.graphics.newImage(image_data, {mipmaps = true, dpiscale = image:getDPIScale()}), image_data
end

function pre_scorcheded(a)
    local atlas = a.name or a.key
    local name = atlas.."_scorcheded"
    if SMODS.get_atlas(name) then
        return {
            old_name = atlas,
            new_name = name,
            atlas = SMODS.get_atlas(name),
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
        local atlas_type = a.atlas_table or "ASSET_ATLAS"
        G[atlas_type][scorcheded.new_name] = {}
        SMODS.get_atlas(scorcheded.new_name).scorched = true
        SMODS.get_atlas(scorcheded.new_name).name = SMODS.get_atlas(scorcheded.old_name).name .. "_scorcheded"
        SMODS.get_atlas(scorcheded.new_name).type = SMODS.get_atlas(scorcheded.old_name).type
        SMODS.get_atlas(scorcheded.new_name).px = SMODS.get_atlas(scorcheded.old_name).px
        SMODS.get_atlas(scorcheded.new_name).py = SMODS.get_atlas(scorcheded.old_name).py
        SMODS.get_atlas(scorcheded.new_name).frames = SMODS.get_atlas(scorcheded.old_name).frames

        image, image_data = process_texture_scorched(SMODS.get_atlas(scorcheded.old_name).image)
        SMODS.get_atlas(scorcheded.new_name).image = image
        SMODS.get_atlas(scorcheded.new_name).image_data = image_data
    end

    return SMODS.get_atlas(scorcheded.new_name)
end

return {name = {"Enhancements"}, items = {scorched}}