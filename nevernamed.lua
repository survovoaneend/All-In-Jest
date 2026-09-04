All_in_Jest = SMODS.current_mod
local mod_path = ''..SMODS.current_mod.path
G.AIJ = {}

local DEV_TAB_DEBUG = false

All_in_Jest.optional_features = {
  retrigger_joker = true,
  object_weights = true,
  cardareas = {
      deck = true
  }
}

local injectitems_ref = SMODS.injectItems
SMODS.injectItems = function()
    injectitems_ref()
    G.AIJ.shared_mystery_sprites = G.AIJ.shared_mystery_sprites or {
        bg1 = SMODS.create_sprite(0, 0, 1, 1, 'aij_mystery_atlas', {
            x = 0,
            y = 0
        }),
        bg2 = SMODS.create_sprite(0, 0, 1, 1, 'aij_mystery_atlas', {
          x = 1,
          y = 0
        }),
        bg3 = SMODS.create_sprite(0, 0, 1, 1, 'aij_mystery_atlas', {
          x = 2,
          y = 0
        }),
        bg4 = SMODS.create_sprite(0, 0, 1, 1, 'aij_mystery_atlas', {
          x = 3,
          y = 0
      }),
    }
end

AllInJest = {}

local function collect_item_files(base_fs, rel, out)
    for _, name in ipairs(NFS.getDirectoryItems(base_fs)) do
        local abs = base_fs.."/"..name
        local info = NFS.getInfo(abs)
        if info and info.type == "directory" then
            collect_item_files(abs, rel.."/"..name, out)
        elseif info and info.type == "file" and name:match("%.lua$") then
            table.insert(out, rel.."/"..name)
        end
    end
end

-- Load util files
local util_fils = {}
collect_item_files(mod_path.."Utils", "Utils", util_fils)

for _, rel in ipairs(util_fils) do
    local load = true
    if rel == "Utils/ui/dev_tab.lua" then
        load = DEV_TAB_DEBUG
    elseif rel == 'Utils/UnBlind_crossmod.lua' then
        load = not not next(SMODS.find_mod("unBlindShopGUI"))
    end
    if load then
        assert(SMODS.load_file(rel))()
    end
end


-- Add deck skins
for _, data in ipairs(AllInJest.deck_skins) do
  for _, suit in ipairs(data.suits) do
    local key = data.id .. "_" .. suit:lower()

    -- Common ranks used in both palettes
    local ranks = { 'King', 'Queen', 'Jack' }
    local display_ranks = ranks
    
    local atlas_lc = SMODS.Atlas {
      key = key .. '_lc',
      path = 'collabs/lc/' .. key .. '_lc.png',
      px = 71,
      py = 95
    }

    local atlas_hc = SMODS.Atlas {
      key = key .. '_hc',
      path = 'collabs/hc/' .. key .. '_hc.png',
      px = 71,
      py = 95
    }

    SMODS.DeckSkin {
      key = key,
      suit = suit,
      loc_txt = {
        ['en-us'] = data.name
      },
      palettes = {
        {
          key = 'lc',
          ranks = ranks,
          display_ranks = display_ranks,
          pos_style = 'ranks',
          atlas = atlas_lc.key
        },
        {
          key = 'hc',
          ranks = ranks,
          display_ranks = display_ranks,
          pos_style = 'ranks',
          atlas = atlas_hc.key,
          hc_default = true
        }
      }
    }
  end
end

