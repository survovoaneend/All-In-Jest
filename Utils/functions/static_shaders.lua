

local function load_file_content(path, id)
    if not path or path == "" then
        error("No path was provided to load.")
    end
    local mod
    if not id then
        if not SMODS.current_mod then
            error("No ID was provided! Usage without an ID is only available when file is first loaded.")
        end
        mod = SMODS.current_mod
    else
        mod = SMODS.Mods[id]
    end
    if not mod then
        error("Mod not found. Ensure you are passing the correct ID.")
    end
    local file_path = mod.path .. path
    local file_content, err = NFS.read(file_path)
    if not file_content then return  nil, "Error reading file '" .. path .. "' for mod with ID '" .. mod.id .. "': " .. err end
    return file_content
end

All_in_Jest.load_shaders = function()
    G.SHADERS['aij_wood_spritesheet'] = love.graphics.newShader(load_file_content("assets/shaders/spritesheet_shaders/wood_spritesheet.fs"))
    G.SHADERS['aij_wood_new_spritesheet'] = love.graphics.newShader(load_file_content("assets/shaders/spritesheet_shaders/wood_new_spritesheet.fs"))
    G.SHADERS['aij_wood_hc_spritesheet'] = love.graphics.newShader(load_file_content("assets/shaders/spritesheet_shaders/wood_hc_spritesheet.fs"))
    G.SHADERS['aij_burnt_spritesheet'] = love.graphics.newShader(load_file_content("assets/shaders/spritesheet_shaders/burnt_spritesheet.fs"))
    G.SHADERS['aij_fusion_spritesheet'] = love.graphics.newShader(load_file_content("assets/shaders/spritesheet_shaders/fusion_spritesheet.fs"))
    G.SHADERS['aij_misprint_spritesheet'] = love.graphics.newShader(load_file_content("assets/shaders/spritesheet_shaders/misprint_spritesheet.fs"))
end