SMODS.Booster:take_ownership_by_kind('Celestial', {
    group_key = "k_celestial_pack",
    update_pack = SMODS.Booster.update_pack,
    ease_background_colour = function(self) ease_background_colour_blind(G.STATES.PLANET_PACK) end,
    create_UIBox = SMODS.Booster.create_UIBox,
    particles = function(self)
        G.booster_pack_stars = Particles(1, 1, 0,0, {
            timer = 0.07,
            scale = 0.1,
            initialize = true,
            lifespan = 15,
            speed = 0.1,
            padding = -4,
            attach = G.ROOM_ATTACH,
            colours = {G.C.WHITE, HEX('a7d6e0'), HEX('fddca0')},
            fill = true
        })
        G.booster_pack_meteors = Particles(1, 1, 0,0, {
            timer = 2,
            scale = 0.05,
            lifespan = 1.5,
            speed = 4,
            attach = G.ROOM_ATTACH,
            colours = {G.C.WHITE},
            fill = true
        })
    end,
    create_card = function(self, card, i)
        local _card
        if G.GAME.used_vouchers.v_telescope and i == 1 then
            local _hand, _tally = nil, 0
            for k, v in ipairs(G.handlist) do
                if G.GAME.hands[v].visible and G.GAME.hands[v].played > _tally then
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
    loc_vars = pack_loc_vars,
},true)

if All_in_Jest.config.blue_stake_rework then
    SMODS.Stake:take_ownership('stake_blue', { 
        modifiers = function()
            return
        end,
    },true)
end

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

local has_any_suit_ref = SMODS.has_any_suit
function SMODS.has_any_suit(card)
    return has_any_suit_ref(card) or All_in_Jest.counts_as_all_suits(card)
end

local has_showman_ref = SMODS.showman
function SMODS.showman(card_key)
    --if next(SMODS.find_card('j_aij_aluzinnu')) and (card_key == "v_petroglyph" or card_key == "v_hieroglyph") then
    --    return true
    --end
    return has_showman_ref(card_key)
end

--Aureate Coin, The Clay
local ease_anteref = ease_ante
function ease_ante(mod)
    if mod ~= 0 then
        G.P_BLINDS['bl_aij_aureate_coin'].mult = (G.GAME.dollars * 0.1) + 2
        G.P_BLINDS['bl_aij_the_clay'].mult = math.floor(100*pseudorandom("clay"))/100 + pseudorandom("clay", 1, 4)
    end
    
    local ref = ease_anteref(mod)
    return ref
end
SMODS.jest_Badge = {
    key = "jest_chaotic_card",
    badge_colour = HEX '8F00FF',
}

SMODS.PokerHand {
    key = "Royal Flush",
    mult = 8,
    chips = 100,
    l_mult = 6,
    l_chips = 60,
    example = {
        { 'S_A', true },
        { 'S_K', true },
        { 'S_Q', true },
        { 'S_J', true },
        { 'S_10', true },
    },
    above_hand = 'Straight Flush',
    evaluate = function(parts, hand)
        if not next(parts._flush) or not next(parts._straight) then return {} end
        local min = 10
        for j = 1, #hand do
            if hand[j]:get_id() < min then min =hand[j]:get_id() end
        end
        if min >= 10 then 
            return { SMODS.merge_lists(parts._flush, parts._straight) }
        else
            return {}
        end
    end,
    visible = function(self)
        return false
    end,
}

local init_game_object_ref = Game.init_game_object
function Game.init_game_object(self)
  local ret = init_game_object_ref(self)
  local secrets = {}
  for k, v in pairs(SMODS.PokerHands) do
    if (type(v.visible) == 'function' and not v:visible()) or v.visible == false then 
        if k ~= 'aij_Royal Flush' then
            table.insert(secrets, k) 
        end
    end
  end
  ret.all_in_jest.secret_hands = secrets
  return ret
end

-- Modified from Aura
function All_in_Jest.update_frame(dt, k, obj, jkr)
    local anim = G.GAME.all_in_jest.AIJAnimated[k]
    if anim and obj and (anim.frames or anim.individual) then
        local next_frame = false
        local next_frame_extra = false
        if not anim.t then anim.t = 0 end
        anim.t = anim.t + dt
        if anim.t > 1/(anim.fps or 10) then
            anim.t = anim.t - 1/(anim.fps or 10)
            next_frame = true
        end
        if anim.extra then
            if not anim.extra.t then anim.extra.t = 0 end
            anim.extra.t = anim.extra.t + dt
            if anim.extra.t > 1/(anim.extra.fps or 10) then
                anim.extra.t = anim.extra.t - 1/(anim.extra.fps or 10)
                next_frame_extra = true
            end
        end
        if next_frame then
            local loc = obj.pos.y*(anim.frames_per_row or anim.frames)+obj.pos.x
            if (not anim.individual) or (jkr and jkr.animation.target and loc ~= jkr.animation.target) then
                loc = loc + 1
                if anim.immediate and jkr and jkr.animation.target then
                    loc = jkr.animation.target
                end
            end
            if loc >= anim.frames then loc = anim.start_frame or 0 end
            obj.pos.x = loc%(anim.frames_per_row or anim.frames)
            obj.pos.y = math.floor(loc/(anim.frames_per_row or anim.frames))
            if anim.hold then
                local hold = anim.hold
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
        if next_frame_extra then
            local loc = obj.pos.extra.y*(anim.extra.frames_per_row or anim.extra.frames)+obj.pos.extra.x
            if (not anim.individual) or (jkr and jkr.animation.extra and jkr.animation.extra.target and loc ~= jkr.animation.extra.target) then
                loc = loc + 1
                if anim.extra.immediate and jkr and jkr.animation.extra and jkr.animation.extra.target then
                    loc = jkr.animation.extra.target
                end
            end
            if loc >= anim.extra.frames then loc = anim.extra.start_frame or 0 end
            obj.pos.extra.x = loc%(anim.extra.frames_per_row or anim.extra.frames)
            obj.pos.extra.y = math.floor(loc/(anim.extra.frames_per_row or anim.extra.frames))
        end
    end
end

local upd = Game.update
function Game:update(dt)
    upd(self, dt)
    for k, v in pairs(G.GAME.all_in_jest.AIJAnimated) do
        All_in_Jest.update_frame(dt, k, G.P_CENTERS[k])
    end
end