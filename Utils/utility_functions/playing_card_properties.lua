
local aij_smods_has_playing_card_property_ref = SMODS.has_playing_card_property
function SMODS.has_playing_card_property(card, key)
    for k, _ in pairs(All_in_Jest.get_inherent_effects(card, 'enhancement', nil, true)) do
        if G.P_CENTERS[k][key] then return true end
    end
    return aij_smods_has_playing_card_property_ref(card, key)
end

local never_scores_ref = SMODS.never_scores
function SMODS.never_scores(card)
    if card.config.aij_other_center and card.config.aij_other_center['center'] then
        if card.config.aij_other_center['center'].never_scores then return true end
    end
    return never_scores_ref(card)
end

local has_any_suit_ref = SMODS.has_any_suit
function SMODS.has_any_suit(card)
    return has_any_suit_ref(card) or All_in_Jest.counts_as_all_suits(card)
end

local always_scores_ref = SMODS.always_scores
function SMODS.always_scores(card)
    if card.ability and (card.ability.aij_always_scores or card.ability.aij_temp_always_scores) then 
        card.ability.aij_temp_always_scores = nil
        return true 
    end
    return always_scores_ref(card)
end

local is_face_ref = Card.is_face
function Card:is_face(from_boss)
    if G.GAME.blind and G.GAME.blind.config.blind.key == 'bl_aij_the_real' and not G.GAME.blind.disabled then
        if self.debuff and not from_boss then return end
        local id = self:get_id()
        local rank = SMODS.Ranks[self.base.value]
        if not id then return end
        if (id > 0 and rank and rank.face) then
            return true
        end
        return
    end
    return is_face_ref(self, from_boss)
end

local has_no_suit_ref = SMODS.has_no_suit
function SMODS.has_no_suit(card)
    if SMODS.has_any_suit(card) then return false end
    if card.base.suit == nil then return true end
    return has_no_suit_ref(card)
end

local has_no_rank_ref = SMODS.has_no_rank
function SMODS.has_no_rank(card)
    if card.base.id == nil then return true end
    if card.ability.numbertaker_rankless then return true end
    return has_no_rank_ref(card)
end

-- See lovely_hooks.toml
function All_in_Jest.get_enhancements_hook(card, extra_only, enhancements)
    if
        not extra_only and
        card.config.aij_other_center and
        card.config.aij_other_center['center'] and
        card.config.aij_other_center['center'].key
    then
        enhancements[card.config.aij_other_center['center'].key] = true
    end
    -- no return, we just modify `enhancements` table in place
end

local get_chip_bonus_ref = Card.get_chip_bonus
function Card:get_chip_bonus()
    local chip_val = get_chip_bonus_ref(self)
    if self.config.aij_other_center and self.config.aij_other_center['center'] and self.config.aij_other_center['ability'] then
        chip_val = chip_val + (self.config.aij_other_center['ability'].bonus or 0)
    end
    return chip_val
end

local set_sell_value_ref = Card.set_sell_value
function Card:set_sell_value()
    set_sell_value_ref(self)
    if self.aij_no_cost then
        self.sell_cost = self.ability.extra_value or 0
    end
end
