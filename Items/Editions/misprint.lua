local misprint_shader = {
    object_type = "Shader",
    key = 'misprint', 
    path = 'misprint.fs',
    send_vars = function(sprite, card)
        local temp = nil
        if card.children and card.children.center and card.children.center.scale then
            temp = card.children.center.scale.x
        end
        return {
            card_x = temp,
        }
    end
}
SMODS.Sound {
  key = 'misprint',
  path = 'glimmer.mp3'
}
local misprint = {
    object_type = "Edition",
    key = 'misprint', 
    sound = {
        sound = 'aij_misprint',
        per = 1,
        vol = 1
    },
    order = 3,
    config = { min_mult = 50, max_mult = 300, mult = 1, prevmult = "1" },
    disable_base_shader = true,
    loc_vars = function(self, info_queue, card)
        return { vars = { ((card.edition or {}).max_mult or self.config.max_mult) * 0.01, ((card.edition or {}).min_mult or self.config.min_mult) * 0.01 } }
    end,
    on_apply = function(card)
        if not card.ability.jest_misprint_active then
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
        card.ability.jest_misprint_active = true
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
        card.ability.jest_misprint_active = nil
    end,
    calculate = function(self, card, context)
        function aij_precision_fix(card, x) --hopefully fixes precision
            local n = 4
            local snapped = (x >= 0 and math.floor(x * n + 0.5) or math.ceil(x * n - 0.5)) / n

            if snapped < (card.edition.min_mult * 0.01) then return (card.edition.min_mult * 0.01) end
            if snapped > (card.edition.max_mult * 0.01) then return (card.edition.max_mult * 0.01) end
            return snapped
        end
		if context.before then --context.after causes problems
            local value = pseudorandom('jest_misprint_mult', card.edition.min_mult, card.edition.max_mult) * 0.01
            card.edition.mult = aij_precision_fix(card, value)
        end
        if context.after then
            local string = tostring(card, card.edition.mult).."%"
            return {
                message = string,
            }
		end
	end,

    in_shop = true,
    weight = 3,
    extra_cost = 4,
    get_weight = function(self)
        return self.weight
    end,

    shader = 'misprint'
}

-- Reapply misprint whenever the current multiplier changes
local aij_card_update_ref = Card.update
function Card:update(dt)
  local ref = aij_card_update_ref(self, dt)

  if self.edition and self.edition.aij_misprint and (self.ability.set == 'Enhanced' or self.ability.set == 'Default' or self.ability.set == 'Joker') then
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

-- Setting a new ability will set base values without triggering misprint's multiplication
-- We set prevmult to 1 to trigger the Card:update() routine
local aij_card_set_ability_ref = Card.set_ability
function Card:set_ability(center, initial, delay_sprites)
    local ret = aij_card_set_ability_ref(self, center, initial, delay_sprites)

    if self.edition and self.edition.aij_misprint and self.ability.set == "Joker" then
        self.edition.prevmult = tostring(1)
    end

    return ret
end

return {name = "Editions", items = {misprint, misprint_shader}}