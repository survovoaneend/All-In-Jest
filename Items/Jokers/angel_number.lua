local angel_number = {
    object_type = "Joker",
    order = 283,
    key = "angel_number",
    config = {
      extra = {
          curnumerator = "0",
          numeratormod = 1
      }
    },
    rarity = 2,
    pos = { x = 6, y = 11},
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.numeratormod,
            }
        }
    end,
  
    calculate = function(self, card, context)
        local sevens = 0
        if context.before and context.scoring_hand then
            
            for i = 1, #context.scoring_hand do
                if context.scoring_hand[i]:get_id() == 7 then
                    sevens = sevens + 1
                    for k, v in pairs(G.GAME.probabilities) do 
                        G.GAME.probabilities[k] = v+card.ability.extra.numeratormod
                    end
                    card.ability.extra.curnumerator = tostring(tonumber(card.ability.extra.curnumerator) + card.ability.extra.numeratormod)
                end
            end
            if sevens > 0 then
            card_eval_status_text(card, 'extra', nil, nil, nil, {
                message = '+' .. sevens .. ' Odds',
                colour = G.C.GREEN
            })
        end
        end
        if context.after then
            if card.ability.extra.curnumerator ~= "0" then
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.1,
                    func = function()
                        for k, v in pairs(G.GAME.probabilities) do 
                            G.GAME.probabilities[k] = v-tonumber(card.ability.extra.curnumerator)
                        end
                        card.ability.extra.curnumerator = "0"
                        sevens = 0
                    return true
                    end
                }))
            end
        end
    end
  
}
return { name = {"Jokers"}, items = {angel_number} }
