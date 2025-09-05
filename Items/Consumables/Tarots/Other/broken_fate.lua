local broken_fate = {
    object_type = "Consumable",
	key = 'broken_fate',
    ignore = true,
	set = 'Tarot',
	pos = { x = 6, y = 5 },
    set_card_type_badge = function(self, card, badges)
		badges[#badges+1] = create_badge(localize('k_tarot_q'), G.C.SECONDARY_SET.Tarot, G.C.WHITE, 1.2 )
	end,
	cost = 3,
	unlocked = true,
	discovered = false,
	order = 23,
	config = { },
	atlas = 'consumable_atlas',
	loc_vars = function(self, info_queue, card)
		
	end,
	can_use = function(self, card, area, copier)
        if G.consumeables and #G.consumeables.cards > 0 and G.consumeables.cards[1].config.center.key ~= "c_aij_broken_fate" then
            return true 
        end
    end,
    use = function(self, card)
		local ran_amount = 0.75 + (math.random(0, math.floor(((2.5 - 0.75) / 0.05) + 0.5)) * 0.05)
        G.consumeables.cards[1].ability.jest_broken_fate_applied = G.consumeables.cards[1].ability.jest_broken_fate_applied or {}
        local index = #G.consumeables.cards[1].ability.jest_broken_fate_applied + 1
		G.consumeables.cards[1].ability.jest_broken_fate_applied[#G.consumeables.cards[1].ability.jest_broken_fate_applied + 1] = ran_amount
        local string = "X"..tostring(G.consumeables.cards[1].ability.jest_broken_fate_applied[index])
        jest_ability_calculate(G.consumeables.cards[1],"*", G.consumeables.cards[1].ability.jest_broken_fate_applied[index], {G.consumeables.cards[1].ability.jest_broken_fate_applied},nil, true, false, "ability")
		card_eval_status_text(G.consumeables.cards[1], 'extra', nil, nil, nil, {message = string, colour = G.C.FILTER})
    end,
}
local use_consumeable_ref = Card.use_consumeable
function Card:use_consumeable(area, copier)
  if self.ability and self.ability.jest_broken_fate_applied and #self.ability.jest_broken_fate_applied > 0 then
    for i = 1, #self.ability.jest_broken_fate_applied do
        jest_ability_calculate(
        self,
        "/", self.ability.jest_broken_fate_applied[i],
        {self.ability.jest_broken_fate_applied},
        nil,   
        true,  
        false,    
        "ability"  
        )
    end
    self.ability.jest_broken_fate_applied = nil
  end

  return use_consumeable_ref(self, area, copier)
end
local sell_card_ref = Card.sell_card
function Card:sell_card()
  if self.ability and self.ability.jest_broken_fate_applied and #self.ability.jest_broken_fate_applied > 0 then
    for i = 1, #self.ability.jest_broken_fate_applied do
        jest_ability_calculate(
        self,
        "/", self.ability.jest_broken_fate_applied[i],
        {self.ability.jest_broken_fate_applied},
        nil,   
        true,  
        false,    
        "ability"  
        )
    end
    self.ability.jest_broken_fate_applied = nil
  end

  return sell_card_ref(self)
end
return {name = {"Tarots"}, items = {broken_fate}}