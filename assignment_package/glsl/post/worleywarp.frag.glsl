#version 150

uniform ivec2 u_Dimensions;
uniform int u_Time;

in vec2 fs_UV;

out vec3 color;

uniform sampler2D u_RenderedTexture;

float mod289(float x){return x - floor(x * (1.0 / 289.0)) * 289.0;}
vec4 mod289(vec4 x){return x - floor(x * (1.0 / 289.0)) * 289.0;}
vec4 perm(vec4 x){return mod289(((x * 34.0) + 1.0) * x);}

float noise(float aaa, float bbb, float ccc) {
    vec3 p = vec3 (aaa, bbb, ccc);
    vec3 a = floor(p);
    vec3 d = p - a;
    d = d * d * (3.0 - 2.0 * d);

    vec4 b = a.xxyy + vec4(0.0, 1.0, 0.0, 1.0);
    vec4 k1 = perm(b.xyxy);
    vec4 k2 = perm(k1.xyxy + b.zzww);

    vec4 c = k2 + a.zzzz;
    vec4 k3 = perm(c);
    vec4 k4 = perm(c + 1.0);

    vec4 o1 = fract(k3 * (1.0 / 41.0));
    vec4 o2 = fract(k4 * (1.0 / 41.0));

    vec4 o3 = o2 * d.z + o1 * (1.0 - d.z);
    vec2 o4 = o3.yw * d.x + o3.xz * (1.0 - d.x);

    return o4.y * d.y + o4.x * (1.0 - d.y);
}


void main()
{
    // TODO Homework 5
    vec3 c = texture(u_RenderedTexture, fs_UV).rgb;
    vec2 pos = vec2(fs_UV[0]*u_Dimensions[0],fs_UV[1]*u_Dimensions[1]);

    //worley noise
    float wx = floor(pos[0]/20);
    float wy = floor(pos[1]/20);

    float cc = -1.f;
    for(float i = wx - 1; i < wx + 2; i++){
        for(float j = wy-1; j < wy + 2; j++) {
            float wxx = i*20.f + 20.f*noise(i, j, 0);
            float wxy = j*20.f + 20.f*noise(i, j, sqrt(i*i + j*j));

            if(cc == -1 || cc > length(vec2(wxx, wxy) - pos)){
                cc = length(vec2(wxx, wxy) - pos);
                color = texture(u_RenderedTexture, vec2(wxx/u_Dimensions[0], wxy/u_Dimensions[1])).rgb;
            }
        }
    }

}
