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
  
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            if context.other_card.debuff then
                SMODS.calculate_effect({xmult = card.ability.extra.xmult}, context.other_card)
            end
        end
        if context.initial_scoring_step then
            if G.hand then
                if #G.hand.cards > 0 then
                    for i = 1, #G.hand.cards do
                        if G.hand.cards[i].debuff then
                            SMODS.calculate_effect({xmult = card.ability.extra.xmult}, G.hand.cards[i])
                        end
                    end
                end
            end
            if G.jokers then
                if #G.jokers.cards > 0 then
                    for i = 1, #G.jokers.cards do
                        if G.jokers.cards[i].debuff then
                            SMODS.calculate_effect({xmult = card.ability.extra.xmult}, G.jokers.cards[i])
                        end
                    end
                end
            end
        end
    end,

    update = function(self, card, dt)
        if G.jokers then
            if next(SMODS.find_card("j_aij_greasepaint")) then
                for i = 1, #G.jokers.cards do
                    if G.jokers.cards[i].config.center.key == "j_aij_greasepaint" and not G.jokers.cards[i].debuff then
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
                    if G.jokers.cards[i].config.center.key ~= "j_aij_greasepaint" then
                        if G.jokers.cards[i+1] and G.jokers.cards[i-1] then
                            if G.jokers.cards[i-1].config.center.key ~= "j_aij_greasepaint" and G.jokers.cards[i+1].config.center.key ~= "j_aij_greasepaint" and G.jokers.cards[i].ability.aij_greasepaint_debuff then
                                if G.jokers.cards[i].debuff then
                                    G.jokers.cards[i].debuff = false
                                    G.jokers.cards[i].ability.aij_greasepaint_debuff = false
                                end
                            end
                        else
                            if G.jokers.cards[i-1] and G.jokers.cards[i-1].config.center.key ~= "j_aij_greasepaint" and G.jokers.cards[i].ability.aij_greasepaint_debuff then
                                if G.jokers.cards[i].debuff then
                                    G.jokers.cards[i].debuff = false
                                    G.jokers.cards[i].ability.aij_greasepaint_debuff = false
                                end
                            end
                            if G.jokers.cards[i+1] and G.jokers.cards[i+1].config.center.key ~= "j_aij_greasepaint" and G.jokers.cards[i].ability.aij_greasepaint_debuff then
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
