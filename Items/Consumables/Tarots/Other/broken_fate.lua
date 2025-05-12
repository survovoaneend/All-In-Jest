local broken_fate = {
    object_type = "Consumable",
	key = 'broken_fate',
   ignore = true,
	set = 'Tarot',
	pos = { x = 6, y = 5 },
	cost = 3,
	unlocked = true,
	discovered = false,
	order = 8,
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
		local ran_amount = 0.75 + math.random(0, math.floor((2.5 - 0.75) / 0.05 + 0.5)) * 0.05
		local string = "X"..tostring(ran_amount)
        G.consumeables.cards[1].ability.jest_broken_fate_applied = {}
		table.insert(G.consumeables.cards[1].ability.jest_broken_fate_applied, ran_amount)
        jest_ability_calculate(G.consumeables.cards[1],"*", ran_amount, nil ,nil, true, false, "ability")
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
        nil,
        nil,   
        true,  
        false,    
        "ability"  
        )
    end
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
        nil,
        nil,   
        true,  
        false,    
        "ability"  
        )
    end
  end

  return sell_card_ref(self)
end
return {name = {"Tarots"}, items = {broken_fate}}