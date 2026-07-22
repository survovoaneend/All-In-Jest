local wood = {
    object_type = "Enhancement",
    key = 'wood',
    atlas = 'enhancements_atlas',
    order = 4,
    pos = { x = 4, y = 0 },
    config = {
        extra = {
            base_h_chips = 20,
            h_chips_mod = 5,
        }
    },
    all_in_jest = {
        multi_enhancement_z_order = -1
    },

    loc_vars = function(self, info_queue, card)
        local hand_chips = card.ability.extra.base_h_chips

        if G.hand and G.hand.cards then
            local wood_cards = {}
            for _, v in pairs(G.hand.cards) do
                if SMODS.has_enhancement(v, "m_aij_wood") then
                    wood_cards[#wood_cards+1] = v
                end
            end
            if #wood_cards > 1 then
                hand_chips = hand_chips + (card.ability.extra.h_chips_mod * (#wood_cards - 1))
            end
        end

        return { vars = {
            hand_chips,
            card.ability.extra.h_chips_mod,
            card.ability.extra.base_h_chips
        } }
    end,
    

    calculate = function(self, card, context)
        if context.cardarea == G.hand and context.main_scoring then
            local hand_chips = card.ability.extra.base_h_chips

            if G.hand and G.hand.cards then
                local wood_cards = {}
                for _, v in pairs(G.hand.cards) do
                    if SMODS.has_enhancement(v, "m_aij_wood") then
                        wood_cards[#wood_cards+1] = v
                    end
                end
                if #wood_cards > 1 then
                    hand_chips = hand_chips + (card.ability.extra.h_chips_mod * (#wood_cards - 1))
                end
            end

            return {
                chips = hand_chips
            }
        end
    end

}

function process_texture_wood(image)
    local width, height = image:getDimensions()
    local canvas = love.graphics.newCanvas(width, height, {type = '2d', readable = true, dpiscale = image:getDPIScale()})

    love.graphics.push("all")

    love.graphics.setCanvas( canvas )
    local wood_bg_colour = {57.3 / 255, 49.4 / 255, 36.1 / 255, 0}
    -- local wood_bg_colour = { 255 / 255, 255 / 255, 255 / 255, 0}
    -- local wood_bg_colour = { 21.6 / 255, 27.5 / 255, 28.6 / 255, 0}
    love.graphics.clear( wood_bg_colour )
    
    love.graphics.setColor(1, 1, 1, 1)

    love.graphics.setShader( G.SHADERS['aij_wood_spritesheet'] )
    
    -- Draw image with wood shader on new canvas
    love.graphics.draw( image )

    love.graphics.pop()

    image_data = canvas:newImageData()

    return love.graphics.newImage(image_data, {mipmaps = true, dpiscale = image:getDPIScale()}), image_data
end

function pre_wooded(a)
    local atlas = a.name or a.key
    local name = atlas.."_wooded"
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

function wood_atlas(a)
    local wooded = pre_wooded(a)

    if not wooded.atlas then
        local atlas_type = a.atlas_table or "ASSET_ATLAS"
        G[atlas_type][wooded.new_name] = {}
        SMODS.get_atlas(wooded.new_name).wood = true
        SMODS.get_atlas(wooded.new_name).name = SMODS.get_atlas(wooded.old_name).name .. "_wooded"
        SMODS.get_atlas(wooded.new_name).type = SMODS.get_atlas(wooded.old_name).type
        SMODS.get_atlas(wooded.new_name).px = SMODS.get_atlas(wooded.old_name).px
        SMODS.get_atlas(wooded.new_name).py = SMODS.get_atlas(wooded.old_name).py
        SMODS.get_atlas(wooded.new_name).frames = SMODS.get_atlas(wooded.old_name).frames

        image, image_data = process_texture_wood(SMODS.get_atlas(wooded.old_name).image)
        SMODS.get_atlas(wooded.new_name).image = image
        SMODS.get_atlas(wooded.new_name).image_data = image_data
    end

    return SMODS.get_atlas(wooded.new_name)
end


return {name = {"Enhancements"}, items = {wood}}