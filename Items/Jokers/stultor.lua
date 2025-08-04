local stultor = {
    object_type = "Joker",
    order = 181,

    key = "stultor",
    config = {
      extra = {
          free_rerolls = 1
      }
    },
    rarity = 2,
    pos = { x = 24, y = 6},
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.free_rerolls,
            }
        }
    end,
  
    calculate = function(self, card, context)
      
    end,
    add_to_deck = function(self, card, from_debuff)
        G.GAME.jest_free_stultor_rerolls = G.GAME.jest_free_stultor_rerolls + 1
    end,
}
local ease_anteref = ease_ante
function ease_ante(mod)
    if mod ~= 0 then
        local has_stultor = next(SMODS.find_card("j_aij_stultor"))
        if has_stultor then
            for i = 1, has_stultor do
                G.GAME.jest_free_stultor_rerolls = G.GAME.jest_free_stultor_rerolls + SMODS.find_card("j_aij_stultor")[i].ability.extra.free_rerolls
            end
        end
    end
    
    local ref = ease_anteref(mod)
    return ref
end
return { name = {"Jokers"}, items = {stultor} }
