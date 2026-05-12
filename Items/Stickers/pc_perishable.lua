local calculate_perishable_ref = Card.calculate_perishable
function Card:calculate_perishable()
    if self.ability.aij_pc_perishable and self.ability.perish_tally > 0 then
        if self.ability.perish_tally == 1 then
            self.ability.perish_tally = 0
            card_eval_status_text(self, 'extra', nil, nil, nil, {message = localize('k_disabled_ex'),colour = G.C.FILTER, delay = 0.45})
            self:set_debuff()
        else
            self.ability.perish_tally = self.ability.perish_tally - 1
            card_eval_status_text(self, 'extra', nil, nil, nil, {message = localize{type='variable',key='a_remaining',vars={self.ability.perish_tally}},colour = G.C.FILTER, delay = 0.45})
        end
    end
    return calculate_perishable_ref(self)
end
local set_perishable_ref = Card.set_perishable
function Card:set_perishable(_perishable) 
    if self.config.center.set == 'Default' or self.config.center.set == 'Base' or self.config.center.set == 'Enhanced' then
        self.ability.aij_pc_perishable = nil
        if not self.ability.aij_pc_eternal then 
            self.ability.aij_pc_perishable = _perishable
            self.ability.perish_tally = G.GAME.perishable_rounds
        end
    else
         return set_perishable_ref(self, _perishable)
    end
end
local pc_perishable = {
    object_type = "Sticker",
    key = "pc_perishable",
	no_collection = true,
	config = { extra = {  } },
    pos = { x = 0, y = 2 },
    badge_colour = HEX '4f5da1',
    order = 1,
    apply = function(self, card, val)
        card.ability['aij_'..self.key] = val
        if card.ability['aij_'..self.key] then card.ability.perish_tally = G.GAME.perishable_rounds end
    end,
    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.perishable_rounds or 5, card.ability.perish_tally or G.GAME.perishable_rounds}}
    end,
    inject = function(self)
        SMODS.Sticker.inject(self)
        G.shared_sticker_perishable = self.sticker_sprite
    end,
    calculate = function(self, card, context)
        if context.after and context.cardarea == G.play and not context.repetition and not context.individual then
            card:calculate_perishable()
        end
    end
}
return {name = {"Stickers"}, items = {pc_perishable}}