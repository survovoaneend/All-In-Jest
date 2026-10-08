#if defined(VERTEX) || __VERSION__ > 100 || defined(GL_FRAGMENT_PRECISION_HIGH)
	#define MY_HIGHP_OR_MEDIUMP highp
#else
	#define MY_HIGHP_OR_MEDIUMP mediump
#endif

extern MY_HIGHP_OR_MEDIUMP vec2 image_dims;

uniform float card_x;
uniform int front;

vec4 effect( vec4 colour, Image texture, vec2 texture_coords, vec2 screen_coords )
{
    vec2 temp_image_details = image_dims;

    vec2 onepixel = vec2(1.0,1.0) / image_dims.xy;

    float card_width = card_x / 71.0;

    vec4 pixel = Texel(texture, texture_coords);
    vec4 next_pixel = Texel(texture, texture_coords + vec2(onepixel.x*48.0*(card_width), 0.0));
    vec4 prev_pixel = Texel(texture, texture_coords + vec2(-onepixel.x*20.0*(card_width), 0.0));

    vec2 texture_coords_unstandardised = texture_coords * image_dims;
    vec2 current_pixel_coords = vec2(mod(texture_coords_unstandardised.x, 71), mod(texture_coords_unstandardised.y, 71));
    float sprite_pos_x = texture_coords.x - current_pixel_coords.x / image_dims.x;

    float certain_pixel_x_pos = onepixel.x * 42.5 * (card_width) + (sprite_pos_x);

    vec4 certain_pixel = Texel(texture, vec2(certain_pixel_x_pos, texture_coords.y));
    if (front <= 0)
        if (certain_pixel.a == 0)
            certain_pixel = vec4(vec3(0xbf, 0xc7, 0xd5)/255, 1);
        else
            certain_pixel = vec4(certain_pixel.rgb, 1);

    vec4 return_pixel = pixel;

    if (current_pixel_coords.x > 1 && current_pixel_coords.x <= 0.3*(card_x) && ((pixel.a > 0.0) || (front > 0)))
        if ((next_pixel.a > 0.0) || (front > 0))
            return_pixel = next_pixel; 
        else
            return_pixel = certain_pixel; 
    else if (current_pixel_coords.x > 0.3*(card_x) && current_pixel_coords.x <= 0.870*(card_x) && ((pixel.a > 0.0) || (front > 0)))
        if ((prev_pixel.a > 0.0) || (front > 0))
            return_pixel = prev_pixel; 
        else
            return_pixel = certain_pixel; 
    else if (current_pixel_coords.x > 0.870*(card_x) && current_pixel_coords.x < (card_x - 1) && ((pixel.a > 0.0) || (front > 0)))
        return_pixel = certain_pixel;
    else
        return_pixel = vec4(pixel.rgb, 0);

    return return_pixel;
}