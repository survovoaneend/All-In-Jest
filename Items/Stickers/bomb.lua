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
       if context.after and context.full_hand and not card.getting_sliced then
            local my_idx = nil

            for i = 1, #context.full_hand do
                if context.full_hand[i] == card then
                    my_idx = i
                    break
                end
            end

            if my_idx then
                local total_cards = {}
                
                if context.full_hand[my_idx - 1] then
                    table.insert(total_cards, context.full_hand[my_idx - 1])
                end

                table.insert(total_cards, card)

                if context.full_hand[my_idx + 1] then
                    table.insert(total_cards, context.full_hand[my_idx + 1])
                end
                
                SMODS.destroy_cards(total_cards)
            end
        end
    end
}
return {name = {"Stickers"}, items = {bomb}}