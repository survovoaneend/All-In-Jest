local aphantasia = {
    object_type = "Joker",
    order = 268,
    key = "aphantasia",
    config = {
      
    },
    rarity = 3,
    pos = { x = 15, y = 10},
    atlas = 'joker_atlas',
    cost = 8,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = {set = 'Other', key = 'aij_jest_chaotic_card', vars={1.5}}
    end,
  
    calculate = function(self, card, context)
        if context.after and context.full_hand and not context.blueprint then
            local triggers = 0
            for _, scored_card in ipairs(context.full_hand) do
                if scored_card.config.center ~= G.P_CENTERS.c_base and not scored_card.ability.aij_jest_chaotic_card then
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            SMODS.Stickers["aij_jest_chaotic_card"]:apply(scored_card, true)
                            scored_card:juice_up()
                            return true
                        end
                    }))
                    triggers = triggers + 1
                end
            end
            if triggers > 0 then
                return {
                    message = localize("k_aij_chaos_ex")
                }
            end
        end
    end
}
return { name = {"Jokers"}, items = {aphantasia} }
