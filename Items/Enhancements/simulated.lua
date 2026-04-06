local simulated = {
    object_type = "Enhancement",
    key = 'simulated',
    atlas = 'enhancements_atlas',
    order = 5,
    pos = { x = 0, y = 1 },
    config = {
        extra = {
            all_in_jest = {
                to_hand = {
                    cards = false,
                    trigger = false,
                }
            }
        }
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                
            }
        }
    end,
    calculate = function(self, card, context)
        if context.aij_before_before then
            if not card.ability.extra.all_in_jest.to_hand.trigger then
                card.ability.extra.all_in_jest.to_hand.cards = true
                card.ability.extra.all_in_jest.to_hand.trigger = true
            else
                card.ability.extra.all_in_jest.to_hand.cards = false
            end
        end
    end
}
return {name = {"Enhancements"}, items = {simulated}}