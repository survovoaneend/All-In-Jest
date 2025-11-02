local aureate_shader = {
    object_type = "Shader",
    key = 'aureate', 
    path = 'aureate.fs',
}
SMODS.Sound {
  key = 'aureate',
  path = 'glimmer.mp3'
}
local aureate = {
    object_type = "Edition",
    key = 'aureate', 
    sound = {
        sound = 'aij_aureate',
        per = 1,
        vol = 1
    },
    order = 3,
    config = { 
        money = 0.1,
        max = 10
    },
    loc_vars = function(self, info_queue, card)
        local money
        if card and card.ability and (card.ability.set == 'Enhanced' or card.ability.set == 'Default') then
            money = to_big((((card.edition or {}).money or self.config.money)/(3/2)) + 1)
        else
            money = to_big(((card.edition or {}).money or self.config.money) + 1)
        end
        return {
            vars = {
                money,
                to_big((card.edition or {}).max or self.config.max)
            }
        }
    end,
    calculate = function(self, card, context)
        if (card.ability.set == 'Enhanced' or card.ability.set == 'Default') and (context.main_scoring and context.cardarea == G.play) then
            local mod = to_big((((card.edition or {}).money or self.config.money)/(3/2)) + 1)
            local max = to_big((card.edition or {}).max or self.config.max)
            local total_money = to_big(G.GAME.dollars)
            local money = (total_money*mod)-total_money
            if total_money > to_big(0) then
			    return {
                    dollars = to_big(math.floor(math.min(money, max))),
                    card = card,
                }
            end
        elseif context.end_of_round and card.ability.set == 'Joker' and context.main_eval then
            local mod = to_big(((card.edition or {}).money or self.config.money) + 1)
            local max = to_big((card.edition or {}).max or self.config.max)
            local total_money = to_big(G.GAME.dollars)
            local money = (total_money*mod)-total_money
            if total_money > to_big(0) then
			    return {
                    dollars = to_number(math.floor(math.min(money, max))),
                    card = card,
                }
            end
        end
	end,
    in_shop = true,
    weight = 3,
    extra_cost = 10,
    get_weight = function(self)
        return self.weight
    end,

    shader = 'aureate'
}
return {name = "Editions", items = {aureate, aureate_shader}}