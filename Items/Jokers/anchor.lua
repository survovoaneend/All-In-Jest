local anchor = {
    object_type = "Joker",
    order = 59,
    ignore = true,
    key = "anchor",
    config = {
      
    },
    rarity = 2,
    pos = { x = 5, y = 2 },
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
  
    end,
  
    calculate = function(self, card, context)
      
    end
  
}
local start_dissolve_ref = Card.start_dissolve
function Card:start_dissolve(dissolve_colours, silent, dissolve_time_fac, no_juice)
  local has_anchor = false
  local location = 0
  if G.jokers and self.ability.set == 'Joker' then
    if G.jokers and G.jokers.cards then
      for i = 1, #G.jokers.cards do
        if G.jokers.cards[i].config and G.jokers.cards[i].config.center_key == "j_aij_anchor" then
          has_anchor = true
          location = i
        end
      end
    end
  end
  if has_anchor then
    local left  = location - 1
    local right = location + 1
    local nearby = (left >= 1 and G.jokers.cards[left].label == self.config.center_key) or (right <= #G.jokers.cards and G.jokers.cards[right].label == self.config.center_key)

    if nearby and self.ability.jest_sold_self == nil then
        return false
    end
  end
  local ref = start_dissolve_ref(self, dissolve_colours, silent, dissolve_time_fac, no_juice)
  return ref
end
return { name = {"Jokers"}, items = {anchor} }
