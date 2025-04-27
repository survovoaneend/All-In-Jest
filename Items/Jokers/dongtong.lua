local dongtong = {
    object_type = "Joker",
    order = 302,

    key = "dongtong",
    config = {
      
    },
    rarity = 4,
    pos = { x = 6, y = 10},
    atlas = 'legendary_atlas',
    cost = 4,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,
    soul_pos = { x = 6, y = 11},
  
    loc_vars = function(self, info_queue, card)
  
    end,
}
local updateref = Card.update
function Card:update(dt)
  local ref = updateref(self, dt)
  if G.jokers ~= nil and self.ability.set == 'Joker' then
      local applied = self.ability.jest_applied or {}
      self.ability.jest_applied = applied

      local present = {}
      if G.jokers and type(G.jokers.cards) == "table" then
        for _, j in ipairs(G.jokers.cards) do
          if type(j.config.center_key) == "string" then
            present[j.config.center_key] = true
          end
        end
      end

      local target_key = "j_aij_dongtong"

      if present[target_key] and not applied[target_key] then
        jest_ability_calculate(
          self,
          "*", 2,
          { x_chips = 1, x_mult = 1, extra_value = true },
          nil, true
        )
        applied[target_key] = true
      end

      if not present[target_key] and applied[target_key] then
        jest_ability_calculate(
          self,
          "/", 2,
          { x_chips = 1, x_mult = 1, extra_value = true },
          nil, true
        )
        applied[target_key] = nil
      end
  end
  return ref
end

return { name = {"Jokers"}, items = {dongtong} }
