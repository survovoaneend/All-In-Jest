local the_far_lands = {
    object_type = "Joker",
    order = 654,
    key = "the_far_lands",
    config = {
        extra = {
            
        }
    },
    attributes = {"enhancements", "modify_card", "passive"},
    rarity = 2,
    pos = { x = 11, y = 29 },
    atlas = 'joker_atlas',
    cost = 7,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = false,
    perishable_compat = true,

	loc_vars = function(self, info_queue, card)
		info_queue[#info_queue + 1] = G.P_CENTERS.m_stone
		return {
			vars = {
				localize { type = 'name_text', set = 'Enhanced', key = "m_stone" }
			}
		}
	end,

    calculate = function(self, card, context)
        
    end,

    in_pool = function(self, args)
        local stone = 0
        if G.GAME and G.playing_cards then
            for _, card in ipairs(G.playing_cards) do
                if SMODS.has_enhancement(card, 'm_stone') then
                    stone = stone + 1
                end
            end
        end
        if stone > 0 then
            return true
        else
            return false
        end
    end,
}

local aij_get_id_ref = Card.get_id
function Card:get_id()
    if next(SMODS.find_card("j_aij_the_far_lands")) and SMODS.has_enhancement(self, "m_stone") and not self.vampired then
        return -1000000 - 845648 -- 845648 is just a random number, nothing special
    else
        return aij_get_id_ref(self)
    end
end



return { name = {"Jokers"}, items = {the_far_lands} }
