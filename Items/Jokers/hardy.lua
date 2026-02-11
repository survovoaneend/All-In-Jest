local hardy = {
    object_type = "Joker",
    order = 1068,
    key = "hardy",
    config = {
       
    },
    rarity = 4,
    pos = { x = 4, y = 12 },
    atlas = 'legendary_atlas',
    cost = 20,
    unlocked = false,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,
    soul_pos = { x = 4, y = 13 },

    loc_vars = function(self, info_queue, card)
        
    end,

    calculate = function(self, card, context)
         if context.before and not context.blueprint then
            local enhanced_a_card = false
            if context.scoring_hand and #context.scoring_hand > 0 then
                for k, v in ipairs(context.scoring_hand) do
                    if  next(SMODS.get_enhancements(v)) and not v.edition and not v.debuff then
                        v:set_edition('e_aij_silver')
                        enhanced_a_card = true
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                if v and not v.removed then
                                    v:juice_up()
                                end
                                return true
                            end
                        }))
                    end
                end
            end



            if enhanced_a_card then
                return {
                    message = localize("aij_silver", "labels") .. "!",
                    colour = G.C.GREY
                }
            end
        end
    end,
}
return { name = { "Jokers" }, items = { hardy } }