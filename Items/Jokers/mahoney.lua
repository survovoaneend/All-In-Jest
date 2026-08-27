local mahoney = {
    object_type = "Joker",
    order = 283,

    key = "mahoney",
    config = {
      extra = {
        trigger = false
      }
    },
    attributes = { 'voucher', 'skip' },
    rarity = 2,
    pos = { x = 24, y = 10},
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
  
    calculate = function(self, card, context)
        -- prevent tags from triggering while voucher animation is happening
        if context.prevent_tag_trigger and card.ability.extra.trigger then
            return {prevent_trigger = true}
        end
        if context.skip_blind then
            card.ability.extra.trigger = true
            G.E_MANAGER:add_event(Event{func = function()
                local _pool = get_current_pool('Voucher')
                local center = pseudorandom_element(_pool, pseudoseed('mahoney'))
                local it = 1
                while center == 'UNAVAILABLE' or (G.GAME.current_round.voucher and G.GAME.current_round.voucher.spawn[center]) do
                    it = it + 1
                    center = pseudorandom_element(_pool, pseudoseed('mahoney_resample'..it))
                end
                local voucher = Card(G.play.T.x + 0.5*(G.play.T.w - G.CARD_W), G.play.T.y, G.CARD_W, G.CARD_H, G.P_CARDS.empty, G.P_CENTERS[center], {bypass_discovery_center = true, bypass_discovery_ui = true})
                voucher.cost = 0
                G.FUNCS.use_card({config = {ref_table = voucher}})
                card:juice_up()
                voucher:start_materialize()
                G.E_MANAGER:add_event(Event{func = function()
                    -- voucher animation is done, trigger any tags that were supposed to trigger now
                    card.ability.extra.trigger = false
                    for i = 1, #G.GAME.tags do
                        if G.GAME.tags[i]:apply_to_run({type = 'new_blind_choice'}) then break end
                    end
                    return true
                end})
                return true
            end})
        end
    end
  
}
return { name = {"Jokers"}, items = {mahoney} }
