local blacklist = {
    object_type = "Joker",
    order = 326,
    key = "blacklist",
    config = {
        extra = {
            banned_cards = {}
        }
    },
    rarity = 2,
    pos = { x = 22, y = 12},
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
        local nodes = {}
        if #card.ability.extra.banned_cards <= 0 then
            nodes[#nodes+1] = {n = G.UIT.T, config = {text = localize('k_aij_blacklist_empty', 'extra_joker_dictionary'), colour = G.C.RED, scale = 0.32}}
        else
            local index = 0
            for i = #card.ability.extra.banned_cards, 1, -1 do
                local key = card.ability.extra.banned_cards[i]
                if index >= 10 then
                    local more = #card.ability.extra.banned_cards - 10
                    nodes[#nodes+1] = {n = G.UIT.R, config = {align = "cm", padding = 0.02}, nodes = {
                        {n = G.UIT.T, config = {text = localize('k_aij_blacklist_and', 'extra_joker_dictionary')..' ', colour = G.C.L_BLACK, scale = 0.32}},
                        {n = G.UIT.T, config = {text = more, colour = G.C.FILTER, scale = 0.32}},
                        {n = G.UIT.T, config = {text = ' '..localize('k_aij_blacklist_more', 'extra_joker_dictionary')..'...', colour = G.C.L_BLACK, scale = 0.32}}
                    }}
                    break
                else
                    local name = retrieve_joker_text(key, true, true)
                    nodes[#nodes+1] = {n = G.UIT.R, config = {align = "cm", padding = 0.02}, nodes = {
                        {n = G.UIT.T, config = {text = name, colour = G.C.FILTER, scale = 0.32}}
                    }} 
                    index = index + 1
                end
            end
        end
        return {main_end = {{n = G.UIT.R, config = {align = "cm"}, nodes = nodes}},}
    end,
  
    calculate = function(self, card, context)
        if context.jest_destroying_or_selling_joker and not context.jest_destroying_card then 
		    G.GAME.banned_keys[context.jest_destroyed_joker.config.center_key] = true
            table.insert(card.ability.extra.banned_cards, context.jest_destroyed_joker.config.center_key)
        end
    end,
    remove_from_deck = function(self, card, from_debuff)
        for i = 1, #SMODS.find_card("j_aij_blacklist") do
            local banned_cards = SMODS.find_card("j_aij_blacklist")[i].ability.extra.banned_cards
            for _i, key in ipairs(card.ability.extra.banned_cards) do
                local remove = true
                for _, k in ipairs(banned_cards) do
                    if key == k then
                        remove = false
                    end
                end
                if remove then
                    G.GAME.banned_keys[key] = nil
                end
            end
		end
	end,
}
return { name = {"Jokers"}, items = {blacklist} }
