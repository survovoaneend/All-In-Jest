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
        return {vars = {card.edition.mult}}
    end,
    on_apply = function(card)
        if not card.ability.jest_siliver_active then
            if card.ability.set == 'Enhanced' or card.ability.set == 'Default' then
                jest_ability_calculate(
                    card,
                    "*", card.edition.mult,
                    { h_x_chips = 1, Xmult = 1, x_chips = 1, x_mult = 1, extra_value=true },
                    nil, true, false, "ability"
                )
            elseif card.ability.set == 'Joker' then
                jest_ability_calculate(
                    card,
                    "*", card.edition.mult,
                    { x_chips = 1, x_mult = 1, extra_value = true, rarity },
                    nil, true, "ability.extra"
                )
            end
        end
        card.ability.jest_siliver_active = true
    end,
    on_remove = function(card)
        if card.ability.set == 'Enhanced' or card.ability.set == 'Default' then
            jest_ability_calculate(
              card,
              "/", card.edition.mult,
              { h_x_chips = 1, Xmult = 1, x_chips = 1, x_mult = 1, extra_value=true },
              nil, true, false, "ability"
            )
        elseif card.ability.set == 'Joker' then
            jest_ability_calculate(
                card,
                "/", card.edition.mult,
                { x_chips = 1, x_mult = 1, extra_value = true, rarity },
                nil, true, "ability.extra"
            )
        end
        card.ability.jest_siliver_active = nil
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
              jest_ability_calculate(
                self,
                "/", tonumber(self.edition.pervmult),
                { h_x_chips = 1, Xmult = 1, x_chips = 1, x_mult = 1, extra_value=true },
                nil, true, false, "ability"
              )
              jest_ability_calculate(
                self,
                "*", self.edition.mult,
                { h_x_chips = 1, Xmult = 1, x_chips = 1, x_mult = 1, extra_value=true },
                nil, true, false, "ability"
              )
          elseif self.ability.set == 'Joker' then
              jest_ability_calculate(
                self,
                "/", tonumber(self.edition.pervmult),
                { x_chips = 1, x_mult = 1, extra_value = true, rarity },
                nil, true, "ability.extra"
              )
              jest_ability_calculate(
                self,
                "*", self.edition.mult,
                { x_chips = 1, x_mult = 1, extra_value = true, rarity },
                nil, true, "ability.extra"
              )
          end
          self.edition.pervmult = tostring(self.edition.mult)
      end
  end

  return ref
end
return {name = "Editions", items = {silver, silver_shader}}