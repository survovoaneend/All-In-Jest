local ice = {
    object_type = "Enhancement",
    key = 'ice',
    atlas = 'enhancements_atlas',
    lite = true,
    order = 3,
    pos = { x = 3, y = 0 },
    config = {
        
    },
    always_scores = true,
    loc_vars = function(self, info_queue, card)
        local text = G.GAME.starting_params.play_limit or 5
        return { vars = {text} }
    end,
}
return {name = {"Enhancements"}, items = {ice}}