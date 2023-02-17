#version 150

uniform mat4 u_Model;
uniform mat3 u_ModelInvTr;
uniform mat4 u_View;
uniform mat4 u_Proj;

in vec4 vs_Pos;
in vec4 vs_Nor;
in vec2 vs_UV;

out vec2 fs_UV;            // The array of normals that has been transformed by u_ModelInvTr. This is implicitly passed to the fragment shader.


void main()
{
    // TODO Homework 4
    vec4 fs_Nor = normalize(vec4(u_ModelInvTr * vec3(vs_Nor), 0));

    fs_UV = vec2(fs_Nor[0]*0.5+0.5, 0.5*fs_Nor[1]+0.5);

    vec4 modelposition = u_Model * vs_Pos;
    gl_Position = u_Proj * u_View * modelposition;
}
