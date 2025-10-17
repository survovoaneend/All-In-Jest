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
    config = { extra = { mult = 1.5, pervmult = "1.5" } },
    loc_vars = function(self, info_queue, card)
        return {vars = {(card.edition or {}).mult or self.config.mult}}
    end,
    on_apply = function(card)
        if not card.ability.jest_siliver_active then
            if card.ability.set == 'Enhanced' or card.ability.set == 'Default' then
                jest_ability_calculate(
                    card,
                    "*", card.edition.extra.mult,
                    { h_x_chips = 1, Xmult = 1, x_chips = 1, x_mult = 1, extra_value=true },
                    nil, true, false, "ability"
                )
            elseif card.ability.set == 'Joker' then
                jest_ability_calculate(
                    card,
                    "*", card.edition.extra.mult,
                    { x_chips = 1, x_mult = 1, xmult = 1, extra_value = true, rarity },
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
              "/", card.edition.extra.mult,
              { h_x_chips = 1, Xmult = 1, x_chips = 1, x_mult = 1, extra_value=true },
              nil, true, false, "ability"
            )
        elseif card.ability.set == 'Joker' and (card.config.center.dongtong_compat == nil or card.config.center.dongtong_compat) then
            jest_ability_calculate(
                card,
                "/", card.edition.extra.mult,
                { x_chips = 1, x_mult = 1, xmult = 1, extra_value = true, rarity },
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
	  if tonumber(self.edition.extra.pervmult) ~= self.edition.extra.mult then
          if self.ability.set == 'Enhanced' or self.ability.set == 'Default' then
              jest_ability_calculate(
                self,
                "/", tonumber(self.edition.extra.pervmult),
                { h_x_chips = 1, Xmult = 1, x_chips = 1, x_mult = 1, extra_value=true },
                nil, true, false, "ability"
              )
              jest_ability_calculate(
                self,
                "*", self.edition.extra.mult,
                { h_x_chips = 1, Xmult = 1, x_chips = 1, x_mult = 1, extra_value=true },
                nil, true, false, "ability"
              )
          elseif self.ability.set == 'Joker' then
              jest_ability_calculate(
                self,
                "/", tonumber(self.edition.extra.pervmult),
                { x_chips = 1, x_mult = 1, extra_value = true, rarity },
                nil, true, "ability.extra"
              )
              jest_ability_calculate(
                self,
                "*", self.edition.extra.mult,
                { x_chips = 1, x_mult = 1, extra_value = true, rarity },
                nil, true, "ability.extra"
              )
          end
          self.edition.extra.pervmult = tostring(self.edition.extra.mult)
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