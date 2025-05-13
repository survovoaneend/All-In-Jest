local pellesini = {
    object_type = "Joker",
    order = 1007,
     ignore = true,
    key = "pellesini",
    config = {
      
    },
    rarity = 4,
	unlock_condition = {hidden = true},
    pos = { x = 6, y = 0},
    atlas = 'legendary_atlas',
    cost = 20,
    unlocked = false,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = false,
    soul_pos = { x = 6, y = 1},
  
    loc_vars = function(self, info_queue, card)
  
    end,
  
    calculate = function(self, card, context)
      
    end
  
}
local start_dissolve_ref = Card.start_dissolve
function Card:start_dissolve(dissolve_colours, silent, dissolve_time_fac, no_juice)
  local ref = start_dissolve_ref(self, dissolve_colours, silent, dissolve_time_fac, no_juice)
  if G.jokers and self.ability.set == 'Joker' then
    local has_pellesini = 0

    if G.jokers and G.jokers.cards then
        for _, j in ipairs(G.jokers.cards) do
            local k = j.config and j.config.center_key
            if k == "j_aij_pellesini" then has_pellesini = has_pellesini + 1 end
        end
    end
    if has_pellesini >= 0 and self.ability.jest_sold_self == nil and (#G.jokers.cards < G.jokers.config.card_limit or (self.edition ~= nil and self.edition.negative)) then
        for i = 1, has_pellesini do
            G.E_MANAGER:add_event(Event({trigger = 'before', delay = 0.4, func = function()
                local card = copy_card(self, nil, nil, nil, false)
                card:start_materialize()
                card:add_to_deck()
                G.jokers:emplace(card)
                return true end }))
        end
    end
  end
  return ref
end
return { name = {"Jokers"}, items = {pellesini} }
