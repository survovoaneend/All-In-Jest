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
    vec4 next_pixel = Texel(texture, texture_coords + vec2(onepixel.x*52.0*(card_width), 0.0));
    vec4 prev_pixel = Texel(texture, texture_coords + vec2(-onepixel.x*20.0*(card_width), 0.0));

    vec2 texture_coords_unstandardised = texture_coords * image_dims;
    vec2 current_pixel_coords = vec2(mod(texture_coords_unstandardised.x, 71), mod(texture_coords_unstandardised.y, 71));
    float sprite_pos_x = texture_coords.x - current_pixel_coords.x / image_dims.x;

    float certain_pixel_x_pos = onepixel.x * 42.5 * (card_width) + (sprite_pos_x);

    vec4 certain_pixel = Texel(texture, vec2(certain_pixel_x_pos, texture_coords.y));
    if (front <= 0)
        certain_pixel = vec4(certain_pixel.rgb, 1);

    vec4 return_pixel = pixel;

    if (current_pixel_coords.x > 1 && current_pixel_coords.x <= (0.24*(card_x)-2)&& ((pixel.a > 0.0) || (front > 0)))
        if ((next_pixel.a > 0.0) || (front > 0))
            return_pixel = next_pixel; 
        else
            return_pixel = certain_pixel; 
    else if (current_pixel_coords.x > (0.24*(card_x) - 2) && current_pixel_coords.x <= 0.3*(card_x) && ((pixel.a > 0.0) && (front <= 0)))
        
        if (current_pixel_coords.y > 24 && current_pixel_coords.y <= 39 && ((pixel.a > 0.0) && (front <= 0)))
            return_pixel = vec4(certain_pixel.rgb, pixel.a);

        // if (current_pixel_coords.y > 4 && current_pixel_coords.y <= 9 && ((pixel.a > 0.0) && (front <= 0)))
        //     return_pixel = vec4(vec3(0xfd, 0x5f, 0x55) / 255.0, pixel.a);
        
        // else if (current_pixel_coords.y > 9 && current_pixel_coords.y <= 14 && ((pixel.a > 0.0) && (front <= 0)))
        //     return_pixel = vec4(vec3(0x00, 0x9c, 0xfd) / 255.0, pixel.a);
        
        // else if (current_pixel_coords.y > 14 && current_pixel_coords.y <= 19 && ((pixel.a > 0.0) && (front <= 0)))
        //     return_pixel = vec4(vec3(0xfd, 0xa2, 0x00) / 255.0, pixel.a);
        
        else if (current_pixel_coords.y > 43 && current_pixel_coords.y <= 48 && ((pixel.a > 0.0) && (front <= 0)))
            return_pixel = vec4(vec3(0x4f, 0x63, 0x67) / 255.0, pixel.a);
        
        else if (current_pixel_coords.y > 48 && current_pixel_coords.y <= 53 && ((pixel.a > 0.0) && (front <= 0)))
            return_pixel = vec4(vec3(0x7a, 0x8e, 0x92) / 255.0, pixel.a);
        
        else if (current_pixel_coords.y > 53 && current_pixel_coords.y <= 58 && ((pixel.a > 0.0) && (front <= 0)))
            return_pixel = vec4(vec3(0xa2, 0xb4, 0xb8) / 255.0, pixel.a);
        
        else if (current_pixel_coords.y > 58 && current_pixel_coords.y <= 63 && ((pixel.a > 0.0) && (front <= 0)))
            return_pixel = vec4(vec3(0xd2, 0xdf, 0xe1) / 255.0, pixel.a);
        
        else if (current_pixel_coords.y > 63 && current_pixel_coords.y <= 68 && ((pixel.a > 0.0) && (front <= 0)))
            return_pixel = vec4(vec3(0xec, 0xf4, 0xf5) / 255.0, pixel.a);
        

        else if (current_pixel_coords.y > 68 && current_pixel_coords.y <= 84 && ((pixel.a > 0.0) && (front <= 0)))
            return_pixel = vec4(certain_pixel.rgb, pixel.a);

        // else if (current_pixel_coords.y > 48 && current_pixel_coords.y <= 49 && ((pixel.a > 0.0) && (front <= 0)))
        //     return_pixel = vec4(vec3(0xfd, 0x5f, 0x55) / 255.0, pixel.a);
        
        // else if (current_pixel_coords.y > 49 && current_pixel_coords.y <= 50 && ((pixel.a > 0.0) && (front <= 0)))
        //     return_pixel = vec4(vec3(0x00, 0x9c, 0xfd) / 255.0, pixel.a);
        
        // else if (current_pixel_coords.y > 50 && current_pixel_coords.y <= 51 && ((pixel.a > 0.0) && (front <= 0)))
        //     return_pixel = vec4(vec3(0xfd, 0xa2, 0x00) / 255.0, pixel.a);
        
        // else if (current_pixel_coords.y > 51 && current_pixel_coords.y <= 52 && ((pixel.a > 0.0) && (front <= 0)))
        //     return_pixel = vec4(vec3(0x4f, 0x63, 0x67) / 255.0, pixel.a);
        
        // else if (current_pixel_coords.y > 52 && current_pixel_coords.y <= 53 && ((pixel.a > 0.0) && (front <= 0)))
        //     return_pixel = vec4(vec3(0x7a, 0x8e, 0x92) / 255.0, pixel.a);
        
        // else if (current_pixel_coords.y > 53 && current_pixel_coords.y <= 54 && ((pixel.a > 0.0) && (front <= 0)))
        //     return_pixel = vec4(vec3(0xa2, 0xb4, 0xb8) / 255.0, pixel.a);
        
        // else if (current_pixel_coords.y > 54 && current_pixel_coords.y <= 55 && ((pixel.a > 0.0) && (front <= 0)))
        //     return_pixel = vec4(vec3(0xd2, 0xdf, 0xe1) / 255.0, pixel.a);
        
        // else if (current_pixel_coords.y > 55 && current_pixel_coords.y <= 56 && ((pixel.a > 0.0) && (front <= 0)))
        //     return_pixel = vec4(vec3(0xec, 0xf4, 0xf5) / 255.0, pixel.a);
        
        else
            return_pixel = vec4(1, 1, 1, pixel.a);
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