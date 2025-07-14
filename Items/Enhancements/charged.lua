local charged = {
    object_type = "Enhancement",
    key = 'charged',
    atlas = 'enhancements_atlas',
    
    order = 2,
    pos = { x = 2, y = 0 },
    config = {
        
    },
    loc_vars = function(self, info_queue, card)
        local charged_text
        local has_founding_father = next(SMODS.find_card("j_aij_founding_father"))
        if has_founding_father then
            charged_text = 100
        else
            charged_text = 50
        end
        return { vars = {charged_text} }
    end,
    calculate = function(self, card, context)
        -- There isn't even any code here T_T
    end
}
local updateref = Card.update
function Card:update(dt)
  local ref = updateref(self, dt)
  if self.config.center == G.P_CENTERS["m_aij_charged"]
  or self.config.center == G.P_CENTERS.c_base then
    return ref
  end

  local current_count = 0
  if self.area == G.play and G.play then
    for _, c in ipairs(G.play.cards) do
      if c.config and c.config.center == G.P_CENTERS["m_aij_charged"] and not c.debuff then
        current_count = current_count + 1
      end
    end
  end
  if self.area == G.hand and G.hand then
    local is_highlighted = {}
    for _, c in ipairs(G.hand.highlighted) do
      is_highlighted[c] = true
    end
    local self_is_highlighted = is_highlighted[self]

    for _, c in ipairs(G.hand.cards) do
      if c.config and c.config.center == G.P_CENTERS["m_aij_charged"] and not c.debuff then
        if is_highlighted[c] == self_is_highlighted then
          current_count = current_count + 1
        end
      end
    end
  end

  local applied = self.ability.jest_charged_applied or {}
  self.ability.jest_charged_applied = applied
  local prev_factor = applied.factor or 1
  local has_founding_father = next(SMODS.find_card("j_aij_founding_father"))
  local b = (has_founding_father and 1 or 0.5) -- base of exponential
  local factor = 1 + (b*current_count)
  local diff = factor/prev_factor
  -- NOTE concern about imprecision
  if diff ~= 1 then
    jest_ability_calculate(
      self,
      "*", diff,
      { h_x_chips = 1, Xmult = 1, x_chips = 1, x_mult = 1, extra_value=true },
      nil, true, false, "ability"
    )
    applied.factor = factor
  end
  return ref
end

return {name = {"Enhancements"}, items = {charged}}