#version 150

in vec2 fs_UV;

out vec3 color;

uniform sampler2D u_RenderedTexture;

void main()
{
    // TODO Homework 5
    vec3 c = texture(u_RenderedTexture, fs_UV).rgb;

    color = vec3((0.21 * c[0] + 0.72 * c[1] + 0.07 * c[2]) * (1-length(fs_UV-vec2(0.5))));
}
