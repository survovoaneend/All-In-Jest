local alien_joker = {
    object_type = "Joker",
    order = 338,
    key = "alien_joker",
    config = {
      extra = {
          xmult = 3,
      }
    },
    rarity = 2,
    pos = { x = 9, y = 13},
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.xmult,
            }
        }
    end,
  
    calculate = function(self, card, context)
        if context.hand_drawn and G.STATE == G.STATES.DRAW_TO_HAND then
            local any_forced_by_alien = false -- Adds check to ensure a card is only force selected if this joker is not already force selecting a card
            local valid_cards = {}
            for _, v in ipairs(G.hand.cards) do
                if v.ability.alien_joker_highlight == card.unique_val then
                    any_forced_by_alien = true
                end
                if not v.ability.forced_selection then
                    table.insert(valid_cards, v)
                end
            end
            if not any_forced_by_alien then
                local temp_card = pseudorandom_element(valid_cards, pseudoseed('aij_alien_joker'))
                temp_card.ability.alien_joker_highlight = card.unique_val -- We set this to keep track of what alien joker is force selecting even through debuffs
                temp_card.ability.forced_selection = true
                card:juice_up()
            end
        end
        if context.individual and context.cardarea == G.play then
            context.other_card.ability.alien_joker_highlight = nil
            if context.other_card.ability.forced_selection then
                return {
                    xmult = card.ability.extra.xmult
                }
            end
        end
        if context.end_of_round and context.main_eval then
            for _, v in ipairs(G.playing_cards) do
                if v.ability.alien_joker_highlight then
                    v.ability.alien_joker_highlight = nil
                    v.ability.forced_selection = nil
                end
            end
        end
        if context.discard then
            if context.other_card.ability.alien_joker_highlight then
                context.other_card.ability.alien_joker_highlight = nil
                context.other_card.ability.forced_selection = nil
            end
        end
    end,

    add_to_deck = function(self, card, from_debuff)
        local any_forced_by_alien = false -- Adds check to ensure a card is only force selected if this joker is not already force selecting a card
        local valid_cards = {}
        for _, v in ipairs(G.hand.cards) do
            if v.ability.alien_joker_highlight == card.unique_val then
                any_forced_by_alien = true
            end
            if not v.ability.forced_selection then
                table.insert(valid_cards, v)
            end
        end

        if not any_forced_by_alien and #valid_cards > 0 then
            local temp_card = pseudorandom_element(valid_cards, pseudoseed('aij_alien_joker'))
            temp_card.ability.alien_joker_highlight = card.unique_val -- We set this to keep track of what alien joker is force selecting even through debuffs
            temp_card.ability.forced_selection = true
        elseif from_debuff then
            for _, v in ipairs(G.playing_cards) do
                if v.ability.alien_joker_highlight == card.unique_val then
                    v.ability.forced_selection = true
                end
            end
        end
    end,

    remove_from_deck = function(self, card, from_debuff)
        for _, v in ipairs(G.playing_cards) do
            if v.ability.alien_joker_highlight == card.unique_val then
                if not from_debuff then -- Only remove variable that tracks which card is force selected when sold/destroyed so that the same card will be force selected when undebuffed
                    v.ability.alien_joker_highlight = nil
                end
                v.ability.forced_selection = nil
            end
        end
    end
  
}

-- Override some stuff with Cerulean Bell to work better with this joker

local aij_play_cards_from_highlighted_ref = G.FUNCS.play_cards_from_highlighted

G.FUNCS.play_cards_from_highlighted = function(e)
    local forced_cards = {}
    for k, v in ipairs(G.playing_cards) do
        if v.ability.forced_selection then
            table.insert(forced_cards, v)
        end
    end

    local ret = aij_play_cards_from_highlighted_ref(e)

    for _, v in ipairs(forced_cards) do
        v.ability.forced_selection = true
    end

    return ret
end

-- By default Cerulean Bell removes force selection from all cards when disabled
-- This adds it back for cards force selected by Alien Joker
local aij_Blind_disable_ref = Blind.disable
function Blind:disable()
    local ret = aij_Blind_disable_ref(self)
    for k, v in ipairs(G.playing_cards) do
        if v.ability.alien_joker_highlight then
            v.ability.forced_selection = true
        end
    end
    return ret
end

-- By default Bell will not force select if an existing card is already force selected by another effect
-- This adds a check for Alien Joker only
local aij_Blind_drawn_to_hand_ref = Blind.drawn_to_hand
function Blind:drawn_to_hand()
    local ret = aij_Blind_drawn_to_hand_ref(self)
    if not self.disabled and self.name == 'Cerulean Bell' then
        local any_forced_by_bell = false
        local valid_cards = {}
        for k, v in ipairs(G.hand.cards) do
            if v.ability.forced_selection and not v.ability.alien_joker_highlight then
                any_forced_by_bell = true
            end
            if not v.ability.forced_selection then
                table.insert(valid_cards, v)
            end
        end
        if not any_forced_by_bell and #valid_cards > 0 then
            G.hand:unhighlight_all()
            local forced_card = pseudorandom_element(valid_cards, pseudoseed('cerulean_bell'))
            forced_card.ability.forced_selection = true
            G.hand:add_to_highlighted(forced_card)
        end
    end
    return ret
end

return { name = {"Jokers"}, items = {alien_joker} }
