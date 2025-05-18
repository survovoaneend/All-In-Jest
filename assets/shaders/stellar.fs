#if defined(VERTEX) || __VERSION__ > 100 || defined(GL_FRAGMENT_PRECISION_HIGH)
    #define MY_HIGHP_OR_MEDIUMP highp
#else
    #define MY_HIGHP_OR_MEDIUMP mediump
#endif
#define PRECISION MY_HIGHP_OR_MEDIUMP

extern MY_HIGHP_OR_MEDIUMP vec2 stellar;
extern MY_HIGHP_OR_MEDIUMP number dissolve;
extern MY_HIGHP_OR_MEDIUMP number time;
extern MY_HIGHP_OR_MEDIUMP vec4 texture_details;
extern MY_HIGHP_OR_MEDIUMP vec2 image_details;
extern PRECISION vec4 burn_colour_1; 
extern PRECISION vec4 burn_colour_2; 
extern bool shadow; 

extern PRECISION vec2 mouse_screen_pos; 
extern PRECISION float hovering; 
extern PRECISION float screen_scale; 

uniform float rand_seed;

float hash(vec2 p) {
    return fract(sin(dot(p, vec2(127.1, 311.7))) * 43758.5453);
}

float noise(vec2 p) {
    vec2 i = floor(p);
    vec2 f = fract(p);
    float a = hash(i);
    float b = hash(i + vec2(1.0, 0.0));
    float c = hash(i + vec2(0.0, 1.0));
    float d = hash(i + vec2(1.0, 1.0));
    vec2 u = f * f * (3.0 - 2.0 * f);
    return mix(mix(a, b, u.x), mix(c, d, u.x), u.y);
}

float rand(in vec2 seed) {
    return fract( sin(dot(seed, vec2(12.9898,78.233))) * 43758.5453123 );
}


float fbm(vec2 p) {
    float f = 0.0;
    float amp = 0.5;
    for (int i = 0; i < 5; i++) {
        f += amp * noise(p);
        p *= 2.0;
        amp *= 0.5;
    }
    return f;
}

vec3 nebula(vec2 uv, float t) {
    uv = uv * 2.0;
    vec2 dir = vec2(0.6, 0.4);
    float layer1 = fbm(uv * 1.2 - dir * t * 0.02);
    float layer2 = fbm(uv * 2.4 + dir * t * 0.015);
    float dust = pow(layer1 * 0.6 + layer2 * 0.4, 1.6);

    vec3 bas = vec3(0.3, 0.2, 0.6);
    vec3 glow = vec3(0.8, 0.4, 1.0);

    return bas * dust + glow * vec3(dust); 
}

float diamond(vec2 uv) {
    uv = abs(uv - 0.5);
    return clamp(0.8 - (uv.x + uv.y)*2.0, 0.0, 0.8);
}

float borderMask(vec2 uv, float m, float w) {
    float left = smoothstep(m, m + w, uv.x);
    float right = smoothstep(m, m + w, 1.0 - uv.x);
    return left * right;
}

float star_layer(vec2 uv, float t) {
    float scale = 15.0;
    vec2 grid_uv = uv * scale;
    vec2 id = floor(grid_uv);
    vec2 gv = fract(grid_uv);

    float seed = hash(id + rand_seed);
    if (seed <= 0.932) return 0.0;

    float loopSpeed = 1.0 / 60.0;
    float phaseSeed = fract(seed * 43758.5453); 
    float life = fract(phaseSeed + t * loopSpeed);
    
    float fadeIn = smoothstep(0.2, 0.4, life);
    float fadeOut = 1.0 - smoothstep(0.6, 0.8, life);
    float fade = fadeIn * fadeOut;

    float shape = diamond(gv);
    float mask = borderMask(uv, 0.05, 0.03);
    return fade * shape * mask;
}

