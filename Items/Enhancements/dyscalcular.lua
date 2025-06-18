local dyscalcular = {
    object_type = "Enhancement",
    key = 'dyscalcular',
    atlas = 'enhancements_atlas',
    order = 0,
    pos = { x = 1, y = 0 },
    config = {
        
    },
    ignore = true,
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = {set = 'Other', key = 'm_aij_dyscalcular_numbered_rank'}
    end,
    calculate = function(self, card, context)
        
    end
}
return {name = {"Enhancements"}, items = {dyscalcular}}