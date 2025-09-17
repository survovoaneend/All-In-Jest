local gold_dust_tag = {
    object_type = "Tag",
    key = 'gold_dust',

    pos = { x = 9, y = 4 },
    atlas = 'tag_atlas',
    config = {
        aij = {
            upgrade = 'aij_aureate',
        },
        extra = {
            enhance = 10
        }
    },

    discovered = false,
    order = 30,
    min_ante = 3,

    loc_vars = function(self, info_queue)
        return {vars = {self.config.extra.enhance}}
    end,

    apply = function(self, tag, context)
        if context.type == 'new_blind_choice' then
            tag:jest_apply("+", G.C.ATTENTION, function()
                for i = 1, tag.config.extra.enhance do
                    local deck_cards = {}
                    for i = 1, #G.deck.cards do
                        if G.deck.cards[i].edition == nil then
                            table.insert(deck_cards, G.deck.cards[i])
                        end
                    end
                    local playing_card = pseudorandom_element(deck_cards, pseudoseed('jest_iridescent_tag'))
                    local edition = {aij_aureate = true}
                    playing_card:set_edition(edition, true, true)
                end
                return true
			end,
            function() 
                local deck_cards = 0
                if #G.deck.cards > 0 then
                    for i = 1, #G.deck.cards do
                        if G.deck.cards[i].edition == nil then
                            deck_cards = deck_cards + 1
                        end
                    end
                end
                if deck_cards >= 10 then
                    return true
                end
                return false
            end)
            tag.triggered = true
            return true
        end
    end,
}
return {name = "Tags", items = {gold_dust_tag}}
