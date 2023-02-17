#version 330

uniform sampler2D u_Texture; // The texture to be read from by this shader
uniform int u_Time;

in vec3 fs_Pos;
in vec3 fs_Nor;

layout(location = 0) out vec3 out_Col;

void main()
{
    // TODO Homework 4
    vec3 a = vec3(0.5,0.5,0.5);
    vec3 b = cross(fs_Nor,fs_Pos);
    vec3 c = vec3(1,1,1);
    vec3 d = vec3(0.0,0.33,0.67);
    out_Col = a + b * cos(c * u_Time/100.f + d);
}
