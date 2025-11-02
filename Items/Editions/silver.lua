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
  config = { mult = 1.5, pervmult = "1.5" },
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
          { x_chips = 1, x_mult = 1, xmult = 1, extra_value = true, rarity = true, jest_applied = true },
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
        { x_chips = 1, x_mult = 1, xmult = 1, extra_value = true, rarity = true, jest_applied = true },
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
local updateref = Card.update
function Card:update(dt)
  local ref = updateref(self, dt)

  if self.edition and self.edition.aij_silver and (self.ability.set == 'Enhanced' or self.ability.set == 'Default' or self.ability.set == 'Joker') then
    if tonumber(self.edition.pervmult) ~= self.edition.mult then
      if self.ability.set == 'Enhanced' or self.ability.set == 'Default' then
        if self.added_to_deck then
          self:remove_from_deck(true)
          self.added_to_deck = true
        end
        jest_ability_calculate(
          self,
          "/", tonumber(self.edition.pervmult),
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
          "/", tonumber(self.edition.pervmult),
          { x_chips = 1, x_mult = 1, extra_value = true, rarity = true, jest_applied = true },
          nil, true, false, "ability.extra"
        )
        jest_ability_calculate(
          self,
          "*", self.edition.mult,
          { x_chips = 1, x_mult = 1, extra_value = true, rarity = true, jest_applied = true },
          nil, true, false, "ability.extra"
        )
        if self.added_to_deck then
          self.added_to_deck = false
          self:add_to_deck(true)
        end
      end
      self.edition.pervmult = tostring(self.edition.mult)
    end
  end

  return ref
end

if JokerDisplay then
    local jd_edition_def = JokerDisplay.Edition_Definitions

    jd_edition_def["e_aij_silver"] = {
        condition_function = function(card)
            local edition = card.edition
            return not card.debuff and edition and card.edition.key and card.edition.key == "e_aij_silver"
        end,
        mod_function = function(card)
            
            return { }
        end
    }
end

return {name = "Editions", items = {silver, silver_shader}}
