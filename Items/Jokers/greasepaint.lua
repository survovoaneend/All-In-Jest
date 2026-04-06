local contains = function (tbl, item)
    for k, v in pairs(tbl) do
        if v == item then
            return true
        end
    end
    return false
end

local greasepaint = {
    object_type = "Joker",
    order = 29,

    key = "greasepaint",
    config = {
      extra = {
          xmult = 2,
      }
    },
    rarity = 3,
    pos = { x = 2, y = 1 },
    atlas = 'joker_atlas',
    cost = 8,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.xmult,
            }
        }
    end,

    update = function(self, card, dt)
        if G.jokers then
            local greasepaints = SMODS.find_card("j_aij_greasepaint")
            if #greasepaints > 0 then
                for i = 1, #G.jokers.cards do
                    if G.jokers.cards[i] == card and not G.jokers.cards[i].debuff then
                        if G.jokers.cards[i-1] and not G.jokers.cards[i-1].debuff then
                            G.jokers.cards[i-1].debuff = true
                            G.jokers.cards[i-1].ability.aij_greasepaint_debuff = true
                        end
                        if G.jokers.cards[i+1] and not G.jokers.cards[i+1].debuff then
                            G.jokers.cards[i+1].debuff = true
                            G.jokers.cards[i+1].ability.aij_greasepaint_debuff = true
                        end
                    end
                end
                for i = 1, #G.jokers.cards do
                    if G.jokers.cards[i] ~= card then
                        if G.jokers.cards[i+1] and G.jokers.cards[i-1] then
                            if not contains(greasepaints, G.jokers.cards[i-1]) and not contains(greasepaints, G.jokers.cards[i+1]) and G.jokers.cards[i].ability.aij_greasepaint_debuff then
                                if G.jokers.cards[i].debuff then
                                    G.jokers.cards[i].debuff = false
                                    G.jokers.cards[i].ability.aij_greasepaint_debuff = false
                                end
                            end
                        else
                            if G.jokers.cards[i-1] and not contains(greasepaints, G.jokers.cards[i-1]) and G.jokers.cards[i].ability.aij_greasepaint_debuff then
                                if G.jokers.cards[i].debuff then
                                    G.jokers.cards[i].debuff = false
                                    G.jokers.cards[i].ability.aij_greasepaint_debuff = false
                                end
                            end
                            if G.jokers.cards[i+1] and not contains(greasepaints, G.jokers.cards[i+1]) and G.jokers.cards[i].ability.aij_greasepaint_debuff then
                                if G.jokers.cards[i].debuff then
                                    G.jokers.cards[i].debuff = false
                                    G.jokers.cards[i].ability.aij_greasepaint_debuff = false
                                end
                            end
                        end
                    end
                end
            else
                for i = 1, #G.jokers.cards do
                    if G.jokers.cards[i].ability.aij_greasepaint_debuff then
                        if G.jokers.cards[i].debuff then
                            G.jokers.cards[i].debuff = false
                            G.jokers.cards[i].ability.aij_greasepaint_debuff = false
                        end
                    end
                end
            end
        end
    end,

    remove_from_deck = function(self, card, from_debuff)
        for i = 1, #G.jokers.cards do
            if G.jokers.cards[i].ability.aij_greasepaint_debuff then
                if G.jokers.cards[i].debuff then
                    G.jokers.cards[i].debuff = false
                    G.jokers.cards[i].ability.aij_greasepaint_debuff = false
                end
            end
        end
	end,
}
return { name = {"Jokers"}, items = {greasepaint} }
