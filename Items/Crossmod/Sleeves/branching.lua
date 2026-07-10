local branching = {
    object_loader = CardSleeves,
    object_type = "Sleeve",
    order = 1,
    key = "branching",
    atlas = "sleeve_atlas",
    pos = { x = 1, y = 0 },
    unlocked = false,
    unlock_condition = { deck = "b_aij_branching", stake = "stake_blue" },
    loc_vars = function(self)
        local key
        local vars = {}
        if self.get_current_deck_key() == "b_aij_branching" then
            key = self.key .. "_alt"
            self.config = {extra = {amt = 2}}
        else
            key = self.key
            self.config = {extra = {amt = 3}}
        end
        vars = { self.config.extra.amt }
        return { key = key, vars = vars }
    end,
    apply = function(self, sleeve)
        CardSleeves.Sleeve.apply(self)
        G.E_MANAGER:add_event(Event({
            trigger = "after",
            func = (function()
                G.GAME.all_in_jest.blind_tags.has_multiple = true
                G.GAME.all_in_jest.blind_tags.amt = G.GAME.all_in_jest.blind_tags.amt + 2
                return true
            end)
        }))
    end,
}
if next(SMODS.find_mod("CardSleeves")) then
    return { name = {"Sleeves"}, items = {branching} }
end