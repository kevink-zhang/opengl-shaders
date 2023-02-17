#version 150

uniform mat4 u_Model;
uniform mat3 u_ModelInvTr;
uniform mat4 u_View;
uniform mat4 u_Proj;

uniform int u_Time;

in vec4 vs_Pos;
in vec4 vs_Nor;

out vec3 fs_Pos;
out vec3 fs_Nor;

void main()
{
    // TODO Homework 4
    fs_Nor = normalize(u_ModelInvTr * vec3(vs_Nor));

    float p = 0.5 * sin(u_Time/100.f) + 0.5;
    vec4 foo = p * vs_Pos + (1-p) * normalize(vs_Pos)*2;

    foo[3] = 1;
    vec4 modelposition = u_Model * foo;
    fs_Pos = vec3(modelposition);

    gl_Position = u_Proj * u_View * modelposition;
}
