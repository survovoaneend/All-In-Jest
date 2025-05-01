local pace = {
    object_type = "Joker",
    order = 268,

    key = "pace",
    config = {
      
    },
    rarity = 4,
		unlock_condition = {hidden = true},
    pos = { x = 2, y = 4},
    atlas = 'legendary_atlas',
    cost = 20,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,
    soul_pos = { x = 2, y = 5},
  
    loc_vars = function(self, info_queue, card)
  
    end,
}
local updateref = Card.update
function Card:update(dt)
  local ref = updateref(self, dt)
  if G.jokers and self.ability.set == 'Joker' then
    if self.config.center.rarity ~= 1 then
        self.ability.jest_real_rarity = tostring(self.config.center.rarity)
    else
        self.ability.jest_real_rarity = tostring(self.ability.jest_real_rarity or 1)
    end

    local has_pace = false
    if G.jokers.cards then
      for _, j in ipairs(G.jokers.cards) do
        if j.config and j.config.center_key == "j_aij_pace" then
          has_pace = true
        end
      end
    end
    
    if has_pace and (self.ability.jest_real_rarity == "2" or self.ability.jest_real_rarity == "3") then
        self.config.center.rarity = 1
    else
        if self.config.center.rarity ~= tonumber(self.ability.jest_real_rarity) then
            self.config.center.rarity = tonumber(self.ability.jest_real_rarity)
        end
    end
  end
  return ref
end
return { name = {"Jokers"}, items = {pace} }
