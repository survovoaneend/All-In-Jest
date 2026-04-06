local recherche_doubled = {
  object_type = "Sticker",
  key = "recherche_doubled",
	no_collection = true,
  needs_enable_flag = false,
  rate = 0,
	config = { 
    mult = "2", -- Make a string to be unaffected by dongtong/silver
    prevmult = "2"
  },
	atlas = "stickers_atlas",
	order = 3,
	pos = {x = 1, y = 0},
	badge_colour = HEX('FD5F55'),
  sets = { Joker = true },
  should_apply = function(self, card, center, area, bypass_reroll)
      -- Reusing unusual sticker code since its the exact same
      return SMODS.Stickers["aij_unusual_doubled"].should_apply(self, card, center, area, bypass_reroll)
  end,
  apply = function(self, card, val)
      -- Reusing unusual sticker code since its the exact same
      return SMODS.Stickers["aij_unusual_doubled"].apply(self, card, val)
  end,
	loc_vars = function(self, info_queue, card)
		return { vars = {}}
	end,
}

-- Reapply doubled whenever the current multiplier changes (currently should never happen)
local aij_card_update_ref = Card.update
function Card:update(dt)
  local ref = aij_card_update_ref(self, dt)

  if self.ability and self.ability.aij_recherche_doubled and (self.ability.set == 'Joker') then
    if self.ability.aij_recherche_doubled.prevmult ~= self.ability.aij_recherche_doubled.mult then
      if self.ability.set == 'Joker' then
        if self.added_to_deck then
          self:remove_from_deck(true)
          self.added_to_deck = true
        end
        jest_ability_calculate(
          self,
          "/", tonumber(self.ability.aij_recherche_doubled.prevmult),
          { x_chips = 1, x_mult = 1, extra_value = true, rarity = true },
          nil, true, nil, "ability"
        )
        jest_ability_calculate(
          self,
          "*", tonumber(self.ability.aij_recherche_doubled.mult),
          { x_chips = 1, x_mult = 1, extra_value = true, rarity = true },
          nil, true, nil, "ability"
        )
        if self.added_to_deck then
          self.added_to_deck = false
          self:add_to_deck(true)
        end
      end
      self.ability.aij_recherche_doubled.prevmult = self.ability.aij_recherche_doubled.mult
    end
  end

  return ref
end

-- Setting a new ability will set base values without triggering the recherche tag's multiplication
-- We set prevmult to 1 to trigger the Card:update() routine
local aij_card_set_ability_ref = Card.set_ability
function Card:set_ability(center, initial, delay_sprites)
    local ret = aij_card_set_ability_ref(self, center, initial, delay_sprites)

    if self.ability and self.ability.aij_recherche_doubled and self.ability.set == "Joker" then
        self.ability.aij_recherche_doubled.prevmult = tostring(1)
    end

    return ret
end

return {name = {"Stickers"}, items = {recherche_doubled}}