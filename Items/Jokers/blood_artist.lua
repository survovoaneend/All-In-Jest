local blood_artist = {
    object_type = "Joker",
    order = 86,

    key = "blood_artist",
    config = {
      extra = {
          blind_reduction = 10
      }
    },
    rarity = 2,
    pos = { x = 6, y = 3 },
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.blind_reduction,
            }
        }
    end,
  
    calculate = function(self, card, context)
      
    end
}
local start_dissolve_ref = Card.start_dissolve
function Card:start_dissolve(dissolve_colours, silent, dissolve_time_fac, no_juice)
  local ref = start_dissolve_ref(self, dissolve_colours, silent, dissolve_time_fac, no_juice)
  if G.jokers then
    local has_blood_artist = next(SMODS.find_card("j_aij_blood_artist"))
    if has_blood_artist then
        for i = 1, has_blood_artist do
            G.GAME.blind.chips = G.GAME.blind.chips - math.ceil(G.GAME.blind.chips * (SMODS.find_card("j_aij_blood_artist")[i].ability.extra.blind_reduction * 0.01))
            G.GAME.blind.chip_text = G.GAME.blind.chips
        end
    end
  end
  return ref
end
return { name = {"Jokers"}, items = {blood_artist} }
