local heavy_sixer = {
    object_type = "Joker",
    order = 280,

    key = "heavy_sixer",
    config = {

    },
    rarity = 2,
    pos = { x = 3, y = 11 },
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = false,

    loc_vars = function(self, info_queue, card)
        if not card.edition or (card.edition and not card.edition.key == 'e_holo') then
            info_queue[#info_queue + 1] = G.P_CENTERS.e_holo
        end
    end,

    calculate = function(self, card, context)
        if context.before and not context.blueprint then
            local enhanced_a_card = false
            if context.scoring_hand and #context.scoring_hand > 0 then
                for k, v in ipairs(context.scoring_hand) do
                    if v:get_id() == 6 and not v.edition and not v.debuff then
                        v:set_edition('e_holo')
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
                    message = 'Holographic!',
                    card = card
                }
            end
        end
    end


}
return { name = { "Jokers" }, items = { heavy_sixer } }
