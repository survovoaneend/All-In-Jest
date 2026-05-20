local family_tree = {
    object_type = "Joker",
    order = 533,
    key = "family_tree",
    config = {
        extra = {
            
        }
    },
    rarity = 2,
    pos = { x = 14, y = 26 },
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                
            }
        }
    end,

    calculate = function(self, card, context)
        if context.end_of_round and context.main_eval and G.GAME.blind and G.GAME.blind.boss then
            local card_to = context.blueprint_card or card
            local tag_list = {
                [1] = {
                    'tag_top_up'
                },
                [2] = {
                    'tag_uncommon'
                },
                [3] = {
                    'tag_rare'
                },
                [4] = {
                    'tag_aij_soulbound'
                }
            }
            local right_joker = nil
            for i = 1, #G.jokers.cards do
                local other_card = G.jokers.cards[i]
                if other_card == card_to and G.jokers.cards[i+1] then
                    right_joker = G.jokers.cards[i+1]
                end
            end
            if right_joker and tag_list[right_joker.config.center.rarity] then
                local tag = pseudorandom_element(tag_list[right_joker.config.center.rarity], pseudoseed('jest_family_tree_tag'))
                G.E_MANAGER:add_event(Event({
                    trigger = 'before',
                    delay = 0.0,
                    func = (function()
                        jest_add_tag(Tag(tag))
                        return true
                    end)
                }))
                card_to:juice_up(0.4, 0.4)
                play_sound('tarot1')
            end
        end
    end
}

return { name = { "Jokers" }, items = { family_tree } }
