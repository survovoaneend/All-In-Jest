local set_eternal_ref = Card.set_eternal
function Card:set_eternal(_eternal) 
    if self.config.center.set == 'Default' or self.config.center.set == 'Base' or self.config.center.set == 'Enhanced' then
        self.ability.aij_pc_eternal = nil
        if not self.ability.aij_pc_perishable then 
            self.ability.aij_pc_eternal = _eternal
        end
    else
         return set_eternal_ref(self, _eternal)
    end
end
local pc_eternal = {
    object_type = "Sticker",
    key = "pc_eternal",
	no_collection = true,
	config = { extra = {  } },
    pos = { x = 0, y = 0 },
    badge_colour = HEX 'c75985',
    order = 1,
    inject = function(self)
        SMODS.Sticker.inject(self)
        G.shared_sticker_eternal = self.sticker_sprite
    end,
    calculate = function(self, card, context)
        if context.check_eternal and context.other_card == card then
            return {no_destroy = true}
        end
    end
}
return {name = {"Stickers"}, items = {pc_eternal}}