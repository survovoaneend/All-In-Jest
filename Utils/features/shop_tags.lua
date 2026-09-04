
-- Function that defines when the tag area in the shop should appear (or not)
All_in_Jest.show_shop_aij_tags = function(e)
    return next(SMODS.find_card("j_aij_ijoker_co")) or next(SMODS.find_card("j_aij_death_of_a_salesman"))
end