vec4 dissolve_mask(vec4 final_pixel, vec2 texture_coords, vec2 uv)
{
    if (dissolve < 0.001) {
        return vec4(shadow ? vec3(0.,0.,0.) : final_pixel.xyz, shadow ? final_pixel.a*0.3: final_pixel.a);
    }

    float adjusted_dissolve = (dissolve*dissolve*(3.-2.*dissolve))*1.02 - 0.01;

	float t = time * 10.0 + 2003.;
	vec2 floored_uv = (floor((uv*texture_details.ba)))/max(texture_details.b, texture_details.a);
    vec2 uv_scaled_centered = (floored_uv - 0.5) * 2.3 * max(texture_details.b, texture_details.a);
	
	vec2 field_part1 = uv_scaled_centered + 50.*vec2(sin(-t / 143.6340), cos(-t / 99.4324));
	vec2 field_part2 = uv_scaled_centered + 50.*vec2(cos( t / 53.1532),  cos( t / 61.4532));
	vec2 field_part3 = uv_scaled_centered + 50.*vec2(sin(-t / 87.53218), sin(-t / 49.0000));

    float field = (1.+ (
        cos(length(field_part1) / 19.483) + sin(length(field_part2) / 33.155) * cos(field_part2.y / 15.73) +
        cos(length(field_part3) / 27.193) * sin(field_part3.x / 21.92) ))/2.;
    vec2 borders = vec2(0.2, 0.8);

    float res = (.5 + .5* cos( (adjusted_dissolve) / 82.612 + ( field + -.5 ) *3.14))
    - (floored_uv.x > borders.y ? (floored_uv.x - borders.y)*(5. + 5.*dissolve) : 0.)*(dissolve)
    - (floored_uv.y > borders.y ? (floored_uv.y - borders.y)*(5. + 5.*dissolve) : 0.)*(dissolve)
    - (floored_uv.x < borders.x ? (borders.x - floored_uv.x)*(5. + 5.*dissolve) : 0.)*(dissolve)
    - (floored_uv.y < borders.x ? (borders.x - floored_uv.y)*(5. + 5.*dissolve) : 0.)*(dissolve);

    if (final_pixel.a > 0.01 && burn_colour_1.a > 0.01 && !shadow && res < adjusted_dissolve + 0.8*(0.5-abs(adjusted_dissolve-0.5)) && res > adjusted_dissolve) {
        if (!shadow && res < adjusted_dissolve + 0.5*(0.5-abs(adjusted_dissolve-0.5)) && res > adjusted_dissolve) {
            final_pixel.rgba = burn_colour_1.rgba;
        } else if (burn_colour_2.a > 0.01) {
            final_pixel.rgba = burn_colour_2.rgba;
        }
    }

    return vec4(shadow ? vec3(0.,0.,0.) : final_pixel.xyz, res > adjusted_dissolve ? (shadow ? final_pixel.a*0.3: final_pixel.a) : .0);
}

vec4 effect( vec4 colour, Image texture, vec2 texture_coords, vec2 screen_coords )
{
    vec4 tex = Texel(texture, texture_coords);
    vec2 uv = (((texture_coords)*(image_details)) - texture_details.xy*texture_details.ba)/texture_details.ba;

    number low = min(tex.r, min(tex.g, tex.b));
    number high = max(tex.r, max(tex.g, tex.b));
    number delta = high-low -0.1;

    number fac = 0.8 + 0.9*sin(11.*uv.x+4.32*uv.y + stellar.r*12. + cos(stellar.r*5.3 + uv.y*4.2 - uv.x*4.));
    number fac2 = 0.5 + 0.5*sin(8.*uv.x+2.32*uv.y + stellar.r*5. - cos(stellar.r*2.3 + uv.x*8.2));
    number fac3 = 0.5 + 0.5*sin(10.*uv.x+5.32*uv.y + stellar.r*6.111 + sin(stellar.r*5.3 + uv.y*3.2));
    number fac4 = 0.5 + 0.5*sin(3.*uv.x+2.32*uv.y + stellar.r*8.111 + sin(stellar.r*1.3 + uv.y*11.2));
    number fac5 = sin(0.9*16.*uv.x+5.32*uv.y + stellar.r*12. + cos(stellar.r*5.3 + uv.y*4.2 - uv.x*4.));

    number maxfac = 0.7*max(max(fac, max(fac2, max(fac3,0.0))) + (fac+fac2+fac3*fac4), 0.);

    tex.g = tex.g-delta + delta*maxfac*(0.7 - fac5*0.27) - 0.1;

    float t = time + stellar.y;

    tex.rgb = pow(tex.rgb, vec3(1.05));

    vec3 neb = nebula(uv, t);

    vec3 white = vec3(1.0,1.0,1.0);

    vec3 color = mix(neb, white, 0.5);

    tex.rgb = tex.rgb + 0.2 * (neb - tex.rgb); 
    tex.rgb += neb * 0.6;
    tex.rgb = mix(tex.rgb, vec3(neb.r, neb.g, neb.b + 0.3), 0.4);

    float stars = star_layer(uv, t);
    tex.rgb += stars * vec3(0.6, 0.6, 0.6);
    tex.rgb += pow(stars, 0.5) * 0.3;

    tex.b = tex.b-delta + delta*maxfac*(0.7 - fac5*0.27) - 0.1;
    tex.r = tex.r-delta + delta*maxfac*(0.7 - fac5*0.27) - 0.1;
    
    return dissolve_mask(tex, texture_coords, uv);
}

#ifdef VERTEX
vec4 position(mat4 transform_projection, vec4 vertex_position){
    float md = length(vertex_position.xy - 0.5*love_ScreenSize.xy)/length(love_ScreenSize.xy);
    vec2 mo = (vertex_position.xy - mouse_screen_pos.xy)/screen_scale;
    float sc = 0.2 * (-0.03 - 0.3*max(0.,0.3-md)) * hovering * (length(mo)*length(mo))/(2.-md);
    return transform_projection * vertex_position + vec4(0,0,0, sc);
}
#endif
