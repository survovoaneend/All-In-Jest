local dapper_dan = {
    object_type = "Joker",
    order = 149,

    key = "dapper_dan",
    config = {
      
    },
    rarity = 3,
    pos = { x = 18, y = 5 },
    atlas = 'joker_atlas',
    cost = 8,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
  
    end,
  
    calculate = function(self, card, context)
        
    end,
}
local updateref = Card.update
function Card:update(dt)
  local ref = updateref(self, dt)

  if G.jokers and self.ability.set == 'Joker' and not self.ability.group_key and self.edition ~= nil then
    local applied = self.ability.jest_dapper_dan_applied or {}
    local skip = false
    if self.ability.jest_dapper_dan_applied == nil then
      skip = true
    end
    self.ability.jest_dapper_dan_applied = applied

    local current_count = 0
    if G.jokers.cards then
      for _, j in ipairs(G.jokers.cards) do
        if j.config and j.config.center_key == "j_aij_dapper_dan" then
          current_count = current_count + 1
        end
      end
    end

    local prev_count = applied["j_aij_dapper_dan"] or 0
    local diff = current_count - prev_count

    local last_type = applied._last_edition_type
    local current_type = self.edition and self.edition.type
    local edition_changed = last_type ~= current_type

    local last_card_limit = applied._last_card_limit or 0
    local current_card_limit = (self.edition and self.edition.card_limit) or 0
    local card_limit_diff = current_card_limit - last_card_limit

    if self.added_to_deck and self.edition and self.edition.negative and card_limit_diff ~= 0 then
      G.jokers.config.card_limit = G.jokers.config.card_limit + card_limit_diff
    end

    if diff > 0 then
      for _ = 1, diff do
        jest_ability_calculate(self, "*", 2, nil, nil, true, nil, "edition")
      end
    end

    if diff < 0 then
      for _ = 1, -diff do
        jest_ability_calculate(self, "/", 2, nil, nil, true, nil, "edition")
      end
    end

    if edition_changed and current_count > 0 and not skip then
      if self.added_to_deck and self.edition and self.edition.negative and card_limit_diff ~= 0 then
        G.jokers.config.card_limit = G.jokers.config.card_limit - 1
      end
      for _ = 1, current_count do
        jest_ability_calculate(self, "*", 2, nil, nil, true, nil, "edition")
      end
    end

    applied._last_card_limit = current_card_limit
    applied["j_aij_dapper_dan"] = current_count
    applied._last_edition_type = current_type
  end

  return ref
end

return { name = {"Jokers"}, items = {dapper_dan} }

