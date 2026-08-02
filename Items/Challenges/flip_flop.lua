local flip_flop = {
    object_type = "Challenge",
    key = 'flip_flop',
    unlocked = function(self) 
        if to_big(G.GAME.dollars) < to_big(0) then
            return true 
        end
    end,
    rules = {
        custom = {
            {id = 'aij_money_times_negative'},
        },
    },
    calculate = function(self, context)
        if context.end_of_round and context.main_eval then
            G.GAME.dollars = G.GAME.dollars * -1
        end
    end
}
return { name = {"Challenges"}, items = {flip_flop} }