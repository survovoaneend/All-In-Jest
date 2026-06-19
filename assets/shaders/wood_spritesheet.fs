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

    vec4 tex = vec4(1., 1., 1., 0.1);

    pixel.a = pixel.a * 0.8;

    vec3 hsv = rgbToHsv(pixel.rgb);
    hsv.r = 26.90/255;
    pixel.rgb = hsvToRgb(hsv);

    pixel = vec4(pixel.rgb, pixel.a);

    return pixel;
}