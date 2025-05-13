local anagraph = {
    object_type = "Joker",
    order = 193,
    ignore = true,
    key = "anagraph",
    config = {
      
    },
    rarity = 1,
    pos = { x = 7, y = 7},
    atlas = 'joker_atlas',
    cost = 4,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
  
    end,
  
    calculate = function(self, card, context)
      
    end
}
local sell_card_ref = Card.sell_card
function Card:sell_card()
  local ref = sell_card_ref(self)
  if self.ability then
    self.ability.jest_sold_self = true
  end
  return ref
end
local start_dissolve_ref = Card.start_dissolve
function Card:start_dissolve(dissolve_colours, silent, dissolve_time_fac, no_juice)
  local ref = start_dissolve_ref(self, dissolve_colours, silent, dissolve_time_fac, no_juice)
  if G.jokers and self.ability.set == 'Joker' then
    local has_anagraph = false

    if G.jokers and G.jokers.cards then
        for _, j in ipairs(G.jokers.cards) do
        local k = j.config and j.config.center_key
        if k == "j_aij_anagraph" then has_anagraph = true end
        end
    end
    if has_anagraph and (self.ability.has_anagraph_triggered == nil or not self.ability.has_anagraph_triggered) then
        G.E_MANAGER:add_event(Event({trigger = 'before', delay = 0.4, func = function()
            local card = copy_card(self, nil, nil, nil, false)
            card:start_materialize()
            card:add_to_deck()
            card.ability.has_anagraph_triggered = true
            G.jokers:emplace(card)
            card.ability.jest_sold_self = nil
            card:start_dissolve(dissolve_colours, silent, dissolve_time_fac, no_juice)
            return true end }))
    end
  end
  return ref
end
return { name = {"Jokers"}, items = {anagraph} }
