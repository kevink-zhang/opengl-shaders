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

    vec4 foo = vs_Pos;//smoothstep(vs_Pos, normalize(vs_Pos)*10, vec4(u_Time));
    vec4 modelposition = u_Model * foo;
    fs_Pos = vec3(modelposition);

    gl_Position = u_Proj * u_View * modelposition;
}
