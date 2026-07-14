local coupon = {
    object_type = "Back",
    key = 'coupon',
    atlas = 'deck_atlas',
    order = 4,
    pos = { x = 0, y = 1 },
    ignore = true,
    unlocked = false,
    unlock_condition = { hidden = true },
    config = {
        
    },
    loc_vars = function(self)
        return { vars = {  } }
    end,
    locked_loc_vars = function(self, info_queue, card)
        if not self.unlocked then
            return { key = "b_aij_coupon_hidden" }
        end
    end,
    check_for_unlock = function(self, args)
        -- Currently none
        return true
    end,
    apply = function(self, back)
        G.GAME.all_in_jest.weird_vouchers = true
        G.GAME.starting_params.vouchers_in_shop = G.GAME.starting_params.vouchers_in_shop + 1
    end
}
return { name = { "Decks" }, items = { coupon } }
