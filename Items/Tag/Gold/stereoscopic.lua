local stereoscopic_tag = {
    object_type = "Tag",
    key = 'stereoscopic',

    pos = { x = 9, y = 0 },
    atlas = 'tag_atlas',
    config = {
        aij = {
            upgrade = 'double',
        },
    },

    discovered = false,
    order = 18,
    min_ante = 3,

    loc_vars = function(self, info_queue, tag)
        return {vars = {}}
    end,

    apply = function(self, tag, context)
        if context.type == 'tag_add' then 
            if context.tag.key ~= 'tag_double' and context.tag.key ~= 'tag_aij_stereoscopic' then
                if not (context.tag.config.aij and context.tag.config.aij.upgrade) then
                    local _temp_gold_pool, _gold_pool_key = get_current_pool('Jest Golden Tag', nil, nil, '_gold')
                    _gold_pool = {}
                    for i = 1, #_temp_gold_pool do
                         _gold_pool[i] = _temp_gold_pool[i]
                    end
                    local tag_key = nil
                    if #_gold_pool > 0 and _gold_pool[1] == 'tag_handy' then return end
                    for i = 1, #_gold_pool do
                        if _gold_pool[i] ~= 'UNAVAILABLE' and Tag(_gold_pool[i]).config.aij then 
                            if context.tag.key == ('tag_'.. Tag(_gold_pool[i]).config.aij.upgrade) then
                                tag_key = _gold_pool[i]
                            end
                        end
                    end
                    if tag_key == nil then return end
                end
                local lock = tag.ID
                G.CONTROLLER.locks[lock] = true
                tag:yep('+', G.C.BLUE,function()
                    if context.tag.ability and context.tag.ability.orbital_hand then
                        G.orbital_hand = context.tag.ability.orbital_hand
                    end
                    if context.tag.config.aij and context.tag.config.aij.upgrade then
                        add_tag(Tag(context.tag.key))
                    else
                        add_tag(Tag(tag_key))
                    end
                    G.orbital_hand = nil
                    G.CONTROLLER.locks[lock] = nil
                    return true
                end)
                tag.triggered = true
            end
        end
    end,
}
return {name = "Tags", items = {stereoscopic_tag}}
