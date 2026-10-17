#if defined(VERTEX) || __VERSION__ > 100 || defined(GL_FRAGMENT_PRECISION_HIGH)
	#define MY_HIGHP_OR_MEDIUMP highp
#else
	#define MY_HIGHP_OR_MEDIUMP mediump
#endif

extern MY_HIGHP_OR_MEDIUMP vec2 image_dims;

vec3 rgbToHsv(vec3 c) {
    float maxC = max(c.r, max(c.g, c.b));
    float minC = min(c.r, min(c.g, c.b));
    float delta = maxC - minC;

    float h = 0.0;
    if (delta > 0.0) {
        if (maxC == c.r) h = mod((c.g - c.b) / delta, 6.0);
        else if (maxC == c.g) h = (c.b - c.r) / delta + 2.0;
        else h = (c.r - c.g) / delta + 4.0;
        h /= 6.0;
    }
    float s = maxC == 0.0 ? 0.0 : delta / maxC;
    return vec3(h, s, maxC);
}

// Convert HSV to RGB
vec3 hsvToRgb(vec3 hsv) {
    float h = hsv.x * 6.0;
    float s = hsv.y;
    float v = hsv.z;

    float c = v * s;
    float x = c * (1.0 - abs(mod(h, 2.0) - 1.0));
    vec3 rgb;

    if (h < 1.0) rgb = vec3(c, x, 0.0);
    else if (h < 2.0) rgb = vec3(x, c, 0.0);
    else if (h < 3.0) rgb = vec3(0.0, c, x);
    else if (h < 4.0) rgb = vec3(0.0, x, c);
    else if (h < 5.0) rgb = vec3(x, 0.0, c);
    else rgb = vec3(c, 0.0, x);

    return rgb + (v - c);
}

vec4 effect( vec4 colour, Image texture, vec2 texture_coords, vec2 screen_coords )
{
    vec4 pixel = Texel(texture, texture_coords);

    vec2 texture_coords_unstandardised = texture_coords * image_dims;

    vec4 down_right_pixel = Texel(texture, (texture_coords_unstandardised + vec2(1, 1)) / image_dims);
    vec4 up_left_pixel = Texel(texture, (texture_coords_unstandardised - vec2(1, 1)) / image_dims);

    vec4 return_pixel = pixel;

    if (pixel.a > 0) {
        if (up_left_pixel.a > 0) {
            // Multiply with highlight colour
            return_pixel.rgb = return_pixel.rgb * vec3(242, 215, 169) / 0xff;
        } else {
            // Multiply with shadow colour
            return_pixel.rgb = return_pixel.rgb * vec3(117, 95, 87) / 0xff;
        }

        vec3 hsv = rgbToHsv(return_pixel.rgb);
        hsv.g = hsv.g * 0.75;
        return_pixel.rgb = hsvToRgb(hsv);
        // return_pixel.a = pixel.a * 0.9;
    }
        
    else if (up_left_pixel.a > 0)
        return_pixel = vec4(vec3(242, 215, 169)/0xff, up_left_pixel.a);
    else if (down_right_pixel.a > 0)
        return_pixel = vec4(vec3(117, 95, 87)/0xff, down_right_pixel.a);
            
    return return_pixel;
}