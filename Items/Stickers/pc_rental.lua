local calculate_rental_ref = Card.calculate_rental
function Card:calculate_rental()
    if self.ability.aij_pc_rental then
        ease_dollars(-1)
        card_eval_status_text(self, 'dollars', -1)
    end
    return calculate_rental_ref(self)
end
local set_rental_ref = Card.set_rental
function Card:set_rental(_rental) 
    if self.config.center.set == 'Default' or self.config.center.set == 'Base' or self.config.center.set == 'Enhanced' then
        self.ability.aij_pc_rental = _rental
    else
         return set_rental_ref(self, _rental)
    end
end
local pc_rental = {
    object_type = "Sticker",
    key = "pc_rental",
	no_collection = true,
	config = { extra = {  } },
    pos = { x = 1, y = 2 },
    badge_colour = HEX 'b18f43',
    order = 1,
    apply = function(self, card, val)
        card.ability['aij_'..self.key] = val
    end,
    loc_vars = function(self, info_queue, card)
        local key, num, odds = self.key, 1, 1
        if G.GAME.all_in_jest and G.GAME.all_in_jest.sticker_effects and G.GAME.all_in_jest.sticker_effects['pc_rental'].active then
            local temp = G.GAME.all_in_jest.sticker_effects['pc_rental']
            key = self.key .. "_alt"
            num, odds = SMODS.get_probability_vars(card, temp.num, temp.odds)
        end
        return {key = key, vars = {1, num, odds}}
    end,
    inject = function(self)
        SMODS.Sticker.inject(self)
        G.shared_sticker_rental = self.sticker_sprite
    end,
}
return {name = {"Stickers"}, items = {pc_rental}}