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
	config = { aij = { pc_sticker = true }, extra = {  } },
    pos = { x = 0, y = 0 },
    badge_colour = HEX 'c75985',
    order = 1,
    inject = function(self)
        SMODS.Sticker.inject(self)
        G.shared_sticker_eternal = self.sticker_sprite
    end,
    calculate = function(self, card, context)
        if context.remove_playing_cards then
            for i, v in ipairs(context.removed) do
                if v == card then
                    local target_area = G.discard
                    if card.area == G.hand then
                        target_area = G.hand
                    elseif card.area == G.deck then
                        target_area = G.deck
                    end
                    G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
                        local new = SMODS.copy_card(card, {area = target_area})
                        playing_card_joker_effects({new})
                        return true
                    end}))
                    break
                end
            end
        end
    end
}
return {name = {"Stickers"}, items = {pc_eternal}}