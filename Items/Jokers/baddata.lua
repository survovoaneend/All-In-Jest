local baddata = {
    object_type = "Joker",
    order = 412,
    key = "baddata",
    config = {
    },
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
  
    loc_vars = function(self, info_queue, card)
		local chars = "abcdefghijklmnopqrstuvwxyz" ..
              "ABCDEFGHIJKLMNOPQRSTUVWXYZ" ..
              "0123456789" ..
              "!@#$%^&*()-_=+[]{};:,.<>?/|"

		local result = {}
		local how_many = 20

		for n = 1, how_many do
			local s = {}
			for i = 1, 9 do
				local index = math.random(#chars)
				s[#s+1] = string.sub(chars, index, index)
			end
			result[#result+1] = table.concat(s)
		end
        return {main_start =
        {{n = G.UIT.R, config = {align = "cm"}, nodes = {
            {n = G.UIT.C, config = {align = "cm", padding = 0.02}, nodes = {
                {n = G.UIT.O, config = {object = DynaText({string = result, colours = {G.C.L_BLACK}, random_element = true, pop_in_rate = 9999999, silent = true, pop_delay = 0.2, scale = 0.32, min_cycle_time = 0})}},
            }}
        }}}
        }
    end,
  
    calculate = function(self, card, context)
		local effect = math.random(1,5)
        if context.joker_main then
			if effect == 1 then
				return {
					mult = math.random(0,23),
				}
			elseif effect == 2 then
				return {
					chips = math.random(0,151),
				}
			elseif effect == 3 then
				return {
					xchips = math.random(10,23) * 0.1,
				}
			elseif effect == 4 then
				return {
					Xmult = math.random(10,23) * 0.1,
				}
			elseif effect == 5 then
				return {
					dollars = math.random(0,11),
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