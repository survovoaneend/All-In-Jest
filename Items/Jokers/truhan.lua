local truhan = {
    object_type = "Joker",
    order = 220,

    key = "truhan",
    config = {
      extra = {
        xmult = 1,
        xmult_mod = 0.05
      }
    },
    rarity = 2,
    pos = { x = 9, y = 8},
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,
  
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.xmult,
                card.ability.extra.xmult_mod
            }
        }
    end,
  
    calculate = function(self, card, context)
      if context.jest_destroying_or_selling_joker then
        local curmod = card.ability.extra.xmult_mod * (context.jest_destroyed_joker.ability.jest_held_for or 0)
        card.ability.extra.xmult = card.ability.extra.xmult + curmod
        if curmod ~= 0 then
            return {
              message = localize('k_upgrade_ex')
            }
        end
      end
      if context.joker_main then
        return {
          xmult = card.ability.extra.xmult,
        }
      end
    end
}
local ease_roundref = ease_round
function ease_round(mod)
    local ref = ease_roundref(mod)
    for i = 1, #G.jokers.cards do
        if G.jokers.cards[i].ability.jest_held_for ~= nil then
            G.jokers.cards[i].ability.jest_held_for = G.jokers.cards[i].ability.jest_held_for + mod
        else
            G.jokers.cards[i].ability.jest_held_for = mod
        end
    end
    return ref
end
return { name = {"Jokers"}, items = {truhan} }
