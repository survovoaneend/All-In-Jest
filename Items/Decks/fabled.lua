local fabled = {
    object_type = "Back",
    key = 'fabled',
    atlas = 'deck_atlas',
    order = 0,
    pos = { x = 0, y = 0 },
    unlocked = false,
	unlock_condition = {hidden = true},
    config = {
        joker_slot = -1,
        extra = {
            should_increase = true,
            remove_amt = 0,
            counterbalance = 0
        }
    },
    loc_vars = function(self)
        return {vars = {self.config.joker_slot}}
	end,
    locked_loc_vars = function(self, info_queue, card)
        if not self.unlocked then
            return {key = "b_aij_fabled_hidden"}
        end
	end,
    calculate = function(self, card, context)
        if context.end_of_round and not context.repetition and not context.individual and G.GAME.selected_back.effect.config.extra.should_increase then
             G.GAME.jest_legendary_pool.rate =  G.GAME.jest_legendary_pool.rate - 0.002
             G.GAME.selected_back.effect.config.extra.counterbalance = G.GAME.selected_back.effect.config.extra.counterbalance + 0.002
        end
        if context.buying_card then
            if context.card.ability.set == "Joker" and context.card.config.center.rarity == 4 then
                G.GAME.selected_back.effect.config.extra.should_increase = false
                G.GAME.jest_legendary_pool.rate = G.GAME.jest_legendary_pool.rate + G.GAME.selected_back.effect.config.extra.counterbalance
                G.GAME.selected_back.effect.config.extra.counterbalance = 0
            end
        end
    end,
    check_for_unlock = function(self, args)
        if args.type == 'discover_amount' and G.P_CENTER_POOLS then
            for i, v in ipairs(G.P_CENTER_POOLS["Joker"]) do
                if v.rarity == 4 and v.discovered then
                    return true
                end
            end
        end
        return false
    end,
    apply = function(self, back)
        G.GAME.jest_legendary_pool.in_shop = true
        G.GAME.jest_legendary_pool.rate = G.GAME.jest_legendary_pool.rate - 0.008 -- 0.08%
    end
}
return {name = {"Decks"}, items = {fabled}}