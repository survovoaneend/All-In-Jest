local lexicon = {
    object_type = "Joker",
    order = 322,
    key = "lexicon",
    config = {
    },
    rarity = 3,
    pos = { x = 18, y = 12},
    atlas = 'joker_atlas',
    cost = 8,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
        local mult = 0
        if G.jokers then
            for i = 1, #G.jokers.cards do
                if G.jokers.cards[i] ~= card and G.jokers.cards[i].config.center.key ~= 'j_aij_lexicon' then
                    local text = retrieve_joker_text(G.jokers.cards[i])
                    for num in string.gmatch(text, "%d+") do
                        mult = mult + tonumber(num)  
                    end
                end
            end
        end
        return { vars = {mult}}
    end,
  
    calculate = function(self, card, context)
        if context.joker_main and G.jokers then
            local mult = 0
            for i = 1, #G.jokers.cards do
                if G.jokers.cards[i] ~= card and G.jokers.cards[i].config.center.key ~= 'j_aij_lexicon' then
                    local text = retrieve_joker_text(G.jokers.cards[i])
                    for num in string.gmatch(text, "%d+") do
                        mult = mult + tonumber(num)  
                    end
                end
            end
            if mult ~= 0 then
                return {
                    mult = mult
                }
            end
        end
    end
  
}
return { name = {"Jokers"}, items = {lexicon} }
