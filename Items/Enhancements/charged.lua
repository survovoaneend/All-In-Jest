local charged = {
    object_type = "Enhancement",
    key = 'charged',
    atlas = 'enhancements_atlas',
     ignore = true,
    order = 2,
    pos = { x = 2, y = 0 },
    config = {
        
    },
    loc_vars = function(self, info_queue, card)
        local charged_text = 50
        local has_founding_father = false
        if G.jokers then
            for _, j in ipairs(G.jokers.cards or {}) do
                if j.config and j.config.center_key == "j_aij_founding_father" then
                has_founding_father = true
                break
                end
            end
        end
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
  if G.play and not self.ability.group_key then
    local applied = self.ability.jest_charged_applied or {}
    self.ability.jest_charged_applied = applied

    local current_count = 0
    if G.play.cards then
        for _, j in ipairs(G.play.cards) do
          if j.config and j.config.center == G.P_CENTERS["m_aij_charged"] then
            current_count = current_count + 1
          end
        end
        for _, j in ipairs(G.play.cards) do
          if j == self and self.config.center ~= G.P_CENTERS["m_aij_charged"] and self.config.center ~= G.P_CENTERS.c_base then
            if self.ability and self.ability.jest_charged_applied_h and self.ability.jest_charged_applied_h.m_aij_charged and self.ability.jest_charged_applied_h.m_aij_charged > 0 then
                local count_h = self.ability.jest_charged_applied_h.m_aij_charged
                self.ability.jest_charged_applied_h = nil

                for i = 1, count_h do
                    jest_ability_calculate(
                    self,
                    "/", 1.5,
                    { h_x_chips = 1, Xmult = 1, x_chips = 1, x_mult = 1, extra_value=true },
                    nil,   
                    true,  
                    false,    
                    "ability"  
                    )
                end
            end
            local prev_count = applied["m_aij_charged"] or 0
            local diff = current_count - prev_count

            if diff > 0 then
              for i = 1, diff do
                jest_ability_calculate(
                  self,
                  "*", 1.5,
                  { h_x_chips = 1, Xmult = 1, x_chips = 1, x_mult = 1, extra_value = true },
                  nil, true, false, "ability"
                )
              end
            elseif diff < 0 then
              for i = 1, -diff do
                jest_ability_calculate(
                  self,
                  "/", 1.5,
                  { h_x_chips = 1, Xmult = 1, x_chips = 1, x_mult = 1, extra_value = true },
                  nil, true, false, "ability"
                )
              end
            end

            applied["m_aij_charged"] = current_count
          end
        end
    end
  end
  if G.deck and not self.ability.group_key then
    if G.deck.cards then
        for _, j in ipairs(G.deck.cards) do
          if j == self then
              if self.ability and self.ability.jest_charged_applied_h and self.ability.jest_charged_applied_h.m_aij_charged and self.ability.jest_charged_applied_h.m_aij_charged > 0 then
                local count_h = self.ability.jest_charged_applied_h.m_aij_charged
                self.ability.jest_charged_applied_h = nil

                for i = 1, count_h do
                    jest_ability_calculate(
                    self,
                    "/", 1.5,
                    { h_x_chips = 1, Xmult = 1, x_chips = 1, x_mult = 1, extra_value=true },
                    nil,   
                    true,  
                    false,    
                    "ability"  
                    )
                end
              end
              if self.ability and self.ability.jest_charged_applied and self.ability.jest_charged_applied.m_aij_charged and self.ability.jest_charged_applied.m_aij_charged > 0 then
                local count_h = self.ability.jest_charged_applied.m_aij_charged
                self.ability.jest_charged_applied = nil

                for i = 1, count_h do
                    jest_ability_calculate(
                    self,
                    "/", 1.5,
                    { h_x_chips = 1, Xmult = 1, x_chips = 1, x_mult = 1, extra_value=true },
                    nil,   
                    true,  
                    false,    
                    "ability"  
                    )
                end
              end
          end
        end
    end
  end
  if G.hand and not self.ability.group_key then
    local applied = self.ability.jest_charged_applied_h or {}
    self.ability.jest_charged_applied_h = applied

    local current_count = 0
    if #G.hand.cards > 0 then
        for _, j in ipairs(G.hand.cards) do
          if j.config and j.config.center == G.P_CENTERS["m_aij_charged"] then
            current_count = current_count + 1
          end
        end
        for _, j in ipairs(G.hand.cards) do
          if j == self and self.config.center ~= G.P_CENTERS["m_aij_charged"] and self.config.center ~= G.P_CENTERS.c_base then
            local prev_count = applied["m_aij_charged"] or 0
            local diff = current_count - prev_count

            if diff > 0 then
              for i = 1, diff do
                jest_ability_calculate(
                  self,
                  "*", 1.5,
                  { h_x_chips = 1, Xmult = 1, x_chips = 1, x_mult = 1, extra_value = true },
                  nil, true, false, "edition"
                )
              end
            elseif diff < 0 then
              for i = 1, -diff do
                jest_ability_calculate(
                  self,
                  "/", 1.5,
                  { h_x_chips = 1, Xmult = 1, x_chips = 1, x_mult = 1, extra_value = true },
                  nil, true, false, "ability"
                )
              end
            end

            applied["m_aij_charged"] = current_count
          end
        end
    end
  end
  return ref
end
local set_ability_ref = Card.set_ability
function Card:set_ability(center, initial, delay_sprites)
  if self.ability and self.ability.jest_charged_applied_h and self.ability.jest_charged_applied_h.m_aij_charged and self.ability.jest_charged_applied_h.m_aij_charged > 0 then
    local count_h = self.ability.jest_charged_applied_h.m_aij_charged
    self.ability.jest_charged_applied_h = nil

    for i = 1, count_h do
        jest_ability_calculate(
        self,
        "/", 1.5,
        { h_x_chips = 1, Xmult = 1, x_chips = 1, x_mult = 1, extra_value=true },
        nil,   
        true,  
        false,    
        "ability"  
        )
    end
  end
  if self.ability and self.ability.jest_charged_applied and self.ability.jest_charged_applied.m_aij_charged and self.ability.jest_charged_applied.m_aij_charged > 0 then
    local count_h = self.ability.jest_charged_applied.m_aij_charged
    self.ability.jest_charged_applied = nil

    for i = 1, count_h do
        jest_ability_calculate(
        self,
        "/", 1.5,
        { h_x_chips = 1, Xmult = 1, x_chips = 1, x_mult = 1, extra_value=true },
        nil,   
        true,  
        false,    
        "ability"  
        )
    end
  end

  return set_ability_ref(self, center, initial, delay_sprites)
end

return {name = {"Enhancements"}, items = {charged}}