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
    in_pool = function(self, args)
        if G.GAME and G.jokers then
            for _, card in ipairs(G.jokers.cards) do
                if card.edition ~= nil then
                    return true
                end
            end
        end
        return false
    end,
}
local updateref = Card.update
function Card:update(dt)
  local ref = updateref(self, dt)

  if G.jokers and self.ability.set == 'Joker' and self.edition ~= nil and self.edition.key ~= 'e_negative' then
    local applied = self.edition.jest_dapper_dan_applied or {}
    self.edition.jest_dapper_dan_applied = applied

    local current_count = #SMODS.find_card("j_aij_dapper_dan")
    local prev_count = applied["j_aij_dapper_dan"] or 0
    local diff = current_count - prev_count
    
    if diff ~= 0 then
      --local last_card_limit = (self.edition and self.edition.card_limit) or 0

      local prev_multiplier = 1 + prev_count
      local new_multiplier = 1 + current_count
      local ratio = new_multiplier / prev_multiplier

      jest_ability_calculate(self, "*", ratio,  { jest_dapper_dan_applied = true }, nil, false, nil, "edition")
      
      applied["j_aij_dapper_dan"] = current_count
      --local current_card_limit = (self.edition and self.edition.card_limit) or 0
      --local card_limit_diff = current_card_limit - last_card_limit
      --if (self.added_to_deck or self.joker_added_to_deck_but_debuffed) and card_limit_diff ~= 0 then
      --  G.jokers.config.card_limit = G.jokers.config.card_limit + card_limit_diff
      --end
    end
  end

  return ref
end

return { name = {"Jokers"}, items = {dapper_dan} }

