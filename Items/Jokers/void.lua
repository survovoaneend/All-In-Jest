local void = {
    object_type = "Joker",
    order = 111,
    lite = true,
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
        local active_text = "("..localize('k_active')..")"
        if G.GAME.jest_void_planet_ante then 
            active_text = "("..localize('k_inactive')..")"
        else
            active_text = "("..localize('k_active')..")"
        end
        return { vars = {card.ability.extra.xmult, active_text}}
    end,
  
    calculate = function(self, card, context)
        if context.joker_main then
            if not G.GAME.jest_void_planet_ante then
                return {
                    xmult = card.ability.extra.xmult,
                }
            end
        end
        if context.using_consumeable then
            if context.consumeable.ability.set == 'Planet'then
                G.GAME.jest_void_planet_ante = true
            end
        end
        if context.ante_change and context.ante_change ~= 0 and context.ante_end then
            G.GAME.jest_void_planet_ante = false
        end
    end
}
return { name = {"Jokers"}, items = {void} }
