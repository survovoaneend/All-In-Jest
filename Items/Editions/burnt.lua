local burnt_shader = {
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
SMODS.Sound {
  key = 'burnt',
  path = 'glimmer.mp3'
}
local burnt = {
    object_type = "Edition",
    key = 'burnt', 
    ignore = true,
    sound = {
        sound = 'aij_burnt',
        per = 1,
        vol = 1
    },
    order = 3,
    config = { },
    loc_vars = function(self, info_queue, card)
        return {vars = {}}
    end,
    on_apply = function(card)
        
    end,
    on_remove = function(card)
        
    end,
    in_shop = true,
    disable_base_shader = true,
    disable_shadow = true,
    weight = 3,
    extra_cost = 4,
    get_weight = function(self)
        return self.weight
    end,

    shader = 'burnt'
}
return {name = "Editions", items = {burnt, burnt_shader}}