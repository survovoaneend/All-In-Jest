SMODS.Booster:take_ownership_by_kind('Celestial', {
    create_card = function(self, card, i)
        local _card
        if G.GAME.used_vouchers.v_telescope and i == 1 then
            local _planet, _hand, _tally = nil, nil, 0
            for k, v in ipairs(G.handlist) do
                if SMODS.is_poker_hand_visible(v) and G.GAME.hands[v].played > _tally then
                    _hand = v
                    _tally = G.GAME.hands[v].played
                end
            end
            if _hand then
                for k, v in pairs(G.P_CENTER_POOLS.Planet) do
                    if v.config.hand_type == _hand and not v.config.moon then
                        _planet = v.key
                    end
                end
            end
            _card = {set = "Planet", area = G.pack_cards, skip_materialize = true, soulable = true, key = _planet, key_append = "pl1"}
        else
            _card = {set = "Planet", area = G.pack_cards, skip_materialize = true, soulable = true, key_append = "pl1"}
        end
        return _card
    end,
}, true)

if All_in_Jest.config.blue_stake_rework then
    SMODS.Stake:take_ownership('stake_blue', { 
        modifiers = function()
            return
        end,
    }, true)
end

SMODS.Sticker:take_ownership('pinned', { 
    pos = { x = 4, y = 1 },
    atlas = 'stickers_atlas',
    inject = function(self)
        SMODS.Sticker.inject(self)
        G.shared_sticker_pinned = self.sticker_sprite
    end,
}, true)

--SMODS.Voucher:take_ownership('v_petroglyph', {
--    calculate = function(self, card, context)
--        ease_ante(-card.ability.extra)
--        G.GAME.round_resets.blind_ante = G.GAME.round_resets.blind_ante or G.GAME.round_resets.ante
--        G.GAME.round_resets.blind_ante = G.GAME.round_resets.blind_ante-card.ability.extra
--        if next(SMODS.find_card('j_aij_aluzinnu')) then
--        else
--            G.GAME.round_resets.discards = G.GAME.round_resets.discards - card.ability.extra
--            ease_discard(-card.ability.extra)
--        end
--    end,
--}, true)
--
--SMODS.Voucher:take_ownership('v_hieroglyph', {
--    calculate = function(self, card, context)
--        ease_ante(-card.ability.extra)
--        G.GAME.round_resets.blind_ante = G.GAME.round_resets.blind_ante or G.GAME.round_resets.ante
--        G.GAME.round_resets.blind_ante = G.GAME.round_resets.blind_ante-card.ability.extra
--        if next(SMODS.find_card('j_aij_aluzinnu')) then
--        else
--            G.GAME.round_resets.hands = G.GAME.round_resets.hands - card.ability.extra
--            ease_hands_played(-card.ability.extra)
--        end
--    end,
--}, true)

