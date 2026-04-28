local heavenbrand = {
    object_type = "Joker",
    order = 1367,
    key = "heavenbrand_credits_joker",
    set_card_type_badge = function(self, card, badges)
		badges[#badges+1] = create_badge(localize('k_artist_badge'), HEX('007dcc'), G.C.WHITE, 1.2 )
	end,
    config = {
    },
    lite = true,
    rarity = 1,
    pos = { x = 7, y = 1},
    atlas = 'familiar_atlas',
    cost = 4,
    unlocked = true,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = false,
    no_collection = true,
  
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = {set = 'Other', key = 'heavenbrand_credits_info'}
    end,
  
    calculate = function(self, card, context)
        
    end,
    in_pool = function(self)
        return false
    end,
  
}
return { name = {"Jokers"}, items = {heavenbrand} }