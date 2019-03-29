// https://computergraphics.stackexchange.com/questions/4686/advice-on-how-to-create-glsl-2d-soft-smoke-cloud-shader#answer-4696

// Where uniform_speed is uniform variable incremented each frame with some value.
P = vec3(texcoord, uniform_speed)

float default3DFbm(vec3 P, float frequency, float lacunarity, int octaves, float addition)
{
    float t = 0.0f;
    float amplitude = 1.0;
    float amplitudeSum = 0.0;
    for(int k = 0; k < octaves; ++k)
    {
        // Where snoise is 3D noise function from link and P is used to seed noise, for example
        t += min(snoise(P * frequency)+addition, 1.0) * amplitude;
        amplitudeSum += amplitude;
        amplitude *= 0.5;
        frequency *= lacunarity;
    }
    return t/amplitudeSum;
}