local get_front_spriteinfo_ref = get_front_spriteinfo
function get_front_spriteinfo(_front)
    if _front.card and _front.card.ability and _front.card.ability.numbertaker_rankless and _front.suit then
        if G.SETTINGS.colour_palettes[_front.suit] == 'hc' and G.all_in_jest.numbertaker_rankless['hc_'.._front.suit] then 
            return G.ASSET_ATLAS[G.all_in_jest.numbertaker_rankless['hc_'.._front.suit].atlas], G.all_in_jest.numbertaker_rankless['hc_'.._front.suit].pos 
        elseif G.all_in_jest.numbertaker_rankless[_front.suit] then 
            return G.ASSET_ATLAS[G.all_in_jest.numbertaker_rankless[_front.suit].atlas], G.all_in_jest.numbertaker_rankless[_front.suit].pos 
        else
            return SMODS.get_atlas(G.SETTINGS.colour_palettes[_front.suit] == 'hc' and _front.hc_atlas or _front.lc_atlas or {}) or SMODS.get_atlas(_front.atlas) or SMODS.get_atlas("cards_"..(G.SETTINGS.colour_palettes[_front.suit] == 'hc' and 2 or 1)), {x=12,y=_front.pos.y}
        end
    end
    if _front and _front.suit and _front.value and _front.card and _front.card.ability and _front.card.ability.all_in_jest and _front.card.ability.all_in_jest.random_aij_deck_skin and All_in_Jest.config.random_deck_skins then
        local collab = _front.card.ability.all_in_jest.random_aij_deck_skin[_front.suit]
        if collab then
            local deckSkin = SMODS.DeckSkins[collab]
            if deckSkin then
                if deckSkin.outdated then
                    local hasRank = false
                    for i = 1, #deckSkin.ranks do
                        if deckSkin.ranks[i] == _front.value then hasRank = true break end
                    end
                    if hasRank then
                        local atlas = SMODS.get_atlas(G.SETTINGS.colour_palettes[_front.suit] == 'hc' and deckSkin.hc_atlas or deckSkin.lc_atlas)
                        if atlas then
                            if deckSkin.pos_style == 'collab' then
                                return atlas, G.COLLABS.pos[_front.value]
                            elseif deckSkin.pos_style == 'suit' then
                                return atlas, { x = _front.pos.x, y = 0}
                            elseif deckSkin.pos_style == 'deck' then
                                return atlas, _front.pos
                            elseif deckSkin.pos_style == 'ranks' or nil then
                                for i, rank in ipairs(deckSkin.ranks) do
                                    if rank == _front.value then
                                        return atlas, { x = i - 1, y = 0}
                                    end
                                end
                            end
                        end
                    end
                    return SMODS.get_atlas(G.SETTINGS.colour_palettes[_front.suit] == 'hc' and _front.hc_atlas or _front.lc_atlas or {}) or SMODS.get_atlas(_front.atlas) or SMODS.get_atlas("cards_"..(G.SETTINGS.colour_palettes[_front.suit] == 'hc' and 2 or 1)), _front.pos
                else
                    local palette = deckSkin.palette_map and deckSkin.palette_map[G.SETTINGS.colour_palettes[_front.suit] or ''] or (deckSkin.palettes or {})[1]
                    local hasRank = false
                    for i = 1, #palette.ranks do
                        if palette.ranks[i] == _front.value then hasRank = true break end
                    end
                    if hasRank then
                        local atlas = SMODS.get_atlas(palette.atlas)
                        if type(palette.pos_style) == "table" then
                            if palette.pos_style[_front.value] then
                                if palette.pos_style[_front.value].atlas then
                                    atlas = SMODS.get_atlas(palette.pos_style[_front.value].atlas)
                                end
                                if palette.pos_style[_front.value].pos then
                                    return atlas, palette.pos_style[_front.value].pos
                                end
                            elseif palette.pos_style.fallback_style then
                                if palette.pos_style.fallback_style == 'collab' then
                                    return atlas, G.COLLABS.pos[_front.value]
                                elseif palette.pos_style.fallback_style == 'suit' then
                                    return atlas, { x = _front.pos.x, y = 0}
                                elseif palette.pos_style.fallback_style == 'deck' then
                                    return atlas, _front.pos
                                end
                            end
                        elseif palette.pos_style == 'collab' then
                            return atlas, G.COLLABS.pos[_front.value]
                        elseif palette.pos_style == 'suit' then
                            return atlas, { x = _front.pos.x, y = 0}
                        elseif palette.pos_style == 'deck' then
                            return atlas, _front.pos
                        elseif palette.pos_style == 'ranks' or nil then
                            for i, rank in ipairs(palette.ranks) do
                                if rank == _front.value then
                                    return atlas, { x = i - 1, y = 0}
                                end
                            end
                        end
                    end
                    return SMODS.get_atlas(palette.hc_default and _front.hc_atlas or _front.lc_atlas or {}) or SMODS.get_atlas(_front.atlas) or SMODS.get_atlas("cards_"..(palette.hc_default and 2 or 1)), _front.pos
                end
            end
        end
    end

    --[[
    if _front and _front.suit and _front.value and G.SETTINGS.all_in_jest and G.SETTINGS.all_in_jest.Collabs then
        local collab = G.SETTINGS.all_in_jest.Collabs[_front.suit][_front.value]
        if collab and collab ~= 'default_'.._front.suit and collab ~= 'default' then
            local deckSkin = SMODS.DeckSkins[collab]
            if deckSkin then
                if deckSkin.outdated then
                    local hasRank = false
                    for i = 1, #deckSkin.ranks do
                        if deckSkin.ranks[i] == _front.value then hasRank = true break end
                    end
                    if hasRank then
                        local atlas = G.ASSET_ATLAS[G.SETTINGS.all_in_jest.colour_palettes[_front.suit][_front.value] == 'hc' and deckSkin.hc_atlas or deckSkin.lc_atlas]
                        if atlas then
                            if deckSkin.pos_style == 'collab' then
                                return atlas, G.COLLABS.pos[_front.value]
                            elseif deckSkin.pos_style == 'suit' then
                                return atlas, { x = _front.pos.x, y = 0}
                            elseif deckSkin.pos_style == 'deck' then
                                return atlas, _front.pos
                            elseif deckSkin.pos_style == 'ranks' or nil then
                                for i, rank in ipairs(deckSkin.ranks) do
                                    if rank == _front.value then
                                        return atlas, { x = i - 1, y = 0}
                                    end
                                end
                            end
                        end
                    end
                    return G.ASSET_ATLAS[G.SETTINGS.all_in_jest.colour_palettes[_front.suit][_front.value] == 'hc' and _front.hc_atlas or _front.lc_atlas or {}] or G.ASSET_ATLAS[_front.atlas] or G.ASSET_ATLAS["cards_"..(G.SETTINGS.all_in_jest.colour_palettes[_front.suit][_front.value] == 'hc' and 2 or 1)], _front.pos
                else
                    local palette = deckSkin.palette_map and deckSkin.palette_map[G.SETTINGS.all_in_jest.colour_palettes[_front.suit][_front.value] or ''] or (deckSkin.palettes or {})[1]
                    local hasRank = false
                    for i = 1, #palette.ranks do
                        if palette.ranks[i] == _front.value then hasRank = true break end
                    end
                    if hasRank then
                        local atlas = G.ASSET_ATLAS[palette.atlas]
                        if type(palette.pos_style) == "table" then
                            if palette.pos_style[_front.value] then
                                if palette.pos_style[_front.value].atlas then
                                    atlas = G.ASSET_ATLAS[palette.pos_style[_front.value].atlas]
                                end
                                if palette.pos_style[_front.value].pos then
                                    return atlas, palette.pos_style[_front.value].pos
                                end
                            elseif palette.pos_style.fallback_style then
                                if palette.pos_style.fallback_style == 'collab' then
                                    return atlas, G.COLLABS.pos[_front.value]
                                elseif palette.pos_style.fallback_style == 'suit' then
                                    return atlas, { x = _front.pos.x, y = 0}
                                elseif palette.pos_style.fallback_style == 'deck' then
                                    return atlas, _front.pos
                                end
                            end
                        elseif palette.pos_style == 'collab' then
                            return atlas, G.COLLABS.pos[_front.value]
                        elseif palette.pos_style == 'suit' then
                            return atlas, { x = _front.pos.x, y = 0}
                        elseif palette.pos_style == 'deck' then
                            return atlas, _front.pos
                        elseif palette.pos_style == 'ranks' or nil then
                            for i, rank in ipairs(palette.ranks) do
                                if rank == _front.value then
                                    return atlas, { x = i - 1, y = 0}
                                end
                            end
                        end
                    end
                    return G.ASSET_ATLAS[palette.hc_default and _front.hc_atlas or _front.lc_atlas or {}] or G.ASSET_ATLAS[_front.atlas] or G.ASSET_ATLAS["cards_"..(palette.hc_default and 2 or 1)], _front.pos
                end
            end
        end
    end
    ]]--

    return get_front_spriteinfo_ref(_front)
