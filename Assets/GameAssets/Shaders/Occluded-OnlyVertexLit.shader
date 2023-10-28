// Modified version of basic VertexLit shader from http://docs.unity3d.com/Manual/ShaderTut1.html

Shader "Custom/Occluded-OnlyVertexLit"
{
    Properties {
        _Color ("Main Color", Color) = (1,1,1,0.5)
        _SpecColor ("Spec Color", Color) = (1,1,1,1)
        _Emission ("Emmisive Color", Color) = (0,0,0,0)
        _Shininess ("Shininess", Range (0.01, 1)) = 0.7
        _MainTex ("Base (RGB)", 2D) = "white" { }
    }
 
    SubShader {
 
    	Tags {"Queue" = "Geometry-1" } // Render this object after other objects in the Geometry queue.
 
        Pass {
            Material {
                Diffuse [_Color]
                Ambient [_Color]
                Shininess [_Shininess]
                Specular [_SpecColor]
                Emission [_Emission]
            }
            Lighting On
            SeparateSpecular On
 
            ZTest Greater // Only draw this where another object was already drawn in front.
            ZWrite Off // Dont write to the depth buffer.
 
            SetTexture [_MainTex] {
                constantColor [_Color]
                Combine texture * primary DOUBLE, texture * constant
            }
        }
    }
}
