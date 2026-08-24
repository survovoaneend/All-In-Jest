local tangled_joker = {
    object_type = "Joker",
    order = 975,
    
    key = "tangled_joker",
    config = {
        extra = {
            chips = 20,
            mult = 4,
        }
    },
    attributes = {'chips', 'mult', 'joker_slot'},
    rarity = 1,
    pos = { x = 23, y = 45},
    atlas = 'joker_atlas',
    cost = 4,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,

    loc_vars = function(self, info_queue, card)
        local jokers_held = G.jokers and #G.jokers.cards or 0
        local empty_slots = G.jokers and math.max(0, G.jokers.config.card_limit - jokers_held) or 0
        return { 
            vars = {
                card.ability.extra.chips,
                card.ability.extra.mult,
                card.ability.extra.chips * jokers_held,
                card.ability.extra.mult * empty_slots
            }
        }
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            local jokers_held = #G.jokers.cards
            local empty_slots = math.max(0, G.jokers.config.card_limit - jokers_held)
            return {
                chips = card.ability.extra.chips * jokers_held,
                mult = card.ability.extra.mult * empty_slots
            }
        end
    end
}
return { name = {"Jokers"}, items = {tangled_joker} }