end

-- local has_showman_ref = SMODS.showman
-- function SMODS.showman(card_key)
--     --if next(SMODS.find_card('j_aij_aluzinnu')) and (card_key == "v_petroglyph" or card_key == "v_hieroglyph") then
--     --    return true
--     --end
--     return has_showman_ref(card_key)
-- end

All_in_Jest.vanilla_food = {
  j_gros_michel = true,
  j_egg = true,
  j_ice_cream = true,
  j_cavendish = true,
  j_turtle_bean = true,
  j_diet_cola = true,
  j_popcorn = true,
  j_ramen = true,
  j_selzer = true,
}

All_in_Jest.seal_edition_compact = {
  e_foil = true,
  e_holo = true,
  e_polychrome = true,
}

if not SMODS.ObjectTypes.Food then
  SMODS.ObjectType {
    key = 'Food',
    default = 'j_egg',
    cards = {},
    inject = function(self)
      SMODS.ObjectType.inject(self)
      for k, _ in pairs(All_in_Jest.vanilla_food) do
        self:inject_card(G.P_CENTERS[k])
      end
    end
  }
end

if not SMODS.ObjectTypes.seal_edition_pool then
  SMODS.ObjectType {
    key = 'seal_edition_pool',
    default = 'e_foil',
    cards = {},
    inject = function(self)
      SMODS.ObjectType.inject(self)
      for k, _ in pairs(All_in_Jest.seal_edition_compact) do
        for k_, v in pairs(G.P_CENTER_POOLS.Edition) do
            if v.key == k then
                self:inject_card(G.P_CENTER_POOLS.Edition[k_])
            end
        end
      end
    end
  }
