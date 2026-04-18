local pog = {
    object_type = "Joker",
    order = 366,
    key = "pog",
    config = {
        extra = {
            
        }
    },
    rarity = 2,
    pos = { x = 4, y = 17 },
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                
            }
        }
    end,

    pixel_size = { w = 55, h = 55 },

    update = function(self, card, dt)
        if G.booster_pack then
            local skip_button = aij_get_UIE_by_fob(G.booster_pack.UIRoot, 'can_skip_booster')
            if not skip_button.UIBox:get_UIE_by_ID('tag_desc') then
                local _tag = jest_poll_tag("pog")
                local _tag_ui, _tag_sprite = _tag:generate_UI()
                local item = {n=G.UIT.C, config={id = 'tag_desc', scale = 0.5, align = "bm", ref_table = _tag.key}, nodes={
                    _tag_ui
                }}
                skip_button.UIBox:add_child(item, skip_button)
            end
        end
    end,

    calculate = function(self, card, context)
        if context.skipping_booster then
            local skip_button = aij_get_UIE_by_fob(G.booster_pack.UIRoot, 'can_skip_booster')
            local ref = skip_button.UIBox:get_UIE_by_ID('tag_desc').config.ref_table
            if ref ~= 'aij_hbskipped' then
                G.E_MANAGER:add_event(Event({
                    trigger = 'before',
                    delay = 0.0,
                    func = (function()
                        jest_add_tag(Tag(ref))
                        return true
                    end)
                }))
                card:juice_up(0.4, 0.4)
                play_sound('tarot1')
                skip_button.UIBox:get_UIE_by_ID('tag_desc').config.ref_table = 'aij_hbskipped'
            end
        end
    end
}
return { name = { "Jokers" }, items = { pog } }
