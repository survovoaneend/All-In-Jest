local the_spear = {
    object_type = "Blind",
    key = 'the_spear',
    boss = {
        min = 3,
    },
    mult = 2,
    attributes = {'modify_card', 'debuff'},
    boss_colour = HEX("56a786"),
    atlas = 'blinds',
    pos = { X = 0, y = 41},
    order = 44,
    dollars = 5,


    calculate = function(self, blind, context)
        local temp = G.GAME.blind and G.GAME.blind.disabled
        if temp then
            return
        end
        if context.all_in_jest and context.all_in_jest.before_after and not temp then
            G.E_MANAGER:add_event(Event({
                trigger = 'before',
                func = function()
                    context.scoring_hand[1]:juice_up()
                    context.scoring_hand[1].ability.all_in_jest = context.scoring_hand[1].ability.all_in_jest or {}
                    context.scoring_hand[1].ability.all_in_jest.perma_debuff = true
                    blind:wiggle()
                    return true
                end
            }))
            blind.triggered = true
        end
    end

}
return { name = {"Blinds"}, items = {the_spear} }