end

--Aureate Coin, The Clay
local ease_anteref = ease_ante
function ease_ante(mod)
    if mod > 0 then
        G.GAME.all_in_jest.unused_hands.ante = 0
        G.GAME.all_in_jest.unused_discards.ante = 0
        G.GAME.jest_kasperle_voucher_ante = false
    end
    G.GAME.blacklight_should_flicker = true
    check_for_unlock({type = 'ante_change', ante = G.GAME.round_resets.ante, ante_change = mod})
    
    local ref = ease_anteref(mod)
    return ref
end

local set_discover_talliesref = set_discover_tallies
function set_discover_tallies()
    set_discover_talliesref()
    G.DISCOVER_TALLIES['gold_tags'] = {tally = 0, of = 0}
    G.DISCOVER_TALLIES['aij_vouchers'] = {tally = 0, of = 0}
    G.DISCOVER_TALLIES['aij_consumables'] = {tally = 0, of = 0}
    for _, v in pairs(G.P_TAGS) do
        if not v.no_collection then
            if v.config and v.config.aij and v.config.aij.upgrade then
                G.DISCOVER_TALLIES.gold_tags.of = G.DISCOVER_TALLIES.gold_tags.of+1
                if v.discovered then 
                    G.DISCOVER_TALLIES.gold_tags.tally = G.DISCOVER_TALLIES.gold_tags.tally+1
                end
            end
        end
    end
    for _, v in pairs(G.P_CENTERS) do
        if not v.omit and not v.no_collection then
            if v.mod and v.mod.name == 'All in Jest' then
                if v.set and v.consumeable then
                    G.DISCOVER_TALLIES.aij_consumables.of = G.DISCOVER_TALLIES.aij_consumables.of+1
                    if v.discovered then 
                        G.DISCOVER_TALLIES.aij_consumables.tally = G.DISCOVER_TALLIES.aij_consumables.tally+1
                    end
                end
                if v.set and v.set == 'Voucher' then
                    G.DISCOVER_TALLIES.aij_vouchers.of = G.DISCOVER_TALLIES.aij_vouchers.of+1
                    if v.discovered then 
                        G.DISCOVER_TALLIES.aij_vouchers.tally = G.DISCOVER_TALLIES.aij_vouchers.tally+1
                    end
                end
            end
        end
    end
    if check_for_unlock then check_for_unlock({type = 'discover_aij'}) end
end

local set_profile_progressref = set_profile_progress
function set_profile_progress()
    set_profile_progressref()
    local gold_stake = nil
    for k, v in pairs(G.P_CENTER_POOLS.Stake) do
        if v.key == 'stake_gold' then
            gold_stake = k
        end
    end
    G.PROGRESS['aij_joker_gold_stickers'] = {tally = 0, of = 0}
    G.PROGRESS['aij_achievements'] = {tally = 0, of = 0}
    for _, v in pairs(G.P_CENTERS) do
        if v.set == 'Joker' and not v.no_collection and not v.omit and (v.mod and v.mod.name == 'All in Jest') then 
            G.PROGRESS.aij_joker_gold_stickers.of = G.PROGRESS.aij_joker_gold_stickers.of + 1
            if get_joker_win_sticker(v, true) >= gold_stake then
                G.PROGRESS.aij_joker_gold_stickers.tally = G.PROGRESS.aij_joker_gold_stickers.tally + 1
            end
        end
    end
    for _, v in pairs(G.ACHIEVEMENTS) do
        if v.mod and v.mod.name == 'All in Jest' then 
            G.PROGRESS.aij_achievements.of = G.PROGRESS.aij_achievements.of + 1
            if v.earned then
                G.PROGRESS.aij_achievements.tally = G.PROGRESS.aij_achievements.tally + 1
            end
        end
    end
end

