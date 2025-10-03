local kasperle = {
    object_type = "Joker",
    order = 112,

    key = "kasperle",
    config = {
      extra = { xmult = 3 }
    },
    rarity = 2,
    pos = { x = 7, y = 4 },
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
        local active_text = "("..localize('k_inactive')..")"
        if G.GAME.jest_kasperle_voucher_ante then 
            active_text = "("..localize('k_active')..")"
        else
            active_text = "("..localize('k_inactive')..")"
        end
        return { vars = {
            card.ability.extra.xmult,
            active_text
        }}
    end,
  
    calculate = function(self, card, context)
        if context.ante_change and context.ante_change ~= 0 then
            G.GAME.jest_kasperle_voucher_ante = false
        end
        if context.joker_main then
            if G.GAME.jest_kasperle_voucher_ante then
                return {
                    xmult = card.ability.extra.xmult
                }
            end
        end
    end
}
local redeemref = Card.redeem
function Card:redeem()
    if self.ability.set == "Voucher" then
        G.GAME.jest_kasperle_voucher_ante = true
    end
    
    local ref = redeemref(self)
    return ref
end
return { name = {"Jokers"}, items = {kasperle} }
