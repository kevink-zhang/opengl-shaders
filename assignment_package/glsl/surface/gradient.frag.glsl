#version 330

uniform sampler2D u_Texture; // The texture to be read from by this shader

in vec3 fs_Nor;
in vec3 fs_LightVec;

layout(location = 0) out vec3 out_Col;

void main()
{
    float t = dot(normalize(fs_Nor), normalize(fs_LightVec));

    // TODO Homework 4
    vec3 a = vec3(0.5,0.5,0.5);
    vec3 b = vec3(0.5,0.5,0.5);
    float PI = 3.1415;
    vec3 c = vec3(1,1,1);
    vec3 d = vec3(0.0,0.33,0.67);
    out_Col = a + b * cos(2 * PI * (c * t + d));
}