-- Modified from Aura
function All_in_Jest.update_frame(dt, k, obj, jkr)
    local anim = G.GAME.all_in_jest.AIJAnimated[k]
    local layers = anim.layers
    if anim and obj and (anim.frames or anim.individual) then
        local next_frame = false
        local next_soul_frames = {}
        if not anim.t then anim.t = 0 end
        anim.t = anim.t + dt
        if anim.t > 1/(anim.fps or 10) then
            anim.t = anim.t - 1/(anim.fps or 10)
            next_frame = true
        end
        if layers then
            for key, v in pairs(layers) do
                if not v.t then v.t = 0 end
                if not next_soul_frames[key] then next_soul_frames[key] = false end
                next_soul_frames[key] = false
                v.t = v.t + dt
                if v.t > 1/(v.fps or anim.fps or 10) then
                    v.t = v.t - 1/(v.fps or anim.fps or 10)
                    next_soul_frames[key] = true
                end
            end
        end
        if next_frame then
            local xrows, yrows = nil
            if anim.frames_per_row and anim.frames_per_row == 'atlas_size' then
                xrows, yrows = SMODS.Atlas.obj_table[obj.atlas].image:getDimensions()
                xrows = xrows / SMODS.Atlas.obj_table[obj.atlas].px
                yrows = yrows / SMODS.Atlas.obj_table[obj.atlas].py
                anim.frames_per_row = xrows
                if anim.start_frame then
                    anim.start_frame = anim.start_frame + (xrows * anim.extra_yrows)
                end
                anim.frames = anim.frames + (xrows * anim.extra_yrows)
            end
            local loc = obj.pos.y*(anim.frames_per_row or anim.frames)+obj.pos.x
            if (not anim.individual) or (jkr and jkr.animation.target and loc ~= jkr.animation.target) then
                loc = loc + 1
                if anim.immediate and jkr and jkr.animation.target then
                    loc = jkr.animation.target
                end
            end
            if loc >= anim.frames then loc = anim.start_frame or 0 end
            if obj.all_in_jest and obj.all_in_jest.animate_func then
                obj.pos.x, obj.pos.y = obj.all_in_jest.animate_func(dt, anim, obj, loc, k)
            else
                obj.pos.x = (anim.held_frame or loc)%(anim.frames_per_row or anim.frames)
                obj.pos.y = math.floor((anim.held_frame or loc)/(anim.frames_per_row or anim.frames))
            end
            if obj.all_in_jest and obj.all_in_jest.layer_funcs and obj.all_in_jest.layer_funcs.pos and type(obj.all_in_jest.layer_funcs.pos) == "function" then
                obj.all_in_jest.layer_funcs.pos(anim, obj, loc)
            end
            if anim.hold then
                local hold = anim.hold
                local xrows, yrows = nil
                if hold.frames_per_row and hold.frames_per_row == 'atlas_size' then
                    xrows, yrows = SMODS.Atlas.obj_table[obj.atlas].image:getDimensions()
                    xrows = xrows / SMODS.Atlas.obj_table[obj.atlas].px
                    yrows = yrows / SMODS.Atlas.obj_table[obj.atlas].py
                    hold.frames_per_row = xrows
                    if hold.min_start_frames then
                        hold.min_start_frames = hold.min_start_frames + (xrows * anim.extra_yrows)
                    end
                    hold.min_frames = hold.min_frames + (xrows * anim.extra_yrows)
                    hold.max_frames = hold.max_frames + (xrows * anim.extra_yrows)
                end
                hold.temp = hold.temp or 0
                hold.temp = hold.temp + 1
                if hold.hold_for_min then hold.cur_random = hold.cur_random or math.random(hold.hold_for_min, hold.hold_for_max) end
                if hold.temp >= (hold.hold_for or hold.cur_random) then
                    anim.frames = anim.frames + hold.frames
                    anim.start_frame = anim.start_frame + hold.frames
                    if anim.frames >= hold.max_frames then
                        anim.frames = hold.min_frames
                        anim.start_frame = hold.min_start_frames
                    end
                    if hold.cur_random then hold.cur_random = nil end
                    hold.temp = 0
                end
            end
        end
        if layers then
            for key, v in pairs(layers) do
                if next_soul_frames[key] then
                    local loc = nil
                    local xrows, yrows = nil
                    if v.frames_per_row and v.frames_per_row == 'atlas_size' then
                        xrows, yrows = SMODS.Atlas.obj_table[obj.atlas].image:getDimensions()
                        xrows = xrows / SMODS.Atlas.obj_table[obj.atlas].px
                        yrows = yrows / SMODS.Atlas.obj_table[obj.atlas].py
                        v.frames_per_row = xrows
                        if v.start_frame then
                            v.start_frame = v.start_frame + (xrows * v.extra_yrows)
                        end
                        v.frames = v.frames + (xrows * v.extra_yrows)
                    end
                    if key == 'soul_pos' then
                        loc = obj.soul_pos.y*(v.frames_per_row or v.frames)+obj.soul_pos.x
                        if (not v.individual) or (jkr and jkr.animation.target and loc ~= jkr.animation.target) then
                            loc = loc + 1
                            if v.immediate and jkr and jkr.animation.target then
                                loc = jkr.animation.target
                            end
                        end
                        if loc >= v.frames then loc = v.start_frame or 0 end
                        obj.soul_pos.x = (v.held_frame or loc)%(v.frames_per_row or v.frames)
                        obj.soul_pos.y = math.floor((v.held_frame or loc)/(v.frames_per_row or v.frames))
                        if obj.all_in_jest and obj.all_in_jest.layer_funcs and obj.all_in_jest.layer_funcs.soul_pos and type(obj.all_in_jest.layer_funcs.soul_pos) == "function" then
                            obj.all_in_jest.layer_funcs.soul_pos(v, obj, loc)
                        end
                    else
                        loc = obj.all_in_jest.soul_layers[key].pos.y*(v.frames_per_row or v.frames)+obj.all_in_jest.soul_layers[key].pos.x
                        if (not v.individual) or (jkr and jkr.animation.target and loc ~= jkr.animation.target) then
                            loc = loc + 1
                            if v.immediate and jkr and jkr.animation.target then
                                loc = jkr.animation.target
                            end
                        end
                        if loc >= v.frames then loc = v.start_frame or 0 end
                        obj.all_in_jest.soul_layers[key].pos.x = (v.held_frame or loc)%(v.frames_per_row or v.frames)
                        obj.all_in_jest.soul_layers[key].pos.y = math.floor((v.held_frame or loc)/(v.frames_per_row or v.frames))
                        if obj.all_in_jest.layer_funcs and obj.all_in_jest.layer_funcs[key] and type(obj.all_in_jest.layer_funcs[key]) == "function" then
                            obj.all_in_jest.layer_funcs[key](v, obj, loc)
                        end
                    end
                    if v.hold then
                        local hold = v.hold
                        hold.temp = hold.temp or 0
                        hold.temp = hold.temp + 1
                        if hold.hold_for_min then hold.cur_random = hold.cur_random or math.random(hold.hold_for_min, hold.hold_for_max) end
                        if hold.temp >= (hold.hold_for or hold.cur_random) then
                            v.frames = v.frames + hold.frames
                            v.start_frame = v.start_frame + hold.frames
                            if v.frames >= hold.max_frames then
                                v.frames = hold.min_frames
                                v.start_frame = hold.min_start_frames
                            end
                            if hold.cur_random then hold.cur_random = nil end
                            hold.temp = 0
                        end
                    end
                end
            end
        end
    end
