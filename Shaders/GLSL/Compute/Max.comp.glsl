/*
 * @file    Max.comp.glsl
 * @author  David Gallardo Moreno
 */


#version 430
precision highp float;

layout(local_size_x = 1, local_size_y = 1, local_size_z = 1) in;

layout(binding = 0, rgba8) uniform image2D uOutputBuffer0;
layout(binding = 1, rgba8) uniform image2D uInputBuffer0;
layout(binding = 2, rgba8) uniform image2D uInputBuffer1;

layout(location = 100) uniform ivec3 uOutputBufferSize;
layout(location = 101) uniform ivec3 uInvocationOffset;

layout(location = 0)  uniform float    uEdge;

void main(void)
{
    ivec2 lBufferCoord = ivec2(gl_GlobalInvocationID.xy + uInvocationOffset.xy);
    //vec2 lUV = (vec2(lBufferCoord.xy) / vec2(uOutputBufferSize.xy));
    vec4 lInputColor0 = imageLoad(uInputBuffer0, lBufferCoord);
    vec4 lInputColor1 = imageLoad(uInputBuffer1, lBufferCoord);

    const vec4 lOutputColor = vec4(max(lInputColor0.xyz, lInputColor1.xyz), 1.0);
    imageStore (uOutputBuffer0, lBufferCoord, lOutputColor);
}
 