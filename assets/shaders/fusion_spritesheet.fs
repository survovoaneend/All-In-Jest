#if defined(VERTEX) || __VERSION__ > 100 || defined(GL_FRAGMENT_PRECISION_HIGH)
	#define MY_HIGHP_OR_MEDIUMP highp
#else
	#define MY_HIGHP_OR_MEDIUMP mediump
#endif

extern MY_HIGHP_OR_MEDIUMP vec2 enhancement_image_dims;
extern MY_HIGHP_OR_MEDIUMP vec2 old_image_dims;

uniform Image maskTex;
uniform vec4 maskUV;

vec4 effect( vec4 colour, Image texture, vec2 texture_coords, vec2 screen_coords )
{
    vec4 pixel = Texel(texture, texture_coords);

    vec2 texture_coords_unstandardised = texture_coords * old_image_dims;
    vec2 foregroundCoords = vec2(mod(texture_coords_unstandardised.x, 71), mod(texture_coords_unstandardised.y, 95));
    foregroundCoords = foregroundCoords / enhancement_image_dims;

    vec4 tex = Texel(maskTex, maskUV.xy + foregroundCoords);

    vec3 finalRGB = mix(pixel.rgb, tex.rgb, tex.a);

    vec4 result = vec4(finalRGB, pixel.a);

    return result;
}