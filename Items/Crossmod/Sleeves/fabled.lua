local fabled = {
    object_loader = CardSleeves,
    object_type = "Sleeve",
    order = 0,
    key = "fabled",
    atlas = "sleeve_atlas",
    pos = { x = 0, y = 0 },
    unlocked = false,
    unlock_condition = { deck = "b_aij_fabled", stake = "stake_blue" },
    loc_vars = function(self)
        local key
        local vars = {}
        if self.get_current_deck_key() == "b_aij_fabled" then
            key = self.key .. "_alt"
            self.config = { increase_legendary_pool_rate = 0.008, extra = {}}
            vars = { }
        else
            key = self.key
            self.config = {joker_slot = -1, extra = {should_increase = true, remove_amt = 0, counterbalance = 0}}
            vars = { self.config.joker_slot }
        end
        return { key = key, vars = vars }
    end,
    apply = function(self, sleeve)
        CardSleeves.Sleeve.apply(self)
        if sleeve.config.increase_legendary_pool_rate then
            G.E_MANAGER:add_event(Event({
                trigger = "after",
                func = (function()
                    G.GAME.jest_legendary_pool.rate = G.GAME.jest_legendary_pool.rate - sleeve.config.increase_legendary_pool_rate
                    return true
                end)
            }))
        else
            G.E_MANAGER:add_event(Event({
                trigger = "after",
                func = (function()
                    G.GAME.jest_legendary_pool.in_shop = true
                    G.GAME.jest_legendary_pool.rate = G.GAME.jest_legendary_pool.rate - 0.008 -- 0.08%
                    return true
                end)
            }))
        end
    end,
    calculate = function(self, sleeve, context)

        local deck_or_sleeve = (sleeve.config.extra and sleeve.config.extra.should_increase and sleeve) or G.GAME.selected_back.effect

        if not sleeve.config.increase_legendary_pool_rate then
            if context.end_of_round and not context.repetition and not context.individual and deck_or_sleeve.config.extra.should_increase then
                 G.GAME.jest_legendary_pool.rate =  G.GAME.jest_legendary_pool.rate - 0.002
                 deck_or_sleeve.config.extra.remove_amt = deck_or_sleeve.config.extra.remove_amt + 0.002
            end
            if context.buying_card then
                if context.card.ability.set == "Joker" and context.card.config.center.rarity == 4 then
                    deck_or_sleeve.config.extra.should_increase = false
                    G.GAME.jest_legendary_pool.rate = G.GAME.jest_legendary_pool.rate + deck_or_sleeve.config.extra.remove_amt
                    deck_or_sleeve.config.extra.remove_amt = 0
                end
            end
        end
    end,
}
if next(SMODS.find_mod("CardSleeves")) then
    return { name = {"Sleeves"}, items = {fabled} }
end