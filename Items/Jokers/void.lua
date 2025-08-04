local void = {
    object_type = "Joker",
    order = 111,

    key = "void",
    config = {
      extra = { xmult = 3 }
    },
    rarity = 2,
    pos = { x = 6, y = 4 },
    atlas = 'joker_atlas',
    cost = 7,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
        local active_text = "(Active!)"
        if G.GAME.jest_void_planet_ante then 
            active_text = "(Inactive)"
        else
            active_text = "(Active!)"
        end
        return { vars = {card.ability.extra.xmult, active_text}}
    end,
  
    calculate = function(self, card, context)
        if context.joker_main then
            if not G.GAME.jest_void_planet_ante then
                return {
                    Xmult_mod = card.ability.extra.xmult,
                    card = card,
                    message = localize{type='variable',key='a_xmult',vars={card.ability.extra.xmult}}
                }
            end
        end
        if context.using_consumeable then
            if context.consumeable.ability.set == 'Planet'then
                G.GAME.jest_void_planet_ante = true
            end
        end
    end
}
local ease_anteref = ease_ante
function ease_ante(mod)
    if mod ~= 0 then
        G.GAME.jest_void_planet_ante = false
    end
    
    local ref = ease_anteref(mod)
    return ref
end
return { name = {"Jokers"}, items = {void} }
