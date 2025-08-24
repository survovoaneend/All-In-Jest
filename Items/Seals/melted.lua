local melted = {
    object_type = "Seal",
    key = 'melted',
    config = {
        
    },
    atlas = 'enhancements_atlas',
    pos = { x = 8, y = 2 },
    badge_colour = HEX("a28b8b"),
    order = 1,
    loc_vars = function(self, info_queue, card)
        return { 
            vars = { 
                colours = {
                    HEX("a28b8b"),
                } 
            } 
        }
    end,
    calculate = function(self, card, context)
        if context.before and context.scoring_hand then 
            local temp_card = nil
            local index = 0
            while not temp_card or index ~= #context.scoring_hand do
                index = index + 1
                if context.scoring_hand[index] and context.scoring_hand[index].seal then
                    temp_card = context.scoring_hand[index]
                    break
                end
            end
            if card.area == G.hand and temp_card and temp_card.seal and temp_card.seal ~= 'aij_melted' and temp_card.seal ~= card.seal then
                play_sound('tarot1')
                card:juice_up(0.3, 0.5)
                card:set_seal(temp_card.seal, nil, true)
            end
        end
    end
}
return {name = {"Seals"}, items = {melted}}