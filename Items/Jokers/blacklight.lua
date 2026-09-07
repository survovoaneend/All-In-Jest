local blacklight = {
    object_type = "Joker",
    order = 495,
    key = "blacklight",
    config = {
        extra = {
            hand_size = 3,
            prev_handsize = "0",
        }
    },
    attributes = { 'hand_size' },
    rarity = 2,
    pos = { x = 18, y = 21 },
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = false,
    perishable_compat = true,
    all_in_jest = {
        animate_func = function(dt, anim, obj, loc, key)
			if G.GAME and G.GAME.round_resets and G.GAME.round_resets.ante then
                anim.flicker_frame = anim.flicker_frame or 0
                anim.flicker_frame = anim.flicker_frame == 0 and 1 or 0
                if (G.GAME.round_resets.ante % 2) == 0 and math.random(1, 200) == 15 then G.GAME.blacklight_should_flicker = true end
                if G.GAME.blacklight_should_flicker and G.GAME.all_in_jest then
                    G.GAME.all_in_jest.AIJAnimated[key].frames = 20
                    G.GAME.all_in_jest.AIJAnimated[key].fps = pseudorandom('jest_blacklight_fps', 2, 10)
                    if not anim.ot then anim.ot = 0 end
                    anim.ot = anim.ot + dt
                    local ran_val = pseudorandom('jest_blacklight', 15, 25)
                    if anim.ot > 1/ran_val then
                        anim.ot = anim.ot - 1/ran_val
                        G.GAME.blacklight_should_flicker = nil
                    end
                    return (loc+anim.flicker_frame)%(anim.frames_per_row or anim.frames), math.floor((loc+anim.flicker_frame)/(anim.frames_per_row or anim.frames))
                elseif G.GAME.all_in_jest then
                    G.GAME.all_in_jest.AIJAnimated[key].frames = 19
                end
				if (G.GAME.round_resets.ante % 2) == 1 then
					return (loc+1)%(anim.frames_per_row or anim.frames), math.floor((loc+1)/(anim.frames_per_row or anim.frames))
				end
			end
			return loc%(anim.frames_per_row or anim.frames), math.floor(loc/(anim.frames_per_row or anim.frames))
		end,
    },

    loc_vars = function(self, info_queue, card)
        local handsize = 0
        if (G.GAME.round_resets.ante % 2) == 0 then
            handsize = handsize + card.ability.extra.hand_size
        end
        return {
            vars = {
                card.ability.extra.hand_size,
                handsize,
            }
        }
    end,

    add_to_deck = function(self, card, from_debuff)
        G.hand:change_size(tonumber(card.ability.extra.prev_handsize))
    end,

    update = function(self, card, dt)
        if G.GAME and G.GAME.round_resets.ante and G.hand then
            local has_card = false
            if next(SMODS.find_card("j_aij_blacklight")) then
                for k, v in pairs(SMODS.find_card("j_aij_blacklight")) do
                    if v == card then
                        has_card = true
                    end
                end
            end
            if has_card then
                local handsize = 0
                if (G.GAME.round_resets.ante % 2) == 0 then
                    handsize = handsize + card.ability.extra.hand_size
                end
                card.ability.extra.prev_handsize = tostring(tonumber(card.ability.extra.prev_handsize) or 0)
                if handsize ~= prev_handsize then
                    G.hand:change_size(handsize - tonumber(card.ability.extra.prev_handsize))
                    card.ability.extra.prev_handsize = tostring(handsize)
                end
            end
        end
    end,
    
    remove_from_deck = function(self, card, from_debuff)
        G.hand:change_size(-tonumber(card.ability.extra.prev_handsize))
    end,
}

return { name = { "Jokers" }, items = { blacklight } }
