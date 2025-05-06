local pace = {
    object_type = "Joker",
    order = 1023,

    key = "pace",
    config = {
      
    },
    rarity = 4,
	unlock_condition = {hidden = true},
    pos = { x = 2, y = 4},
    atlas = 'legendary_atlas',
    cost = 20,
    unlocked = false,
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
    if self.ability.jest_real_rarity == nil then
      local r = self.config.center.rarity
      self.ability.jest_real_rarity = type(r) == "number" and tostring(r) or r
    end

    local has_pace = false
    for _, j in ipairs(G.jokers.cards or {}) do
      if j.config and j.config.center_key == "j_aij_pace" then
        has_pace = true
        break
      end
    end

    if has_pace then
      local orig = self.ability.jest_real_rarity
      if orig == "2" or orig == "3" or orig == "Uncommon" or orig == "Rare" then
        self.config.center.rarity = 1
      end
    else
      local orig = self.ability.jest_real_rarity
      local num = tonumber(orig)
      if num then
        self.config.center.rarity = num
      else
        self.config.center.rarity = orig
      end

      self.ability.jest_real_rarity = nil
    end
  end

  return ref
end

return { name = {"Jokers"}, items = {pace} }
