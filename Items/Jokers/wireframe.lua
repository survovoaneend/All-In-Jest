local wireframe = {
  object_type = "Joker",
  order = 52,

  key = "wireframe",
  config = { },
  rarity = 3,
  pos = { x = 5, y = 17 },
  soul_pos = {
    x = 23,
    y = 1,
    draw = function(sprite, scale_mod, rotate_mod)
      sprite.hover_tilt = sprite.hover_tilt * 1.5
      sprite.children.floating_sprite:draw_shader('hologram', nil, sprite.ARGS.send_to_shader, nil, sprite.children.center, 2 * scale_mod, 2 * rotate_mod)
      sprite.hover_tilt = sprite.hover_tilt / 1.5
    end
  },
  atlas = 'joker_atlas',
  cost = 8,
  unlocked = true,
  discovered = false,
  blueprint_compat = false,
  eternal_compat = true,

  loc_vars = function(self, info_queue, card)

  end,

  calculate = function(self, card, context)
    if context.first_hand_drawn then
        local eval = function() return G.GAME.current_round.hands_played == 0 end
        juice_card_until(card, eval, true)
    end
    if context.after and G.GAME.current_round.hands_played == 0 then
			return {
        message = "Return!"
			}
    end
		if context.aij_discard_played_hand and G.GAME.current_round.hands_played == 0 then
			return {
				aij_return_to_hand = true
			}
		end
  end

}
return { name = { "Jokers" }, items = { wireframe } }
