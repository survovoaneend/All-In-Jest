local anchor = {
    object_type = "Joker",
    order = 59,
    key = "anchor",
    config = {

    },
    rarity = 2,
    pos = { x = 5, y = 2 },
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,

    loc_vars = function(self, info_queue, card)

    end,

    calculate = function(self, anchor_card, context)
        -- I probably don't need to use both joker_type_destroyed and check_eternal
        -- Limited testing suggested joker_type_destroyed didn't even work in SMODS~BETA-0827c
        -- But I'm using both anyways
        if context.joker_type_destroyed or (context.check_eternal and not context.trigger.from_sell) then
            local card_to_be_destroyed = context.card or context.other_card
            if (card_to_be_destroyed.ability.jest_sold_self) then
                -- Do not trigger on sold cards
            else
                -- Do not destroy anchors
                if (card_to_be_destroyed == anchor_card) then
                    return {
                        no_destroy = { override_compat = true }
                    }
                else
                    -- Check if anchor is to the left or right
                    local index_of_destroyed_card = 0
                    if G.jokers and G.jokers.cards then
                        for i = 1, #G.jokers.cards do
                            if G.jokers.cards[i] == card_to_be_destroyed then
                                index_of_destroyed_card = i
                            end
                        end
                    end
                    local left      = index_of_destroyed_card - 1
                    local right     = index_of_destroyed_card + 1
                    local is_nearby = (G.jokers.cards[left] == anchor_card) or (G.jokers.cards[right] == anchor_card)
                    if is_nearby then
                        return {
                            no_destroy = { override_compat = true }
                        }
                    end
                end
            end
        end
    end

}
return { name = { "Jokers" }, items = { anchor } }
