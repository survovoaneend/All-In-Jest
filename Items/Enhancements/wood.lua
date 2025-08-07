local wood_shader = {
    object_type = "Shader",
    key = 'wood', 
    path = 'wood.fs',
}
local semitrasparent_shader = {
    object_type = "Shader",
    key = 'semitrasparent', 
    path = 'semitrasparent.fs',
}
local wood = {
    object_type = "Enhancement",
    key = 'wood',
    atlas = 'enhancements_atlas',
    
    order = 4,
    pos = { x = 4, y = 0 },
    config = {
        h_chips = 0,
        extra = {
            base_h_chips = 20,
            h_chips_mod = 5,
        }
    },
    loc_vars = function(self, info_queue, card)
        return { vars = {card.ability.h_chips, card.ability.extra.h_chips_mod} }
    end,
    update = function(self, card, dt)
        if G.hand and G.hand.cards then
            local cards = {}
            for k, v in pairs(G.hand.cards) do
                if SMODS.get_enhancements(G.hand.cards[k]).m_aij_wood then
                    cards[#cards+1] = v
                end
            end
            if #cards - 1 >= 0 then
                card.ability.h_chips = card.ability.extra.base_h_chips + (card.ability.extra.h_chips_mod * (#cards - 1))
            end
        else
            card.ability.h_chips = card.ability.extra.base_h_chips
        end
    end
}
return {name = {"Enhancements"}, items = {wood, wood_shader, semitrasparent_shader}}