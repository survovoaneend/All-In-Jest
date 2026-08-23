local copycat = {
    object_type = "Joker",
    order = 877,

    key = "copycat",
    config = {
        rounds_held = 0,
        total_rounds = 3,
    },
    attributes = { "joker", "on_sell", "generation" }, -- Copied from Invisible Joker
    rarity = 2,
    pos = { x = 23, y = 40},
    atlas = 'joker_atlas',
    cost = 8,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = false,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.rounds_held,
                card.ability.total_rounds
            }
        }
    end,

    calculate = function(self, card, context)
        if context.end_of_round and not context.individual and not context.repetition then
            card.ability.rounds_held = card.ability.rounds_held + 1
            if card.ability.rounds_held == card.ability.total_rounds then
                local eval = function(eval_card) return not eval_card.REMOVED end
                juice_card_until(card, eval, true)
            end
            return {
                message = (card.ability.rounds_held < card.ability.total_rounds) and
                (card.ability.rounds_held .. '/' .. card.ability.total_rounds) or localize('k_active_ex'),
                colour = G.C.FILTER
            }
        end
        if context.selling_self and (card.ability.rounds_held >= card.ability.total_rounds) then
            local eval = function(eval_card) return (eval_card.ability.loyalty_remaining == 0) and not G.RESET_JIGGLES end
            juice_card_until(card, eval, true)
            if #G.jokers.cards <= G.jokers.config.card_limit then

                local copier_jokers = SMODS.get_attribute_pool("copying")
                local attempts = 0
                local copiers_pool = {}

                repeat
                    local jokers_pool = get_current_pool("Joker")
                    for i, joker_key in ipairs(jokers_pool) do
                        if G.P_CENTERS[joker_key] and G.P_CENTERS[joker_key].attributes and G.P_CENTERS[joker_key].attributes["copying"] then
                            table.insert(copiers_pool, joker_key)
                        end
                    end
                    attempts = attempts + 1
                until #copiers_pool ~= 0 or attempts > 10
                
                if #copiers_pool == 0 then
                    copiers_pool = {"j_aij_error_404"} -- Blueprint makes more sense as the default, but 404 is funnier
                end

                local chosen_joker = pseudorandom_element(copiers_pool, pseudoseed('copycat'))
                local new_card = SMODS.create_card({key = chosen_joker})
                new_card:add_to_deck()
                G.jokers:emplace(new_card)                        
                return nil, true
            else
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, { message = localize('k_no_room_ex') })
            end
        end
    end
}
return { name = {"Jokers"}, items = {copycat} }