end

local gameupdateref = Game.update
function Game:update(dt)
    local ref = gameupdateref(self, dt)
    for k, v in pairs(G.GAME.all_in_jest.AIJAnimated) do
        All_in_Jest.update_frame(dt, k, G.P_CENTERS[k])
        if not G.P_CENTERS[k] then
            for n, val in pairs(G.P_CENTER_POOLS.Enhanced) do
                if G.P_CENTER_POOLS.Enhanced[n].key == k then
                    All_in_Jest.update_frame(dt, k, G.P_CENTER_POOLS.Enhanced[n])
                end
            end
        end
    end
    if G.GAME.round_resets.blind_tags then
        for k, v in pairs(G.GAME.round_resets.blind_tags) do
            if G.GAME.all_in_jest.blind_tags[k] and G.GAME.all_in_jest.blind_tags[k][1] then
                if G.GAME.round_resets.blind_tags[k] ~= G.GAME.all_in_jest.blind_tags[k][1] then
                    G.GAME.round_resets.blind_tags[k] = G.GAME.all_in_jest.blind_tags[k][1]
                end
            end
        end
    end
    if G.GAME and G.GAME.all_in_jest and G.GAME.all_in_jest.blind_tags and G.GAME.all_in_jest.blind_tags.amt >= 1 then
        G.GAME.all_in_jest.blind_tags.prev_amt = G.GAME.all_in_jest.blind_tags.prev_amt or G.GAME.all_in_jest.blind_tags.amt
        local blind_tags = 0
        blind_tags = blind_tags + G.GAME.all_in_jest.blind_tags.amt
        if blind_tags ~= G.GAME.all_in_jest.blind_tags.prev_amt then
            aij_reroll_tags(nil, {refresh = true})
            G.GAME.all_in_jest.blind_tags.prev_amt = G.GAME.all_in_jest.blind_tags.amt
        end
    end
    return ref
