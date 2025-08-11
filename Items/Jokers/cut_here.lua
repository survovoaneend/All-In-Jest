local cut_here = {
    object_type = "Joker",
    order = 361,
    key = "cut_here",
    config = {

    },
    rarity = 2,
    pos = { x = 4, y = 14},
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = false,
  
    loc_vars = function(self, info_queue, card)

    end,
  
    calculate = function(self, card, context)
        
    end
}
local start_dissolve_ref = Card.start_dissolve
function Card:start_dissolve(dissolve_colours, silent, dissolve_time_fac, no_juice)
  local ref = start_dissolve_ref(self, dissolve_colours, silent, dissolve_time_fac, no_juice)
  if G.jokers and self.ability.set == 'Joker' then
    local has_cut_here = next(SMODS.find_card("j_aij_cut_here"))
    if has_cut_here and not self.ability.jest_sold_self then
      for i = 1, #SMODS.find_card("j_aij_cut_here") do
        if SMODS.find_card("j_aij_cut_here")[i] == self then
          G.E_MANAGER:add_event(Event({
            trigger = 'before',
            delay = 0.2,
            func = function()
              local temp_card = create_card('Joker', G.jokers, nil, 1, nil, nil, nil, 'cut_here')
              temp_card:start_materialize()
              G.jokers:emplace(temp_card)
              return true
            end
          }))
        end
      end
    end
  end
  return ref
end
return { name = {"Jokers"}, items = {cut_here} }
