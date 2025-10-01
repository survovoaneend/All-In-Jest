local the_artist = {
    object_type = "Joker",
    ignore = true,
    order = 216,

    key = "the_artist",
    config = {
      extra = {
          more_selection = 1,
      }
    },
    rarity = 3,
    pos = { x = 5, y = 8},
    atlas = 'joker_atlas',
    cost = 8,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.more_selection,
                index = "0"
            }
        }
    end,

    update = function(self, card, dt)
        if G.consumeables then
            for i = 1, #G.consumeables.cards do
                if G.consumeables.cards[i] and G.consumeables.cards[i].config.center.set == 'Tarot' then
                    local index = 0
                    for j = 1, #SMODS.find_card("j_aij_the_artist") do 
                        if SMODS.find_card("j_aij_the_artist")[j] == card then
                            index = j
                        end
                    end
                    
                    if not G.consumeables.cards[i].ability.jest_the_artist_applied or (G.consumeables.cards[i].ability.jest_the_artist_applied and not G.consumeables.cards[i].ability.jest_the_artist_applied[index]) then
                        G.consumeables.cards[i].ability.jest_the_artist_applied = G.consumeables.cards[i].ability.jest_the_artist_applied or {}
                        G.consumeables.cards[i].ability.jest_the_artist_applied[index] = card.ability.extra.more_selection
                        card.ability.extra.index = tostring(index)
                        if G.consumeables.cards[i].ability.max_highlighted then
                            jest_ability_calculate(G.consumeables.cards[i],"+", card.ability.extra.more_selection, nil ,nil, true, false, "ability.consumeable")
                            G.consumeables.cards[i].ability.max_highlighted = G.consumeables.cards[i].ability.max_highlighted + card.ability.extra.more_selection
                        end
                    end
                end
            end
        end
        if G.shop_jokers and G.shop_jokers.cards then 
            for i = 1, #G.shop_jokers.cards do
                if G.shop_jokers.cards[i] and G.shop_jokers.cards[i].config.center.set == 'Tarot' then
                    local index = 0
                    for j = 1, #SMODS.find_card("j_aij_the_artist") do 
                        if SMODS.find_card("j_aij_the_artist")[j] == card then
                            index = j
                        end
                    end
                    
                    if not G.shop_jokers.cards[i].ability.jest_the_artist_applied or (G.shop_jokers.cards[i].ability.jest_the_artist_applied and not G.shop_jokers.cards[i].ability.jest_the_artist_applied[index]) then
                        G.shop_jokers.cards[i].ability.jest_the_artist_applied = G.shop_jokers.cards[i].ability.jest_the_artist_applied or {}
                        G.shop_jokers.cards[i].ability.jest_the_artist_applied[index] = card.ability.extra.more_selection
                        card.ability.extra.index = tostring(index)
                        if G.shop_jokers.cards[i].ability.max_highlighted then
                            jest_ability_calculate(G.shop_jokers.cards[i],"+", card.ability.extra.more_selection, nil ,nil, true, false, "ability.consumeable")
                            G.shop_jokers.cards[i].ability.max_highlighted = G.shop_jokers.cards[i].ability.max_highlighted + card.ability.extra.more_selection
                        end
                    end
                end
            end
        end
        if G.pack_cards and G.pack_cards.cards then
            for i = 1, #G.pack_cards.cards do
                if G.pack_cards.cards[i] and G.pack_cards.cards[i].config.center.set == 'Tarot' then
                    local index = 0
                    for j = 1, #SMODS.find_card("j_aij_the_artist") do 
                        if SMODS.find_card("j_aij_the_artist")[j] == card then
                            index = j
                        end
                    end
                    
                    if not G.pack_cards.cards[i].ability.jest_the_artist_applied or (G.pack_cards.cards[i].ability.jest_the_artist_applied and not G.pack_cards.cards[i].ability.jest_the_artist_applied[index]) then
                        G.pack_cards.cards[i].ability.jest_the_artist_applied = G.pack_cards.cards[i].ability.jest_the_artist_applied or {}
                        G.pack_cards.cards[i].ability.jest_the_artist_applied[index] = card.ability.extra.more_selection
                        card.ability.extra.index = tostring(index)
                        if G.pack_cards.cards[i].ability.max_highlighted then
                            jest_ability_calculate(G.pack_cards.cards[i],"+", card.ability.extra.more_selection, nil ,nil, true, false, "ability.consumeable")
                            G.pack_cards.cards[i].ability.max_highlighted = G.pack_cards.cards[i].ability.max_highlighted + card.ability.extra.more_selection
                        end
                    end
                end
            end
        end
    end,

    remove_from_deck = function(self, card, from_debuff)
        if G.consumeables then
            for i = 1, #G.consumeables.cards do
                if G.consumeables.cards[i] and G.consumeables.cards[i].config.center.set == 'Tarot' then
                    if G.consumeables.cards[i].ability and G.consumeables.cards[i].ability.jest_the_artist_applied and G.consumeables.cards[i].ability.consumeable.max_highlighted then
                        for k, v in pairs(G.consumeables.cards[i].ability.jest_the_artist_applied) do
                            if k == tonumber(card.ability.extra.index) then
                                if v then
                                    jest_ability_calculate(
                                    G.consumeables.cards[i],
                                    "-", v,
                                    nil,
                                    nil,   
                                    true,  
                                    false,    
                                    "ability.consumeable"  
                                    )
                                end
                            end
                        end
                        G.consumeables.cards[i].ability.max_highlighted = G.consumeables.cards[i].ability.max_highlighted - card.ability.extra.more_selection
                    end
                end
            end
        end
        if G.shop_jokers and G.shop_jokers.cards then 
            for i = 1, #G.shop_jokers.cards do
                if G.shop_jokers.cards[i] and G.shop_jokers.cards[i].config.center.set == 'Tarot' then
                    if G.shop_jokers.cards[i].ability and G.shop_jokers.cards[i].ability.jest_the_artist_applied and G.shop_jokers.cards[i].ability.consumeable.max_highlighted then
                        for k, v in pairs(G.shop_jokers.cards[i].ability.jest_the_artist_applied) do
                            if k == tonumber(card.ability.extra.index) then
                                if v then
                                    jest_ability_calculate(
                                    G.shop_jokers.cards[i],
                                    "-", v,
                                    nil,
                                    nil,   
                                    true,  
                                    false,    
                                    "ability.consumeable"  
                                    )
                                end
                            end
                        end
                        G.shop_jokers.cards[i].ability.max_highlighted = G.shop_jokers.cards[i].ability.max_highlighted - card.ability.extra.more_selection
                    end
                end
            end
        end
        if G.pack_cards and G.pack_cards.cards then
            for i = 1, #G.pack_cards.cards do
                if G.pack_cards.cards[i] and G.pack_cards.cards[i].config.center.set == 'Tarot' then
                    if G.pack_cards.cards[i].ability and G.pack_cards.cards[i].ability.jest_the_artist_applied and G.pack_cards.cards[i].ability.consumeable.max_highlighted then
                        for k, v in pairs(G.pack_cards.cards[i].ability.jest_the_artist_applied) do
                            if k == tonumber(card.ability.extra.index) then
                                if v then
                                    jest_ability_calculate(
                                    G.pack_cards.cards[i],
                                    "-", v,
                                    nil,
                                    nil,   
                                    true,  
                                    false,    
                                    "ability.consumeable"  
                                    )
                                end
                            end
                        end
                        G.pack_cards.cards[i].ability.max_highlighted = G.pack_cards.cards[i].ability.max_highlighted - card.ability.extra.more_selection
                    end
                end
            end
        end
	end,
}
local use_consumeable_ref = Card.use_consumeable
function Card:use_consumeable(area, copier)
  if self.ability and self.ability.jest_the_artist_applied and self.ability.consumeable.max_highlighted then
    for k, v in pairs(self.ability.jest_the_artist_applied) do
        if v then
            jest_ability_calculate(
            self,
            "-", v,
            nil,
            nil,   
            true,  
            false,    
            "ability.consumeable"  
            )
        end
    end
  end

  return use_consumeable_ref(self, area, copier)
end
local sell_card_ref = Card.sell_card
function Card:sell_card()
  if self.ability and self.ability.jest_the_artist_applied and self.ability.consumeable.max_highlighted then
    for k, v in pairs(self.ability.jest_the_artist_applied) do
        if v then
            jest_ability_calculate(
            self,
            "-", v,
            nil,
            nil,   
            true,  
            false,    
            "ability.consumeable"  
            )
        end
    end
  end

  return sell_card_ref(self)
end
return { name = {"Jokers"}, items = {the_artist} }