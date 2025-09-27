local baddata = {
    object_type = "Joker",
    order = 412,
    key = "baddata",
    rarity = 2,
    pos = { x = 15, y = 17},
    soul_pos = { x = 6, y = 18},
    all_in_jest = {
		soul_layers = {
            aij_floating_sprite_1 = {pos = {x = 15, y = 19}, moving = false,}
        },
		layer_funcs = {
			pos = function(anim, obj, loc)
				-- Runs every frame
				anim.temp_hold = anim.temp_hold or (anim.fps * math.random(3,6))
				anim.cur_frame = anim.cur_frame or 0 
				anim.cur_frame = anim.cur_frame + 1
				anim.cur_frames = anim.cur_frames or {}
				anim.cur_frames[#anim.cur_frames+1] = loc
				if anim.cur_frame >= anim.temp_hold then
					anim.fps = math.random(7,12)
					anim.temp_hold = (anim.fps * math.random(3,6))
					anim.cur_frame = 0
					local temp_loc = anim.cur_frames[math.random(1,#anim.cur_frames)]
					obj.pos.x = temp_loc%(anim.frames_per_row or anim.frames)
					obj.pos.y = math.floor(temp_loc/(anim.frames_per_row or anim.frames))
					anim.cur_frames = nil
				end
			end,
			soul_pos = function(anim, obj, loc)
				-- Runs every frame
				anim.temp_hold = anim.temp_hold or (anim.fps * math.random(3,6))
				anim.other_temp_hold = anim.other_temp_hold or anim.temp_hold + (anim.fps * math.random(1,2))
				anim.cur_frame = anim.cur_frame or 0 
				anim.cur_frame = anim.cur_frame + 1
				anim.other_cur_frame = anim.other_cur_frame or 0 
				anim.other_cur_frame = anim.other_cur_frame + 1
				anim.cur_frames = anim.cur_frames or {}
				anim.cur_frames[#anim.cur_frames+1] = loc
				anim.special_frames = anim.special_frames or {
					{2,19}, {3,19}, {4,19}, {5,19}, {6,19}, {7,19}, {8,19}, {9,19},
				}
				if anim.cur_frame >= anim.temp_hold and not (anim.other_cur_frame >= anim.other_temp_hold) then
					anim.fps = math.random(7,12)
					anim.temp_hold = (anim.fps * math.random(3,6))
					anim.cur_frame = 0
					local temp_loc = anim.cur_frames[math.random(1,#anim.cur_frames)]
					obj.soul_pos.x = temp_loc%(anim.frames_per_row or anim.frames)
					obj.soul_pos.y = math.floor(temp_loc/(anim.frames_per_row or anim.frames))
					anim.cur_frames = nil
				end
				if anim.other_cur_frame >= anim.other_temp_hold then
					if not anim.temp_hold_2 then
						anim.soul_pos_pos = anim.special_frames[math.random(1, #anim.special_frames)]
						anim.held_frame = anim.soul_pos_pos[2]*(anim.frames_per_row or anim.frames)+anim.soul_pos_pos[1]
					end
					anim.temp_hold_2 = anim.temp_hold_2 or math.random(1,3)
					anim.hold_2_cur_frame = anim.hold_2_cur_frame or 0
					anim.hold_2_cur_frame = anim.hold_2_cur_frame + 1
					if anim.hold_2_cur_frame >= anim.temp_hold_2 then
						anim.hold_2_cur_frame = nil
						anim.soul_pos_pos = nil
						anim.held_frame = nil
						anim.temp_hold_2 = nil
						anim.other_cur_frame = 0
						anim.other_temp_hold = anim.temp_hold + (anim.fps * math.random(1,2))
					end
				end
			end,
			aij_floating_sprite_1 = function(anim, obj, loc)
				-- Runs every frame
				anim.temp_hold = anim.temp_hold or (anim.fps * math.random(3,6))
				anim.cur_frame = anim.cur_frame or 0 
				anim.cur_frame = anim.cur_frame + 1
				anim.held_frame = 19*(anim.frames_per_row or anim.frames)+15
				anim.special_frames = anim.special_frames or {
					{10,19}, {11,19}, {12,19}, {13,19}, {14,19}, 
				}
				if anim.cur_frame >= anim.temp_hold then
					if not anim.temp_hold_2 then
						anim.soul_pos_pos = anim.special_frames[math.random(1, #anim.special_frames)]
						anim.held_frame = anim.soul_pos_pos[2]*(anim.frames_per_row or anim.frames)+anim.soul_pos_pos[1]
					end
					anim.temp_hold_2 = anim.temp_hold_2 or math.random(1,3)
					anim.hold_2_cur_frame = anim.hold_2_cur_frame or 0
					anim.hold_2_cur_frame = anim.hold_2_cur_frame + 1
					if anim.hold_2_cur_frame >= anim.temp_hold_2 then
						anim.hold_2_cur_frame = nil
						anim.soul_pos_pos = nil
						anim.held_frame = 19*(anim.frames_per_row or anim.frames)+15
						anim.temp_hold_2 = nil
						anim.cur_frame = 0
						anim.temp_hold = anim.temp_hold or (anim.fps * math.random(3,6))
					end
				end
			end,
		},
    },
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
	config = {
		extra = {
			num1 = 23,
			num2 = 151,
			num3 = 11,
			effect = ''
		}
    },
  
    loc_vars = function(self, info_queue, card)
		local effects = {
			'mult',
			'chips',
			'xchips',
			'Xmult',
			'dollars'
		}
		if card.ability.extra.effect == '' then
			card.ability.extra.effect =  pseudorandom_element(effects, pseudoseed('baddata'))
		end
		local prefix = ' +'
		local colour = G.C.MULT
		local r_mults = {}
		local loc_mult = ' '..(localize('k_mult'))..' '
		if card.ability.extra.effect == 'mult' then
			for i = 0, card.ability.extra.num1 do
				r_mults[#r_mults+1] = tostring(i)
			end
		elseif card.ability.extra.effect == 'chips' then
			colour = G.C.CHIPS
			for i = 0, card.ability.extra.num2 do
				r_mults[#r_mults+1] = tostring(i)
			end
			loc_mult = (localize('k_aij_youve_got_mail_chip_text', 'extra_joker_dictionary'))..' '
		elseif card.ability.extra.effect == 'xchips' then
			prefix = ' X'
			colour = G.C.CHIPS
			for i = 1.0, card.ability.extra.num1 do
				r_mults[#r_mults+1] = tostring(i * 0.1)
			end
			loc_mult = (localize('k_aij_youve_got_mail_chip_text', 'extra_joker_dictionary'))..' '
		elseif card.ability.extra.effect == 'Xmult' then
			prefix = ' X'
			for i = 1.0, card.ability.extra.num1 do
				r_mults[#r_mults+1] = tostring(i * 0.1)
			end
		elseif card.ability.extra.effect == 'dollars' then
			prefix = ' '..localize('$')
			colour = G.C.MONEY
			for i = 0, card.ability.extra.num3 do
				r_mults[#r_mults+1] = tostring(i)
			end
			loc_mult = string.upper(string.sub(localize('k_aij_overdesigned_earn_prefix', 'extra_joker_dictionary'),1,1))..string.sub(localize('k_aij_overdesigned_earn_prefix', 'extra_joker_dictionary'),2)
		end
        return {
			main_start = card.ability.extra.effect == 'dollars' and {
				{n=G.UIT.O, config={object = DynaText({string = {
					{string = 'rand()', colour = G.C.JOKER_GREY},{string = "#@"..(G.deck and G.deck.cards[1] and G.deck.cards[#G.deck.cards].base.id or 11)..(G.deck and G.deck.cards[1] and G.deck.cards[#G.deck.cards].base.suit:sub(1,1) or 'D'), colour = colour},
					loc_mult, loc_mult, loc_mult, loc_mult, loc_mult, loc_mult, loc_mult, loc_mult, loc_mult, loc_mult, loc_mult, loc_mult, loc_mult},
				colours = {G.C.UI.TEXT_DARK},pop_in_rate = 9999999, silent = true, random_element = true, pop_delay = 0.2011, scale = 0.32, min_cycle_time = 0})}},
				{n=G.UIT.T, config={text = prefix,colour = colour, scale = 0.32}},
				{n=G.UIT.O, config={object = DynaText({string = r_mults, colours = {colour},pop_in_rate = 9999999, silent = true, random_element = true, pop_delay = 0.5, scale = 0.32, min_cycle_time = 0})}},
			} or {
				{n=G.UIT.T, config={text = prefix,colour = colour, scale = 0.32}},
				{n=G.UIT.O, config={object = DynaText({string = r_mults, colours = {colour},pop_in_rate = 9999999, silent = true, random_element = true, pop_delay = 0.5, scale = 0.32, min_cycle_time = 0})}},
				{n=G.UIT.O, config={object = DynaText({string = {
					{string = 'rand()', colour = G.C.JOKER_GREY},{string = "#@"..(G.deck and G.deck.cards[1] and G.deck.cards[#G.deck.cards].base.id or 11)..(G.deck and G.deck.cards[1] and G.deck.cards[#G.deck.cards].base.suit:sub(1,1) or 'D'), colour = colour},
					loc_mult, loc_mult, loc_mult, loc_mult, loc_mult, loc_mult, loc_mult, loc_mult, loc_mult, loc_mult, loc_mult, loc_mult, loc_mult},
				colours = {G.C.UI.TEXT_DARK},pop_in_rate = 9999999, silent = true, random_element = true, pop_delay = 0.2011, scale = 0.32, min_cycle_time = 0})}},
			}
        }
    end,
  
    calculate = function(self, card, context)
        if context.joker_main then
			G.E_MANAGER:add_event(Event({
                func = function()
                    card.ability.extra.effect = ''
                    return true
                end
            }))
			if card.ability.extra.effect == 'mult' then
				return {
					mult = pseudorandom('baddata', 0, card.ability.extra.num1),
				}
			elseif card.ability.extra.effect == 'chips' then
				return {
					chips = pseudorandom('baddata', 0, card.ability.extra.num2),
				}
			elseif card.ability.extra.effect == 'xchips' then
				return {
					xchips = pseudorandom('baddata', 10, card.ability.extra.num1) * 0.1,
				}
			elseif card.ability.extra.effect == 'Xmult' then
				return {
					Xmult = pseudorandom('baddata', 10, card.ability.extra.num1) * 0.1,
				}
			elseif card.ability.extra.effect == 'dollars' then
				return {
					dollars = pseudorandom('baddata', 0, card.ability.extra.num3),
				}
			end
		end
    end,

    update = function(self, card, dt)
        if card and card.config then
            card:set_sprites(card.config.center)
        end
    end,
  
}
return { name = {"Jokers"}, items = {baddata} }