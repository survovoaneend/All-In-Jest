local silver_shader = {
  object_type = "Shader",
  key = 'silver',
  path = 'silver.fs',
}
SMODS.Sound {
  key = 'silver',
  path = 'silver.mp3'
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
  config = { extra = 0.5, prevextra = "0.5" },
  loc_vars = function(self, info_queue, card)
     local current_extra = (card and card.edition and card.edition.extra) or self.config.extra
     return { vars = { 1 + current_extra } } 
  end,
  on_apply = function(card)
    if not card.ability.jest_silver_active then
      local multiplier = 1 + card.edition.extra
      if card.ability.set == 'Enhanced' or card.ability.set == 'Default' then
        if card.added_to_deck then
          card:remove_from_deck(true)
          card.added_to_deck = true
        end
        jest_ability_calculate(
          card,
          "*", multiplier,
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
          "*", multiplier,
          { x_chips = 1, x_mult = 1, extra_value = true, rarity = true },
          nil, true, false, "ability"
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
    local multiplier = 1 + card.edition.extra
    if card.ability.set == 'Enhanced' or card.ability.set == 'Default' then
      if card.added_to_deck then
        card:remove_from_deck(true)
        card.added_to_deck = true
      end
      jest_ability_calculate(
        card,
        "/",  multiplier,
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
        "/", multiplier,
        { x_chips = 1, x_mult = 1, extra_value = true, rarity = true },
        nil, true, false, "ability"
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
    if tonumber(self.edition.prevextra) ~= self.edition.extra then
      
      local old_multiplier = 1 + tonumber(self.edition.prevextra)
      local new_multiplier = 1 + self.edition.extra

      if self.ability.set == 'Enhanced' or self.ability.set == 'Default' then
        if self.added_to_deck then
          self:remove_from_deck(true)
          self.added_to_deck = true
        end
        -- Divide by the old multiplier...
        jest_ability_calculate(
          self,
          "/", old_multiplier,
          { h_x_chips = 1, Xmult = 1, x_chips = 1, x_mult = 1, extra_value = true },
          nil, true, false, "ability"
        )
        -- ...and multiply by the new multiplier
        jest_ability_calculate(
          self,
          "*", new_multiplier,
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
        -- Divide by the old multiplier...
        jest_ability_calculate(
          self,
          "/", old_multiplier,
          { x_chips = 1, x_mult = 1, extra_value = true, rarity = true },
          nil, true, false, "ability"
        )
        -- ...and multiply by the new multiplier
        jest_ability_calculate(
          self,
          "*", new_multiplier,
          { x_chips = 1, x_mult = 1, extra_value = true, rarity = true },
          nil, true, false, "ability"
        )
        if self.added_to_deck then
          self.added_to_deck = false
          self:add_to_deck(true)
        end
      end
      self.edition.prevextra = tostring(self.edition.extra)
    end
  end

  return ref
end

-- Setting a new ability will set base values without triggering silver's multiplication
-- We set prevextra to 0 to trigger the Card:update() routine 
local aij_card_set_ability_ref = Card.set_ability
function Card:set_ability(center, initial, delay_sprites)
    local ret = aij_card_set_ability_ref(self, center, initial, delay_sprites)

    if self.edition and self.edition.aij_silver and self.ability.set == "Joker" then
        self.edition.prevextra = tostring(0)
    end

    return ret
end

return { name = "Editions", items = { silver, silver_shader } }
