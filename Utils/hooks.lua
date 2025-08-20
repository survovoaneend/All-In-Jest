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

--Aureate Coin, The Clay
local ease_anteref = ease_ante
function ease_ante(mod)
    if mod ~= 0 then
        G.P_BLINDS['bl_aij_aureate_coin'].mult = (G.GAME.dollars * 0.1) + 2
        local common_suit, common_rank = nil, nil
        local temp_suit_val, temp_rank_val = 0, 0
        local suit_table, rank_table = {}, {}
        for k, v in pairs(G.deck.cards) do
            suit_table[v.base.suit] = suit_table[v.base.suit] or 0 
            suit_table[v.base.suit] = suit_table[v.base.suit] + 1
            rank_table[v.base.value] = rank_table[v.base.value] or 0 
            rank_table[v.base.value] = rank_table[v.base.value] + 1
        end
        for k, v in pairs(suit_table) do
            if v >= temp_suit_val then
                temp_suit_val = v
                common_suit = k
            end
        end
        for k, v in pairs(rank_table) do
            if v >= temp_rank_val then
                temp_rank_val = v
                common_rank = k
            end
        end
        G.P_BLINDS['bl_aij_the_auroch'].boss.suit = common_suit
        G.P_BLINDS['bl_aij_the_auroch'].boss.rank = common_rank
        G.P_BLINDS['bl_aij_the_clay'].mult = math.floor(100*pseudorandom("clay"))/100 + pseudorandom("clay", 1, 4)
        G.GAME.all_in_jest.unused_hands.ante = 0
        G.GAME.all_in_jest.unused_discards.ante = 0
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
            local loc = obj.pos.y*(anim.frames_per_row or anim.frames)+obj.pos.x
            if (not anim.individual) or (jkr and jkr.animation.target and loc ~= jkr.animation.target) then
                loc = loc + 1
                if anim.immediate and jkr and jkr.animation.target then
                    loc = jkr.animation.target
                end
            end
            if loc >= anim.frames then loc = anim.start_frame or 0 end
            obj.pos.x = (anim.held_frame or loc)%(anim.frames_per_row or anim.frames)
            obj.pos.y = math.floor((anim.held_frame or loc)/(anim.frames_per_row or anim.frames))
            if obj.all_in_jest and obj.all_in_jest.layer_funcs and obj.all_in_jest.layer_funcs.pos and type(obj.all_in_jest.layer_funcs.pos) == "function" then
                obj.all_in_jest.layer_funcs.pos(anim, obj, loc)
            end
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
        if layers then
            for key, v in pairs(layers) do
                if next_soul_frames[key] then
                    local loc = nil
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

local upd = Game.update
function Game:update(dt)
    upd(self, dt)
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
end

local set_spritesref = Card.set_sprites
function Card:set_sprites(_center, _front)
	set_spritesref(self, _center, _front)
    if _center and _center.all_in_jest and _center.all_in_jest.soul_layers then
        for k, v in pairs(_center.all_in_jest.soul_layers) do
            if _center.all_in_jest.soul_layers[k] and not self.children[k] then
                local scale_mod = _center.all_in_jest.soul_layers[k].moving and 0.07 + 0.02*math.cos(1.8*G.TIMERS.REAL) + 0.00*math.cos((G.TIMERS.REAL - math.floor(G.TIMERS.REAL))*math.pi*14)*(1 - (G.TIMERS.REAL - math.floor(G.TIMERS.REAL)))^3 or 0.07
				local rotate_mod = _center.all_in_jest.soul_layers[k].moving and 0.05*math.cos(1.219*G.TIMERS.REAL) + 0.00*math.cos((G.TIMERS.REAL)*math.pi*5)*(1 - (G.TIMERS.REAL - math.floor(G.TIMERS.REAL)))^2 or 0
				self.children[k] = Sprite(
					self.T.x,
					self.T.y,
					self.T.w,
					self.T.h,
					G.ASSET_ATLAS[_center.all_in_jest.soul_layers.atlas or _center.atlas or _center.set],
					_center.all_in_jest.soul_layers[k].pos
				)
				self.children[k].role.draw_major = self
				self.children[k].states.hover.can = false
				self.children[k].states.click.can = false
			end
            self.children[k]:set_sprite_pos(_center.all_in_jest.soul_layers[k].pos)
        end
    end
end