local function load_items(curr_obj)
    if curr_obj.init then curr_obj:init() end
    if not curr_obj.items then
        print("Warning: curr_obj has no items")
        return
    end
    for _, item in ipairs(curr_obj.items) do
        if All_in_Jest.config.aij_lite and not item.lite then
            goto continue
        end
        item.ignore             = item.ignore             or false
        item.jest_spec_moon     = item.jest_spec_moon     or false
        item.jest_rec_paperback = item.jest_rec_paperback or false
        if item.jest_spec_moon and All_in_Jest.config.moons_enabled and not item.ignore then
            if item.jest_rec_paperback then
                if ((next(SMODS.find_mod("paperback")) or next(SMODS.find_mod("Bunco")))
                   and ((PB_UTIL and PB_UTIL.config and PB_UTIL.config.suits_enabled)
                        or next(SMODS.find_mod("Bunco")))) then
                    SMODS[item.object_type](item)
                    goto continue
                else
                    goto continue
                end
            else
                SMODS[item.object_type](item)
                goto continue
            end
        end
        if item.jest_spec_moon and not All_in_Jest.config.moons_enabled then
            goto continue
        end
        -- Add incompatibility to all jokers with an activated ability and to advanced copiers
        if (item.all_in_jest and item.all_in_jest.use_ability) or (item.config and item.config["j_aij_" .. item.key]) then
            item.j_aij_whats_left_compat = false
            item.j_aij_clay_joker_compat = false
        end
        if item.jest_rec_paperback then
            if next(SMODS.find_mod("paperback")) and (PB_UTIL and PB_UTIL.config and PB_UTIL.config.suits_enabled) then
                if SMODS[item.object_type] and not item.ignore then
                    SMODS[item.object_type](item)
                elseif item.object_loader and not item.ignore then
                    item.object_loader[item.object_type](item)
                end
                goto continue
            else
                goto continue
            end
        end
        if SMODS[item.object_type] and not item.ignore then
            SMODS[item.object_type](item)
        elseif item.object_loader and not item.ignore then
            item.object_loader[item.object_type](item)
        elseif not item.ignore then
            print("Error loading item "..item.key.." of unknown type "..item.object_type)
        end
        ::continue::
    end
end

-- Collect item files
local files = {}
collect_item_files(mod_path.."Items", "Items", files)
local objects = {}
for _, rel in ipairs(files) do
    local f, err = SMODS.load_file(rel)
    if not f then
        print("Error loading item file '"..rel.."': "..tostring(err))
    else
        local ok, curr_obj = pcall(f)
        if ok then
            table.insert(objects, curr_obj)
        end
    end
end

-- Sort loaded objects by defined order
table.sort(objects, function(a, b)
    local function get_lowest_order(obj)
        if not obj.items then return math.huge end
        local lowest = math.huge
        for _, item in ipairs(obj.items) do
            if item.order and item.order < lowest then
                lowest = item.order
            end
        end
        return lowest
    end
    return get_lowest_order(a) < get_lowest_order(b)
end)

-- Load all the items
for _, curr_obj in ipairs(objects) do
    load_items(curr_obj)
end

-- Create atlases for joker parts
local function collect_png_files(base_fs, rel, out)
    for _, name in ipairs(NFS.getDirectoryItems(base_fs)) do
        local abs = base_fs.."/"..name
        local info = NFS.getInfo(abs)
        if info and info.type == "directory" then
            collect_item_files(abs, rel.."/"..name, out)
        elseif info and info.type == "file" and name:match("%.png$") then
            table.insert(out, rel.."/"..name)
        end
    end
end

local png_files = {}
collect_png_files(mod_path.."assets/1x/parts", "parts", png_files)

for _, filename in ipairs(png_files) do
    local path = mod_path.."assets/1x/parts"..filename
    local name = filename:sub(1, -5) 
    name = name:sub(7)

    SMODS.Atlas({
        key = name,
        path = 'parts/'..name..'.png',
        px = '71',
        py = '95',
    })
    
    -- 4. Function to handle the skip button
    G.FUNCS.skip_aij_intro = function(e)
        if G.OVERLAY_TUTORIAL then
            G.OVERLAY_TUTORIAL.skip_steps = true
            if G.OVERLAY_TUTORIAL.Jimbo then G.OVERLAY_TUTORIAL.Jimbo:remove() end
            if G.OVERLAY_TUTORIAL.content then G.OVERLAY_TUTORIAL.content:remove() end
            G.OVERLAY_TUTORIAL:remove()
            G.OVERLAY_TUTORIAL = nil
        end
        G.E_MANAGER:clear_queue('tutorial')
    end
end

-- Loads static shaders
All_in_Jest.load_shaders()