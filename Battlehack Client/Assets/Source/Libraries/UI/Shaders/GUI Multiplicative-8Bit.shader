Shader "GUI/Multiplicative-8Bit" {
Properties {
	//_Color ("Main Color", Color) = (1,1,1,1)
	_MainTex ("Main Texture", 2D) = "" {}
}

Category {
	Tags { "Queue"="Transparent" "IgnoreProjector"="True" "RenderType"="Transparent" }
	Blend DstColor Zero
	AlphaTest Off
	//ColorMask RGB
	Cull Off Lighting Off ZWrite Off Fog { Mode Off }
	BindChannels {
		Bind "Color", color
		Bind "Vertex", vertex
		Bind "TexCoord", texcoord
	}
	
	SubShader {
		Pass {
			SetTexture [_MainTex] {
				//constantColor [_Color]
				combine primary, texture * primary
			}
			SetTexture [_MainTex] {
				
				combine previous + one - previous ALPHA
			}
		}
	}
	
}
}
