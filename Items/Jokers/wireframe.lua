local wireframe = {
  object_type = "Joker",
  order = 52,

  key = "wireframe",
  config = {
    extra = {
      trigger = false,
      all_in_jest = {
        to_hand = {
          cards = nil
        }
      }
    }
  },
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
      card.ability.extra.trigger = true
    end
    if context.joker_main and context.full_hand and card.ability.extra.trigger then
      card.ability.extra.all_in_jest.to_hand.cards = context.full_hand
      card.ability.extra.trigger = false
    end
    if context.all_in_jest and context.all_in_jest.drew_cards then
      card.ability.extra.all_in_jest.to_hand.cards = nil
    end
  end

}
return { name = { "Jokers" }, items = { wireframe } }
