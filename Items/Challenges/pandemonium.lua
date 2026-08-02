local pandemonium = {
    object_type = "Challenge",
    key = 'pandemonium',
    unlocked = function(self) 
        if G and G.P_TAGS and G.P_TAGS['tag_aij_chaos'].discovered == true then
            return true 
        end
    end,
    rules = {
        custom = {
            {id = 'aij_pandemonium_1'},
            {id = 'aij_pandemonium_2'},
        },
    },
}
return { name = {"Challenges"}, items = {pandemonium} }