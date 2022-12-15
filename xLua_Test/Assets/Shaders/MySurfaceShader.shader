Shader "Custom/MySurfaceShader"
{
    Properties{
        _MainTex("Texture", 2D) = "White"{}
        _BumpMap("BumpMap", 2D) = "bump"{}
    }
    SubShader{
        Tags{"RenderType" = "Opaque"}
        CGPROGRAM
        #pragma surface surf Lambert
        struct Input {
            float2 uv_MainTex;
            float2 uv_BumpMap;
        };

        sampler2D _MainTex;
        sampler2D _BumpMap;
    
        void surf(Input IN, inout SurfaceOutput o) {
            o.Albedo = tex2D(_MainTex, IN.uv_MainTex).rgb;
            o.Normal = UnpackNormal(tex2D(_BumpMap, IN.uv_BumpMap));
        }
    ENDCG
    }
    FallBack "Diffuse"
}
