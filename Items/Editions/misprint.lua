local misprint_shader = {
    object_type = "Shader",
    key = 'misprint', 
    path = 'misprint.fs',
    send_vars = function(sprite, card)
        local temp = nil
        if card.children and card.children.center and card.children.center.scale then
            temp = card.children.center.scale.x
        end
        return {
            card_x = temp,
        }
    end
}
SMODS.Sound {
  key = 'misprint',
  path = 'glimmer.mp3'
}
local misprint = {
    object_type = "Edition",
    key = 'misprint', 
    sound = {
        sound = 'aij_misprint',
        per = 1,
        vol = 1
    },
    order = 3,
    ignore = true,
    config = { 
        money = 0.3,
        max = 30
    },
    disable_base_shader = true,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                
            }
        }
    end,
    calculate = function(self, card, context)
        
	end,
    in_shop = true,
    weight = 3,
    extra_cost = 10,
    get_weight = function(self)
        return self.weight
    end,

    shader = 'misprint'
}
return {name = "Editions", items = {misprint, misprint_shader}}