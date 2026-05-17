#if defined(VERTEX) || __VERSION__ > 100 || defined(GL_FRAGMENT_PRECISION_HIGH)
	#define MY_HIGHP_OR_MEDIUMP highp
#else
	#define MY_HIGHP_OR_MEDIUMP mediump
#endif

extern MY_HIGHP_OR_MEDIUMP vec2 enhancement_image_dims;
extern MY_HIGHP_OR_MEDIUMP vec2 old_image_dims;

uniform Image maskTex;
uniform vec4 maskUV;
uniform vec4 otherUV;

vec4 effect( vec4 colour, Image texture, vec2 texture_coords, vec2 screen_coords )
{
    vec4 pixel = Texel(texture, texture_coords);

    vec2 texture_coords_unstandardised = texture_coords * old_image_dims;
    vec2 burntCoords = vec2(mod(texture_coords_unstandardised.x, 71), mod(texture_coords_unstandardised.y, 95));
    burntCoords = burntCoords / enhancement_image_dims;

    vec4 tex = Texel(maskTex, maskUV.xy + burntCoords);
    vec4 mask = Texel(maskTex, otherUV.xy + burntCoords);

    pixel.a = pixel.a;

    vec3 finalRGB = mix(pixel.rgb, tex.rgb, tex.a);

    float finalA = pixel.a * mask.a;

    vec4 result = vec4(finalRGB, finalA);

    return result;
}