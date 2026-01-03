local the_brimstone = {
    object_type = "Blind",
    key = 'the_brimstone',
    boss = {
        min = 3,
    },
    mult = 2,
    boss_colour = HEX("f24949"),
    atlas = 'blinds',
    pos = { X = 0, y = 8 },
    order = 14,
    dollars = 5,


    calculate = function(self, blind, context)
        if context.pre_discard and not G.GAME.blind.disabled and to_number(G.GAME.dollars) > 0 then
            blind.triggered = true
            blind:wiggle()
            ease_dollars(-math.ceil(G.GAME.dollars/2), true)
        end
    end,

}
return { name = { "Blinds" }, items = { the_brimstone } }
