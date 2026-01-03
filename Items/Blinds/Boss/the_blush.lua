local the_blush = {
    object_type = "Blind",
    key = 'the_blush',
    boss = {
        min = 1,
    },
    mult = 2,
    boss_colour = HEX("e39170"),
    atlas = 'blinds',
    pos = { X = 0, y = 9 },
    order = 15,
    dollars = 5,


    calculate = function(self, blind, context)
        
    end,

}
local discardref = G.FUNCS.can_discard
function G.FUNCS.can_discard(e)
    local ref = discardref(e)
    if ((G.GAME.blind.config.blind.key == 'bl_aij_the_blush' and not G.GAME.blind.disabled) and #G.hand.highlighted ~= 5) or
        ((G.GAME.blind.config.blind.key == 'bl_aij_the_neck' and not G.GAME.blind.disabled) and #G.hand.highlighted > 1) or
        G.GAME.current_round.discards_left <= 0 or #G.hand.highlighted <= 0 or #G.hand.highlighted > math.max(G.GAME.starting_params.discard_limit, 0) then
            e.config.colour = G.C.UI.BACKGROUND_INACTIVE
            e.config.button = nil
    else
        return ref
    end
end
return { name = {"Blinds"}, items = {the_blush} }