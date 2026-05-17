local wood_shader = {
    object_type = "Shader",
    key = 'wood', 
    path = 'wood.fs',
}
local semitrasparent_shader = {
    object_type = "Shader",
    key = 'semitrasparent', 
    path = 'semitrasparent.fs',
}
local wood = {
    object_type = "Enhancement",
    key = 'wood',
    atlas = 'enhancements_atlas',
    
    order = 4,
    pos = { x = 4, y = 0 },
    config = {
        h_chips = 20,
        extra = {
            base_h_chips = 20,
            h_chips_mod = 5,
        }
    },
    all_in_jest = {
        multi_enhancement_z_order = 0
    },
    loc_vars = function(self, info_queue, card)
        return { vars = {
            card.ability.h_chips,
            card.ability.extra.h_chips_mod,
            card.ability.extra.base_h_chips
        } }
    end,
    update = function(self, card, dt)
        if G.hand and G.hand.cards then
            local cards = {}
            for k, v in pairs(G.hand.cards) do
                if SMODS.get_enhancements(G.hand.cards[k]).m_aij_wood then
                    cards[#cards+1] = v
                end
            end
            if #cards - 1 >= 0 then
                card.ability.h_chips = card.ability.extra.base_h_chips + (card.ability.extra.h_chips_mod * (#cards - 1))
            end
        else
            card.ability.h_chips = card.ability.extra.base_h_chips
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

    return love.graphics.newImage(canvas:newImageData(), {mipmaps = true, dpiscale = image:getDPIScale()})
end

function pre_wooded(a)
    local atlas = a.name or a.key
    local name = atlas.."_wooded"
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

function wood_atlas(a)
    local wooded = pre_wooded(a)

    if not wooded.atlas then
        G.ASSET_ATLAS[wooded.new_name] = {}
        G.ASSET_ATLAS[wooded.new_name].wood = true
        G.ASSET_ATLAS[wooded.new_name].name = G.ASSET_ATLAS[wooded.old_name].name .. "_wooded"
        G.ASSET_ATLAS[wooded.new_name].type = G.ASSET_ATLAS[wooded.old_name].type
        G.ASSET_ATLAS[wooded.new_name].px = G.ASSET_ATLAS[wooded.old_name].px
        G.ASSET_ATLAS[wooded.new_name].py = G.ASSET_ATLAS[wooded.old_name].py
        G.ASSET_ATLAS[wooded.new_name].image = process_texture_wood(G.ASSET_ATLAS[wooded.old_name].image)
    end

    return G.ASSET_ATLAS[wooded.new_name]
end


return {name = {"Enhancements"}, items = {wood, wood_shader, semitrasparent_shader}}