end

local set_spritesref = Card.set_sprites
function Card:set_sprites(_center, _front)

    local orig_atlas = _center and _center.atlas
    local orig_pos = _center and _center.pos

    -- For fusion enhancements
    if _center and _center.set and self.ability then
        if self.config.center and self.config.aij_other_center and self.config.aij_other_center['center'] then
            local atlas_key = _center.atlas or "centers"
            local atlas, pos = All_in_Jest.get_multi_enhancement_atlas(self.config.center, self.config.aij_other_center['center'])
            if atlas and pos then
                _center.atlas = atlas.name
                _center.pos = pos
            end
        end
    end

    -- For scorched cards
    if _center and _center.set and self.ability then
        if SMODS.has_enhancement(self, "m_aij_scorched") then
            local atlas_key = _center.atlas or "centers"
            local atlas = SMODS.get_atlas(atlas_key)
            _center.atlas = scorched_atlas(atlas).name
        end
    end

    -- For Misprint cards
    -- if _center then
    --     if self.edition and self.edition.key == "e_aij_misprint" and self.children.center then
    --         local atlas_key = _center.atlas or "centers"
    --         local atlas = SMODS.get_atlas(atlas_key)
    --         _center.atlas = misprint_atlas(atlas, self.children.center.scale.x, 0).name
    --     end
    -- end

	set_spritesref(self, _center, _front)

    if _center then
        _center.atlas = orig_atlas
        _center.pos = orig_pos
    end

    -- For custom soul layers (e.g. baddata)
    if _center and _center.discovered and _center.all_in_jest and _center.all_in_jest.soul_layers then
        for k, v in pairs(_center.all_in_jest.soul_layers) do
            if _center.all_in_jest.soul_layers[k] and not self.children[k] then
                local scale_mod = _center.all_in_jest.soul_layers[k].moving and 0.07 + 0.02*math.cos(1.8*G.TIMERS.REAL) + 0.00*math.cos((G.TIMERS.REAL - math.floor(G.TIMERS.REAL))*math.pi*14)*(1 - (G.TIMERS.REAL - math.floor(G.TIMERS.REAL)))^3 or 0.07
                local rotate_mod = _center.all_in_jest.soul_layers[k].moving and 0.05*math.cos(1.219*G.TIMERS.REAL) + 0.00*math.cos((G.TIMERS.REAL)*math.pi*5)*(1 - (G.TIMERS.REAL - math.floor(G.TIMERS.REAL)))^2 or 0
                self.children[k] = SMODS.create_sprite(
                    self.T.x,
                    self.T.y,
                    self.T.w,
                    self.T.h,
                    _center.all_in_jest.soul_layers.atlas or _center.atlas or _center.set,
                    _center.all_in_jest.soul_layers[k].pos
                )
                self.children[k].role.draw_major = self
                self.children[k].states.hover.can = false
                self.children[k].states.click.can = false
            end
            self.children[k]:set_sprite_pos(_center.all_in_jest.soul_layers[k].pos)
        end
    end

    -- For rankless cards
    if self.ability and self.ability.numbertaker_rankless and _front and _front.suit then
        if not G.all_in_jest.numbertaker_rankless[_front.suit] then 
            local name = self.children.front.atlas.name
            local base = G.ASSET_ATLAS[name].image_data:clone()
            local pos = {x=12,y=self.children.front.sprite_pos.y}
            local layer = G.ASSET_ATLAS[G.all_in_jest.numbertaker_rankless['Other'].atlas].image_data:clone()
            local posl = G.all_in_jest.numbertaker_rankless['Other'].pos
            local bpx, bpy = G.ASSET_ATLAS[name].px, G.ASSET_ATLAS[name].py
            local lpx, lpy = G.ASSET_ATLAS[G.all_in_jest.numbertaker_rankless['Other'].atlas].px, G.ASSET_ATLAS[G.all_in_jest.numbertaker_rankless['Other'].atlas].py
            local new_color = aij_get_mcc_pixel(base, pos, {bpx = bpx, bpy = bpy})
            aij_pasteAlpha(base, layer, pos, {x=9, y=4}, {reverse = true, lpx = lpx, lpy = lpy, bpx = bpx, bpy = bpy})
            aij_pasteAlpha(base, layer, pos, posl, {lpx = lpx, lpy = lpy, bpx = bpx, bpy = bpy})
            local replace_color = HEX('f900ff')
            self.children.front.atlas = {
                px = bpx, py = bpy, name = name,
                image_data = base,
                image = love.graphics.newImage(base, {mipmaps = true, dpiscale = G.SETTINGS.GRAPHICS.texture_scaling})
            }
            if new_color then
                new_color[4] = 255
                self.children.front.atlas = aij_recolour_atlas(replace_color, new_color, self.children.front.atlas, true)
            end
            self.children.front:set_sprite_pos(pos)
        end
    end
