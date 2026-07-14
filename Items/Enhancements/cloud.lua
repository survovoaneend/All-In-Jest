local cloud = {
    object_type = "Enhancement",
    key = 'cloud',
    atlas = 'enhancements_atlas',
    order = 12,
    pos = { x = 9, y = 5 },
    ignore = true,
    config = {
        extra = {
            
        }
    },
    all_in_jest = {
        multi_enhancement_z_order = -1
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                
            }
        }
    end,
    calculate = function(self, card, context)
        
    end,

    in_pool = function(self, args)
        if G.GAME then
            if G.GAME.all_in_jest and G.GAME.all_in_jest.weird_enhancements then
                return true
            end
        end
        return false
    end,
}

return {name = {"Enhancements"}, items = {cloud}}