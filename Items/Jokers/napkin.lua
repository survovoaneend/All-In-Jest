local napkin = {
    object_type = "Joker",
    order = 200,

    key = "napkin",
    config = {
        extra = {
            xmult_mod = 1,
            xmult = 1,
            state = false
        }
    },
    rarity = 2,
    pos = { x = 14, y = 7 },
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,
    pixel_size = { w = 69, h = 81 },

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.xmult_mod,
                card.ability.extra.xmult
            }
        }
    end,

    calculate = function(self, card, context)
        
        if context.skip_blind then
            print('skipping')
            if card.ability.extra.state then
                card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.xmult_mod
                card.ability.extra.state = false
                return {
                    message = localize('k_upgrade_ex'),
                }
            end
            if not card.ability.extra.state then
                card.ability.extra.state = true
            end
            
        end
        if context.setting_blind then
            card.ability.extra.state = false
        end
        if context.joker_main then
            return {
                xmult = card.ability.extra.xmult,
            }
        end
    end

}
return { name = { "Jokers" }, items = { napkin } }
