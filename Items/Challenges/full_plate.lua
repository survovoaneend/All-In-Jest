local full_plate = {
    object_type = "Challenge",
    key = 'full_plate',
    unlocked = function(self) 
        if G and G.P_CENTERS then
            local food = 0
            for k, v in pairs(G.P_CENTERS) do
                if v.attributes and v.attributes.food and v.discovered == true then
                    food = food + 1
                end
            end
            if food >= 20 then
                return true 
            end
        end
    end,
    ignore = true,
    rules = {
        custom = {
            {id = 'aij_all_jokers_is_food'},
        },
    },
}
return { name = {"Challenges"}, items = {full_plate} }