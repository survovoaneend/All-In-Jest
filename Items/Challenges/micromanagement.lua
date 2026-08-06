local micromanagement = {
    object_type = "Challenge",
    key = 'micromanagement',
    unlocked = function(self) 
        if G and G.P_CENTERS and G.P_CENTERS['j_aij_office_assistant'].discovered == true then
            return true 
        end
    end,
    jokers = {
        { id = 'j_aij_office_assistant', eternal = true, edition = 'negative' },
    },
    rules = {
        custom = {
            {id = 'aij_all_jokers_perishable_1'},
            {id = 'aij_all_jokers_perishable_2'},
        },
    },
    apply = function(self) 
        G.GAME.perishable_rounds = 2
    end,
}
return { name = {"Challenges"}, items = {micromanagement} }