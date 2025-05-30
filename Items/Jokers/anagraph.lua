local anagraph = {
    object_type = "Joker",
    order = 193,
    
    key = "anagraph",
    config = {
      extra = {
        has_triggered = false,
      }
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
    --really dumb way to do this
    if context.jest_destroying_or_selling_joker and context.cardarea == G.jokers then
      if not card.ability.extra.has_triggered then
        card_eval_status_text(card, 'extra', nil, nil, nil, { message = localize('k_again_ex') })
        card.ability.extra.has_triggered = true
      elseif card.ability.extra.has_triggered then
        card.ability.extra.has_triggered = false
      end
    end
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
    local has_anagraph = next(SMODS.find_card("j_aij_anagraph"))
    if has_anagraph and (self.ability.has_anagraph_triggered == nil or not self.ability.has_anagraph_triggered) then
      G.E_MANAGER:add_event(Event({
        trigger = 'before',
        delay = 1.0,
        func = function()
          local card = copy_card(self, nil, nil, nil, false)
          card:start_materialize()
          card:add_to_deck()
          card.ability.has_anagraph_triggered = true
          G.jokers:emplace(card)
          card.ability.jest_sold_self = nil
          G.E_MANAGER:add_event(Event({
            trigger = 'before',
            delay = 1.0,
            func = function()
              card:start_dissolve(dissolve_colours, silent, dissolve_time_fac, no_juice)
              return true
            end
          }))
          return true
        end
      }))
    end
  end
  return ref
end

return { name = { "Jokers" }, items = { anagraph } }
