local mammon = {
    object_type = "Joker",
    order = 560,
    key = "mammon",
    config = {
        extra = {
            payout_increase_mod = 1,
            payout_increase_total = 0,
        }
    },
    rarity = 2,
    pos = { x = 7, y = 26 },
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card) 
        return {
            vars = {
                card.ability.extra.payout_increase_mod,
                card.ability.extra.payout_increase_total,
            }
        }
    end,

    remove_from_deck = function(self, card, from_debuff)
        G.GAME.all_in_jest.gold_card_amt = G.GAME.all_in_jest.gold_card_amt - card.ability.extra.payout_increase_total
        card.ability.extra.payout_increase_total = 0
	end,

    in_pool = function(self, args)
        if G.deck then
            if #G.deck.cards > 0 then
                local gold_card_count = 0
                for i = 1, #G.deck.cards do
                    if G.deck.cards[i].config.center == G.P_CENTERS["m_gold"] then
                        gold_card_count = gold_card_count + 1
                    end
                end
                if gold_card_count >= 2 then
                    return true
                end
            end
        end
        return false
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            if context.other_card.config.center == G.P_CENTERS["m_gold"] then
                card.ability.extra.payout_increase_total = card.ability.extra.payout_increase_total + card.ability.extra.payout_increase_mod
                G.GAME.all_in_jest.gold_card_amt = G.GAME.all_in_jest.gold_card_amt + card.ability.extra.payout_increase_mod
                card_eval_status_text(card, "extra", nil, nil, nil, {message = localize('k_val_up'), colour = G.C.MONEY})
            end
        end
        if context.setting_blind then
            G.GAME.all_in_jest.gold_card_amt = G.GAME.all_in_jest.gold_card_amt - card.ability.extra.payout_increase_total
            card.ability.extra.payout_increase_total = 0
            return {
                message = localize('k_reset')
            }
        end
    end
}
SMODS.Enhancement:take_ownership('gold', { 
    update = function(self, card, dt)
        card.ability.h_dollars = (G.GAME.all_in_jest.gold_card_amt or 3) 
    end,
}, true)
return { name = {"Jokers"}, items = {mammon} }