end

local cardupdateref = Card.update
function Card:update(dt)
    local ref = cardupdateref(self, dt)
    if not self.front_hidden then self.front_hidden = self:should_hide_front() end
    return ref
end

-- Save/Load for fusion enhancements, inherent effects and seal editions
-- A lovely patch for Card:load() is also needed
local card_save_ref = Card.save
function Card:save()
    local saveTable = card_save_ref(self)

    if self.config.aij_other_center then
        saveTable.save_fields.aij_other_center = self.config.aij_other_center['center'].key
        saveTable.aij_other_center_ability = self.config.aij_other_center['ability']
    end

    if self.aij_inherent_effects then
        saveTable.aij_inherent_effects = self.aij_inherent_effects
    end

    if self.aij_seal_edition then
        saveTable.aij_seal_edition = self.aij_seal_edition
    end

    return saveTable
end

-- Automatically saves G.GAME.blind.aij_original_chips when blind is loaded
local aij_blind_set_blind_ref = Blind.set_blind
function Blind:set_blind(blind, reset, silent)
    if blind and not reset then
        self.aij_original_chips = get_blind_amount(G.GAME.round_resets.ante)*blind.mult*G.GAME.starting_params.ante_scaling
        self.aij_original_mult = blind.mult
        self.aij_added_chips = 0
    end
    local ret = aij_blind_set_blind_ref(self, blind, reset, silent)
    return ret
end

-- Handle original chips when game is saved and reloaded
local aij_blind_save_ref = Blind.save
function Blind:save()
    local blindTable = aij_blind_save_ref(self)
    blindTable.aij_original_chips = self.aij_original_chips
    blindTable.aij_original_mult = self.aij_original_mult
    blindTable.aij_added_chips = self.aij_added_chips
    return blindTable
end
local aij_blind_load_ref = Blind.load
function Blind:load(blindTable)
    local ret = aij_blind_load_ref(self, blindTable)
    self.aij_original_chips = blindTable.aij_original_chips
    self.aij_original_mult = blindTable.aij_original_mult
    self.aij_added_chips = blindTable.aij_added_chips
    ease_background_colour_blind(G.STATE, self.name or 'Small Blind') -- For The Journey blind
    return ret
end

-- Hook for The Arm's downgrades
-- If one of chips/mult are at base levels, then downgrade the other appropriately
local aij_level_up_hand_ref = level_up_hand
function level_up_hand(card, hand, instant, amount)
    if amount ~= nil and amount < 1 then
        local obj = G.GAME.hands[hand]
        local freeze_mult = false
        local freeze_chips = false
        if obj.mult <= obj.s_mult then
            freeze_mult = true
        end
        if obj.chips <= obj.s_chips then
            freeze_chips = true
        end
        if freeze_chips and freeze_mult then
            return
        elseif freeze_chips then
            return level_up_hand_mult(card, hand, instant, amount)
        elseif freeze_mult then
            return level_up_hand_chips(card, hand, instant, amount)
        end
    end
    return aij_level_up_hand_ref(card, hand, instant, amount)
end


local poll_obj_ref = SMODS.poll_object
function SMODS.poll_object(args)
    -- legendary in shop logic
    if args.type == 'Joker' and args.rarities == nil and G.GAME.jest_legendary_pool ~= nil and G.GAME.jest_legendary_pool.in_shop then
        if pseudorandom('rarity'..G.GAME.round_resets.ante..(args.append or '')) > G.GAME.jest_legendary_pool.rate then
            args.rarities = {'Legendary'}
        end
    end

    return poll_obj_ref(args)
end

local original_emplace = CardArea.emplace
function CardArea:emplace(card, ...)
    local result = original_emplace(self, card, ...)
    if self == G.jokers and card.ability.set == "Joker" and G.STATE == 5 then
        G.GAME.jest_bought_jokers = (G.GAME.jest_bought_jokers or 0) + 1
    end

    return result
end
