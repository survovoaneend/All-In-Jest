local dongtong = {
    object_type = "Joker",
    order = 1057,

    key = "dongtong",
    config = {
      
    },
    rarity = 4,
    pos = { x = 6, y = 10},
    atlas = 'legendary_atlas',
    cost = 20,
    unlocked = false,
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
  if G.jokers and self.ability.set == 'Joker' and (self.config.center.dongtong_compat == nil or self.config.center.dongtong_compat) then
    local applied = self.ability.jest_applied or {}
    self.ability.jest_applied = applied

    local current_count = #SMODS.find_card("j_aij_dongtong")

    local prev_count = applied["j_aij_dongtong"] or 0
    local diff = current_count - prev_count

    if diff > 0 then
      for i = 1, diff do
        jest_ability_calculate(
          self,
          "*", 2,
          { x_chips = 1, x_mult = 1, extra_value = true, rarity },
          nil, true, "ability.extra"
        )
      end
    elseif diff < 0 then
      for i = 1, -diff do
        jest_ability_calculate(
          self,
          "/", 2,
          { x_chips = 1, x_mult = 1, extra_value = true, rarity },
          nil, true, "ability.extra"
        )
      end
    end

    applied["j_aij_dongtong"] = current_count
  end
  return ref
end

return { name = {"Jokers"}, items = {dongtong} }