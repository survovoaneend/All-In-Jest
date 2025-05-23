local bearded_joker = {
    object_type = "Joker",
    order = 208,

    key = "bearded_joker",
    config = {
      extra = {
        mult_mod = 1,
      }
    },
    rarity = 1,
    pos = { x = 22, y = 7},
    atlas = 'joker_atlas',
    cost = 4,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
        local enhancement_tally = 0
        if G.GAME and G.playing_cards then
            for _, card in ipairs(G.playing_cards) do
                if card.config.center ~= G.P_CENTERS.c_base then
                 enhancement_tally = enhancement_tally + 1
                end
            end
        end
        return {
            vars = {
                card.ability.extra.mult_mod,
                enhancement_tally * card.ability.extra.mult_mod,
            }
        }
    end,
  
    calculate = function(self, card, context)
        local enhancement_tally = 0
        if G.GAME and G.playing_cards and not context.blueprint then
            for _, card in ipairs(G.playing_cards) do
                if card.config.center ~= G.P_CENTERS.c_base then
                 enhancement_tally = enhancement_tally + 1
                end
            end
        end
        if context.joker_main then
            return {
                mult = card.ability.extra.mult_mod * enhancement_tally,
                card = card
            }
        end
    end,
    in_pool = function(self, args)
    local enhancement_tally = 0
    if G.GAME and G.playing_cards then
        for _, card in ipairs(G.playing_cards) do
            if card.config.center ~= G.P_CENTERS.c_base then
                enhancement_tally = enhancement_tally + 1
            end
        end
    end
    if enhancement_tally > 2 then
        return true
    else
        return false
    end
  end,
  
}
return { name = {"Jokers"}, items = {bearded_joker} }
