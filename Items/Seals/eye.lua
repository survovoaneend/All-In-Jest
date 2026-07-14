local eye = {
    object_type = "Seal",
    key = 'eye',
    config = {
        extra = {
            
        },
    },
    atlas = 'enhancements_atlas',
    pos = { x = 7, y = 4 },
    badge_colour = HEX("5c6284"),
    order = 2,
    loc_vars = function(self, info_queue, card)
        return { vars = {  } }
    end,
    calculate = function(self, card, context)
        
    end
}
return {name = {"Seals"}, items = {eye}}