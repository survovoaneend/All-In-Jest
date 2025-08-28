local patchwork = {
    object_loader = CardSleeves,
    object_type = "Sleeve",
    order = 2,
    key = "patchwork",
    atlas = "sleeve_atlas",
    pos = { x = 3, y = 0 },
    unlocked = false,
    unlock_condition = { deck = "b_aij_patchwork", stake = "stake_blue" },
    loc_vars = function(self)
        local key
        local vars = {}
        if self.get_current_deck_key() == "b_aij_patchwork" then
            key = self.key .. "_alt"
        else
            key = self.key
        end
        return { key = key, vars = vars }
    end,
}
if next(SMODS.find_mod("CardSleeves")) then
    return { name = {"Sleeves"}, items = {patchwork} }
end