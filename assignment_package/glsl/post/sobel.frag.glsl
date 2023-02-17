#version 150

in vec2 fs_UV;

out vec3 color;

uniform sampler2D u_RenderedTexture;
uniform int u_Time;
uniform ivec2 u_Dimensions;

const mat3 hKernel = mat3(vec3(3, 10, 3),
                    vec3(0, 0, 0),
                    vec3(-3, -10, -3));
const mat3 vKernel = mat3(vec3(3, 0, -3),
                    vec3(10, 0, -10),
                    vec3(3, 0, -3));
void main()
{
    vec3 hGrad = vec3(0);
    vec3 vGrad = vec3(0);
    int x = 0;
    int y = 0;
    for(float i = -1.f; i < 2.f; i++) {
        y = 0;
        for(float j = -1.f; j < 2.f; j++){
            vec3 c = texture(u_RenderedTexture, fs_UV + vec2(i/u_Dimensions[0], j/u_Dimensions[1])).rgb;
            hGrad += hKernel[x][y]*c;
            vGrad += vKernel[x][y]*c;
            y++;
        }
        x++;
    }

    for(int i = 0; i < 3; i++) {
        hGrad[i] = hGrad[i] * hGrad[i];
        vGrad[i] = vGrad[i] * vGrad[i];
    }
    color = sqrt(hGrad+vGrad);
}
