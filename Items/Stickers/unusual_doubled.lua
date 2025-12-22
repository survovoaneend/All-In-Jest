local function contains_number(table, exclusions)
    for k, v in pairs(table) do
        if exclusions and exclusions[k] ~= nil and (exclusions[k] == true or exclusions[k] == v) then
        else
            if type(v) == "number" and v ~= 0 then
                return true
            elseif type(v) == "table" then
                return contains_number(v)
            end
        end
    end
    return false
end

local unusual_doubled = {
  object_type = "Sticker",
  key = "unusual_doubled",
	no_collection = true,
  needs_enable_flag = false,
  rate = 0,
	config = { 
    mult = "2", -- Make a string to be unaffected by dongtong/silver
    prevmult = "2"
  },
	atlas = "stickers_atlas",
	order = 2,
	pos = {x = 2, y = 0},
	badge_colour = HEX('55A383'),
  sets = { Joker = true },
  should_apply = function(self, card, center, area, bypass_reroll)
      local default_check = SMODS.Sticker.should_apply(self, card, center, area, bypass_reroll)
      return default_check and (center.dongtong_compat == nil or center.dongtong_compat) and contains_number(center.config, { x_chips = 1, x_mult = 1, extra_value = true, rarity = true, odds = true, chance = true })
  end,
  apply = function(self, card, val)
    if val and not card.ability[self.key] then
      sendDebugMessage("unusual_sticker_" .. card.config.center.key, "AIJ")
      SMODS.Sticker.apply(self, card, val)
      -- card.ability[self.key] = {mult = 2, prevmult = "2"}
      if card.added_to_deck then
        card:remove_from_deck(true)
        card.added_to_deck = true
      end
      jest_ability_calculate(
        card,
        "*", tonumber(card.ability[self.key].mult),
        { x_chips = 1, x_mult = 1, extra_value = true, rarity = true },
        nil, true, false, "ability.extra"
      )
      if card.added_to_deck then
        card.added_to_deck = false
        card:add_to_deck(true)
      end
    end
    if not val then
      if card.added_to_deck then
        card:remove_from_deck(true)
        card.added_to_deck = true
      end
      jest_ability_calculate(
        card,
        "/", tonumber(card.ability[self.key].mult),
        { x_chips = 1, x_mult = 1, extra_value = true, rarity = true },
        nil, true, false, "ability.extra"
      )
      if card.added_to_deck then
        card.added_to_deck = false
        card:add_to_deck(true)
      end
      SMODS.Sticker.apply(self, card, val)
    end
  end,
	loc_vars = function(self, info_queue, card)
		return { vars = {}}
	end,
}

-- Reapply doubled whenever the current multiplier changes (currently should never happen)
local aij_card_update_ref = Card.update
function Card:update(dt)
  local ref = aij_card_update_ref(self, dt)

  if self.ability and self.ability.aij_unusual_doubled and (self.ability.set == 'Joker') then
    if self.ability.aij_unusual_doubled.prevmult ~= self.ability.aij_unusual_doubled.mult then
      if self.ability.set == 'Joker' then
        if self.added_to_deck then
          self:remove_from_deck(true)
          self.added_to_deck = true
        end
        jest_ability_calculate(
          self,
          "/", tonumber(self.ability.aij_unusual_doubled.prevmult),
          { x_chips = 1, x_mult = 1, extra_value = true, rarity = true },
          nil, true, false, "ability.extra"
        )
        jest_ability_calculate(
          self,
          "*", tonumber(self.ability.aij_unusual_doubled.mult),
          { x_chips = 1, x_mult = 1, extra_value = true, rarity = true },
          nil, true, false, "ability.extra"
        )
        if self.added_to_deck then
          self.added_to_deck = false
          self:add_to_deck(true)
        end
      end
      self.ability.aij_unusual_doubled.prevmult = self.ability.aij_unusual_doubled.mult
    end
  end

  return ref
end

-- Setting a new ability will set base values without triggering the unusual tag's multiplication
-- We set prevmult to 1 to trigger the Card:update() routine
local aij_card_set_ability_ref = Card.set_ability
function Card:set_ability(center, initial, delay_sprites)
    local ret = aij_card_set_ability_ref(self, center, initial, delay_sprites)

    if self.ability and self.ability.aij_unusual_doubled and self.ability.set == "Joker" then
        self.ability.aij_unusual_doubled.prevmult = tostring(1)
    end

    return ret
end

return {name = {"Stickers"}, items = {unusual_doubled}}