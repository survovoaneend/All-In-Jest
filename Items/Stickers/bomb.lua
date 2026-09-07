local bomb = {
    object_type = "Sticker",
    key = "bomb",
	config = { aij = { pc_sticker = true }, extra = {  } },
    pos = { x = 3, y = 2 },
    atlas = "stickers_atlas",
    badge_colour = HEX '61767a',
    order = 1,
    
    loc_vars = function(self, info_queue, card)
        
    end,
    calculate = function(self, card, context)
        if context.destroy_card and (context.cardarea == G.play or context.cardarea == 'unscored') then
            local my_idx = nil

            for i = 1, #context.full_hand do
                if context.full_hand[i] == card then
                    my_idx = i
                    break
                end
            end

            if my_idx then
                if context.full_hand[my_idx - 1] == context.destroy_card
                or context.full_hand[my_idx] == context.destroy_card
                or context.full_hand[my_idx + 1] == context.destroy_card then
                    return { remove = true }
                end
            end
        end
    end
}
return {name = {"Stickers"}, items = {bomb}}