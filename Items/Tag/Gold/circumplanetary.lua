local circumplanetary_tag = {
    object_type = "Tag",
    key = 'circumplanetary',

    pos = { x = 5, y = 1 },
    atlas = 'tag_atlas',
    config = {
        aij = {
            upgrade = 'orbital',
        },
        extra = {
            times = 3,
            _tag_hand = "[most played hand]"
        }
    },

    discovered = false,
    order = 23,
    min_ante = 3,

    loc_vars = function(self, info_queue, tag)
        local _hand, _tally = nil, 0
        if G.GAME.hands and G.handlist then 
            for k, v in ipairs(G.handlist) do
                if SMODS.is_poker_hand_visible(v) and G.GAME.hands[v].played > _tally then
                    _hand = v
                    _tally = G.GAME.hands[v].played
                end
            end
        end
        return {vars = {tag.config.extra.times,_hand or tag.config.extra._tag_hand}}
    end,

    apply = function(self, tag, context)
        if context.type == 'immediate' then
            local _hand, _tally = nil, 0
            if G.GAME.hands and G.handlist then 
                for k, v in ipairs(G.handlist) do
                    if SMODS.is_poker_hand_visible(v) and G.GAME.hands[v].played > _tally then
                        _hand = v
                        _tally = G.GAME.hands[v].played
                    end
                end
            end
            if not _hand then return end
            tag:yep('+', G.C.FILTER ,function() 
                local levels = tag.config.extra.times
                update_hand_text({sound = 'button', volume = 0.7, pitch = 0.8, delay = 0.3}, {handname=localize(_hand, 'poker_hands'),chips = G.GAME.hands[_hand].chips, mult = G.GAME.hands[_hand].mult, level=G.GAME.hands[_hand].level})
                level_up_hand(nil, _hand, nil, levels)
                update_hand_text({sound = 'button', volume = 0.7, pitch = 1.1, delay = 0}, {mult = 0, chips = 0, handname = '', level = ''})
                return true
            end)
            tag.triggered = true
        end
    end,
    set_ability = function(self)
        local _hand, _tally = nil, 0
        for k, v in ipairs(G.handlist) do
            if SMODS.is_poker_hand_visible(v) and G.GAME.hands[v].played > _tally then
                _hand = v
                _tally = G.GAME.hands[v].played
            end
        end
        local poker_hand = _hand
        self.config.extra._tag_hand = poker_hand
    end, 
}
return {name = "Tags", items = {circumplanetary_tag}}
