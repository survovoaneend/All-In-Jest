All_in_Jest = SMODS.current_mod
local mod_path = ''..SMODS.current_mod.path
G.AIJ = {}
local injectitems_ref = SMODS.injectItems
--talisman compat
to_big = to_big or function(n)
  return n
end

to_number = to_number or function(n)
  return n
end
SMODS.current_mod.optional_features = {
  retrigger_joker = true
}
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
SMODS.Atlas {
  key = "joker_atlas",
  path = "jokers.png",
  px = 71,
  py = 95
}
SMODS.Atlas {
  key = "jumbo_joker",
  path = "jumbo_joker.png",
  px = 81,
  py = 111
}
SMODS.Atlas {
    key = "deck_atlas",
    path = "decks.png",
    px = 71,
    py = 95
}
SMODS.Atlas {
    key = "sleeve_atlas",
    path = "sleeves.png",
    px = 73,
    py = 95
}
SMODS.Atlas {
    key = "stickers_atlas",
    path = "stickers.png",
    px = 71,
    py = 95
}
SMODS.Atlas { 
    key = 'blinds', 
    path = 'blinds.png', 
    px = 34, 
    py = 34, 
    frames = 21, 
    atlas_table = 'ANIMATION_ATLAS' 
}
SMODS.Atlas {
  key = "legendary_atlas",
  path = "legendaries.png",
  px = 71,
  py = 95
}
SMODS.Atlas {
  key = "consumable_atlas",
  path = "consumables.png",
  px = 71,
  py = 95
}
SMODS.Atlas {
  key = "enhancements_atlas",
  path = "enhancements.png",
  px = 71, 
  py = 95
}
SMODS.Atlas {
  key = "vouchers_atlas",
  path = "vouchers.png",
  px = 71,
  py = 95
}
SMODS.Atlas {
  key = 'tag_atlas',
  path = 'tag.png',
  px = 34,
  py = 34
}

SMODS.Atlas {
  key = 'familiar_atlas',
  path = 'familiar.png',
  px = 71,
  py = 95
}

SMODS.Atlas {
  key = 'partner_atlas',
  path = 'partner_atlas.png',
  px = 46,
  py = 58,
}

SMODS.Atlas {
    key = 'booster_atlas',
    path = 'boosters.png',
    px = 71,
    py = 95
}

SMODS.Atlas {
    key = 'mystery_atlas',
    path = 'mystery.png',
    px = 71,
    py = 95
}

SMODS.Atlas {
  key = 'modicon',
  px = 32,
  py = 32,
  path = 'modicon.png'
}
SMODS.Shader {
    key = 'silhouette',
    path = 'silhouette.fs',
 }

SMODS.Rarity({
	key = "familiar_face",
	loc_txt = {
    name = "Familiar Face"
  },
	badge_colour = HEX("12077d"),
})
SMODS.Atlas { 
    key = 'blind_drawn_replacement', 
    path = 'unknown_blind.png', 
    px = 34, 
    py = 34, 
    frames = 21, 
    atlas_table = 'ANIMATION_ATLAS' 
}
SMODS.Gradient {
    key = 'plasma',
    colours = {
        HEX('F9A2E6'), HEX('b288bc')
    },
    cycle = 5,
    interpolation = 'trig'
}
SMODS.Gradient {
    key = 'silver',
    colours = {
        HEX('afbbca'), HEX('9cacbe')
    },
    cycle = 5,
    interpolation = 'trig'
}
SMODS.Gradient {
    key = 'stellar',
    colours = {
        HEX('666694'), HEX('7a73bb')
    },
    cycle = 5,
    interpolation = 'trig'
}
AllInJest = {}
assert(SMODS.load_file('Utils/context.lua'))()
assert(SMODS.load_file('Utils/draw.lua'))()
assert(SMODS.load_file('Utils/functions.lua'))()
assert(SMODS.load_file('Utils/functions_value_mod.lua'))()
assert(SMODS.load_file('Utils/hooks.lua'))()
assert(SMODS.load_file('Utils/ui.lua'))()
if next(SMODS.find_mod("unBlindShopGUI")) then
    assert(SMODS.load_file('Utils/UnBlind_crossmod.lua'))()
end

local folders = NFS.getDirectoryItems(mod_path.."Items")
local objects = {}

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

local files = {}
collect_item_files(mod_path.."Items", "Items", files)

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
                if (next(SMODS.find_mod("paperback")) or next(SMODS.find_mod("Bunco")))
                   and ((PB_UTIL and PB_UTIL.config and PB_UTIL.config.suits_enabled)
                        or next(SMODS.find_mod("Bunco"))) then
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

for _, curr_obj in ipairs(objects) do
    load_items(curr_obj)
end

-- SMODS mod-specific settings
function All_in_Jest.set_ability_reset_keys()
    return {'jest_charged_applied'}
end