local silver_shader = {
  object_type = "Shader",
  key = 'silver',
  path = 'silver.fs',
}
SMODS.Sound {
  key = 'silver',
  path = 'glimmer.mp3'
}
local silver = {
  object_type = "Edition",
  key = 'silver',
  sound = {
    sound = 'aij_silver',
    per = 1,
    vol = 1
  },
  order = 1,
  config = { mult = 1.5, prevmult = "1.5" },
  loc_vars = function(self, info_queue, card)
    return { vars = { (card.edition or {}).mult or self.config.mult } }
  end,
  on_apply = function(card)
    if not card.ability.jest_silver_active then
      if card.ability.set == 'Enhanced' or card.ability.set == 'Default' then
        if card.added_to_deck then
          card:remove_from_deck(true)
          card.added_to_deck = true
        end
        jest_ability_calculate(
          card,
          "*", card.edition.mult,
          { h_x_chips = 1, Xmult = 1, x_chips = 1, x_mult = 1, extra_value = true },
          nil, true, false, "ability"
        )
        if card.added_to_deck then
          card.added_to_deck = false
          card:add_to_deck(true)
        end
      elseif card.ability.set == 'Joker' and (card.config.center.dongtong_compat == nil or card.config.center.dongtong_compat) then
        if card.added_to_deck then
          card:remove_from_deck(true)
          card.added_to_deck = true
        end
        jest_ability_calculate(
          card,
          "*", card.edition.mult,
          { x_chips = 1, x_mult = 1, extra_value = true, rarity = true },
          nil, true, false, "ability.extra"
        )
        if card.added_to_deck then
          card.added_to_deck = false
          card:add_to_deck(true)
        end
      end
    end
    card.ability.jest_silver_active = true
  end,
  on_remove = function(card)
    if card.ability.set == 'Enhanced' or card.ability.set == 'Default' then
      if card.added_to_deck then
        card:remove_from_deck(true)
        card.added_to_deck = true
      end
      jest_ability_calculate(
        card,
        "/", card.edition.mult,
        { h_x_chips = 1, Xmult = 1, x_chips = 1, x_mult = 1, extra_value = true },
        nil, true, false, "ability"
      )
      if card.added_to_deck then
        card.added_to_deck = false
        card:add_to_deck(true)
      end
    elseif card.ability.set == 'Joker' and (card.config.center.dongtong_compat == nil or card.config.center.dongtong_compat) then
      if card.added_to_deck then
        card:remove_from_deck(true)
        card.added_to_deck = true
      end
      jest_ability_calculate(
        card,
        "/", card.edition.mult,
        { x_chips = 1, x_mult = 1, extra_value = true, rarity = true },
        nil, true, false, "ability.extra"
      )
      if card.added_to_deck then
        card.added_to_deck = false
        card:add_to_deck(true)
      end
    end
    card.ability.jest_silver_active = nil
  end,
  in_shop = true,
  weight = 3,
  extra_cost = 4,
  get_weight = function(self)
    return G.GAME.jest_fairy_edition_rate * self.weight
  end,

  shader = 'silver'
}

-- Reapply silver whenever the current multiplier changes
local aij_card_update_ref = Card.update
function Card:update(dt)
  local ref = aij_card_update_ref(self, dt)

  if self.edition and self.edition.aij_silver and (self.ability.set == 'Enhanced' or self.ability.set == 'Default' or self.ability.set == 'Joker') then
    if tonumber(self.edition.prevmult) ~= self.edition.mult then
      if self.ability.set == 'Enhanced' or self.ability.set == 'Default' then
        if self.added_to_deck then
          self:remove_from_deck(true)
          self.added_to_deck = true
        end
        jest_ability_calculate(
          self,
          "/", tonumber(self.edition.prevmult),
          { h_x_chips = 1, Xmult = 1, x_chips = 1, x_mult = 1, extra_value = true },
          nil, true, false, "ability"
        )
        jest_ability_calculate(
          self,
          "*", self.edition.mult,
          { h_x_chips = 1, Xmult = 1, x_chips = 1, x_mult = 1, extra_value = true },
          nil, true, false, "ability"
        )
        if self.added_to_deck then
          self.added_to_deck = false
          self:add_to_deck(true)
        end
      elseif self.ability.set == 'Joker' then
        if self.added_to_deck then
          self:remove_from_deck(true)
          self.added_to_deck = true
        end
        jest_ability_calculate(
          self,
          "/", tonumber(self.edition.prevmult),
          { x_chips = 1, x_mult = 1, extra_value = true, rarity = true },
          nil, true, false, "ability.extra"
        )
        jest_ability_calculate(
          self,
          "*", self.edition.mult,
          { x_chips = 1, x_mult = 1, extra_value = true, rarity = true },
          nil, true, false, "ability.extra"
        )
        if self.added_to_deck then
          self.added_to_deck = false
          self:add_to_deck(true)
        end
      end
      self.edition.prevmult = tostring(self.edition.mult)
    end
  end

  return ref
end

-- Setting a new ability will set base values without triggering silver's multiplication
-- We set prevmult to 1 to trigger the Card:update() routine
local aij_card_set_ability_ref = Card.set_ability
function Card:set_ability(center, initial, delay_sprites)
    local ret = aij_card_set_ability_ref(self, center, initial, delay_sprites)

    if self.edition and self.edition.aij_silver and self.ability.set == "Joker" then
        self.edition.prevmult = tostring(1)
    end

    return ret
end

return { name = "Editions", items = { silver, silver_shader } }
