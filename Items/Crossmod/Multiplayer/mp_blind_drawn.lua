local function update_blind_HUD()
	if MP.LOBBY.code and MP.is_pvp_boss() then
    G.HUD_blind:get_UIE_by_ID("dollars_to_be_earned").config.object.config.string =
      next(SMODS.find_card("j_aij_mp_blind_drawn")) and { { ref_table = {hands = "?"}, ref_value = "hands" } } or 
      { { ref_table = MP.GAME.enemy, ref_value = "hands" } }
    G.HUD_blind:get_UIE_by_ID("dollars_to_be_earned").config.object:update_text()
	end
end

local mp_blind_drawn = {
    object_type = "Joker",
    order = 126,
    
    key = "mp_blind_drawn",
	  no_collection = true,
    config = {
        extra = {
            Xmult = 3
        }, 
        mp_sticker_balanced = true
    },
    rarity = 2,
    pos = { x = 20, y = 4 },
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,

    add_to_deck = function(self, card, from_debuff)
        -- Needs an event so that SMODS.find_card returns this card
        G.E_MANAGER:add_event(Event({
            trigger = 'immediate',
            func = function()
                update_blind_HUD() -- Updates dynamic score requirement
                return true
            end
        }))
    end,

    remove_from_deck = function(self, card, from_debuff)
        update_blind_HUD() -- Updates dynamic score requirement
    end,
  
    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.Xmult}}
    end,
  
    calculate = function(self, card, context)
        if context.joker_main then
            return {
                xmult = card.ability.extra.Xmult,
            }
        end
    end,

    mp_include = function(self)
		    return MP.UTILS.is_standard_ruleset() and MP.LOBBY.code
    end,
  
}
if next(SMODS.find_mod("Multiplayer")) then
    return { name = {"Jokers"}, items = {mp_blind_drawn} }
end