//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "DWD/LightenSkybox" {
    Properties {
        _Tint ("Tint Color", Color) = (0.5,0.5,0.5,0.5)
        _LightenColor ("Lighten Color", Color) = (1,0,0,1)
        _Exposure ("Exposure", Range(0, 8)) = 1
        _Rotation ("Rotation", Range(0, 360)) = 0
        _Tex ("Cubemap   (HDR)", Cube) = "grey" { }
    }
    SubShader {
        Tags { "PreviewType" = "Skybox" "QUEUE" = "Background" "RenderType" = "Background" }
        Pass {
            Tags { "PreviewType" = "Skybox" "QUEUE" = "Background" "RenderType" = "Background" }
            Cull Front
            GpuProgramID 26833
            Program "vp" {
                SubProgram "d3d11 hw_tier03 " {
                    "// shader disassembly not supported on DXBC"
                }
                SubProgram "glcore hw_tier03 " {
                    "#ifdef VERTEX
                    #version 150
                    #extension GL_ARB_explicit_attrib_location : require
                    #ifdef GL_ARB_shader_bit_encoding
                    #extension GL_ARB_shader_bit_encoding : enable
                    #endif
                    
                    #define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
                    #if HLSLCC_ENABLE_UNIFORM_BUFFERS
                    #define UNITY_UNIFORM
                    #else
                    #define UNITY_UNIFORM uniform
                    #endif
                    #define UNITY_SUPPORTS_UNIFORM_LOCATION 1
                    #if UNITY_SUPPORTS_UNIFORM_LOCATION
                    #define UNITY_LOCATION(x) layout(location = x)
                    #define UNITY_BINDING(x) layout(binding = x, std140)
                    #else
                    #define UNITY_LOCATION(x)
                    #define UNITY_BINDING(x) layout(std140)
                    #endif
                    uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
                    uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
                    uniform 	float _Rotation;
                    in  vec4 in_POSITION0;
                    out vec3 vs_TEXCOORD0;
                    vec4 u_xlat0;
                    vec4 u_xlat1;
                    vec3 u_xlat2;
                    float u_xlat3;
                    void main()
                    {
                        u_xlat0.x = _Rotation * 0.0174532942;
                        u_xlat1.x = cos(u_xlat0.x);
                        u_xlat0.x = sin(u_xlat0.x);
                        u_xlat2.x = (-u_xlat0.x);
                        u_xlat2.y = u_xlat1.x;
                        u_xlat2.z = u_xlat0.x;
                        u_xlat0.x = dot(u_xlat2.zy, in_POSITION0.xz);
                        u_xlat3 = dot(u_xlat2.yx, in_POSITION0.xz);
                        u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
                        u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * vec4(u_xlat3) + u_xlat1;
                        u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.xxxx + u_xlat1;
                        u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
                        u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
                        u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
                        u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
                        gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
                        vs_TEXCOORD0.xyz = in_POSITION0.xyz;
                        return;
                    }
                    
                    #endif
                    #ifdef FRAGMENT
                    #version 150
                    #extension GL_ARB_explicit_attrib_location : require
                    #ifdef GL_ARB_shader_bit_encoding
                    #extension GL_ARB_shader_bit_encoding : enable
                    #endif
                    
                    #define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
                    #if HLSLCC_ENABLE_UNIFORM_BUFFERS
                    #define UNITY_UNIFORM
                    #else
                    #define UNITY_UNIFORM uniform
                    #endif
                    #define UNITY_SUPPORTS_UNIFORM_LOCATION 1
                    #if UNITY_SUPPORTS_UNIFORM_LOCATION
                    #define UNITY_LOCATION(x) layout(location = x)
                    #define UNITY_BINDING(x) layout(binding = x, std140)
                    #else
                    #define UNITY_LOCATION(x)
                    #define UNITY_BINDING(x) layout(std140)
                    #endif
                    uniform 	vec4 _Tex_HDR;
                    uniform 	vec4 _LightenColor;
                    uniform 	vec4 _Tint;
                    uniform 	float _Exposure;
                    UNITY_LOCATION(0) uniform  samplerCube _Tex;
                    in  vec3 vs_TEXCOORD0;
                    layout(location = 0) out vec4 SV_Target0;
                    vec4 u_xlat0;
                    float u_xlat3;
                    void main()
                    {
                        u_xlat0 = texture(_Tex, vs_TEXCOORD0.xyz);
                        u_xlat3 = u_xlat0.w + -1.0;
                        u_xlat3 = _Tex_HDR.w * u_xlat3 + 1.0;
                        u_xlat3 = u_xlat3 * _Tex_HDR.x;
                        u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat3);
                        u_xlat0.xyz = u_xlat0.xyz * _Tint.xyz;
                        u_xlat0.xyz = u_xlat0.xyz * vec3(_Exposure);
                        u_xlat0.xyz = u_xlat0.xyz + u_xlat0.xyz;
                        SV_Target0.xyz = max(u_xlat0.xyz, _LightenColor.xyz);
                        SV_Target0.w = 1.0;
                        return;
                    }
                    
                    #endif
                    "
                }
            }
            Program "fp" {
                SubProgram "d3d11 hw_tier03 " {
                    "// shader disassembly not supported on DXBC"
                }
                SubProgram "glcore hw_tier03 " {
                    ""
                }
            }
        }
    }
}