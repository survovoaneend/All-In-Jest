local glass_delusion = {
    object_type = "Joker",
    order = 551,
    key = "glass_delusion",
    config = {
        extra = {
            odds = 2
        }
    },
    rarity = 2,
    pos = { x = 8, y = 26 },
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,

    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'glass_delusion')
        return {
            vars = {
                numerator, denominator,
            }
        }
    end,

    calculate = function(self, card, context)
        if context.remove_playing_cards then
            for k, v in pairs(context.removed) do 
                if SMODS.has_enhancement(v, 'm_glass') and v.glass_trigger then
                    v.glass_trigger = nil
                    v.shattered = nil
                    context.removed[k] = nil
                    for i = 1, 2 do
                        local new_card = SMODS.add_card {
                          key = v.config.center_key,
                          area = G.deck
                        }
                        new_card = copy_card(v, new_card)
                        new_card:add_to_deck()
                        G.playing_card = (G.playing_card and G.playing_card + 1) or 1
                        card.playing_card = G.playing_card
                        table.insert(G.playing_cards, new_card)
                    end
                end
            end
        end
    end
}

return { name = { "Jokers" }, items = { glass_delusion } }
