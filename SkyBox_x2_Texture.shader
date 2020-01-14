
Shader "SkyBox_x2_Texture" 
{
//6장 스카이 박스용 텍스쳐를 2개 지원하여 섞는다.
//블랜딩 값을 조정함으로 자연스럽게 밤낮이 바뀌는 효과를 제공할 수 있다.
		Properties {
			_Tint ("Tint Color", Color) = (.5, .5, .5, .5)
			_Blend ("Blend", Range(0.0,1.0)) = 0.5
			_FrontTex ("Front (+Z)", 2D) = "white" {}
			_BackTex ("Back (-Z)", 2D) = "white" {}
			_LeftTex ("Left (+X)", 2D) = "white" {}
			_RightTex ("Right (-X)", 2D) = "white" {}
			_UpTex ("Up (+Y)", 2D) = "white" {}
			_DownTex ("Down (-Y)", 2D) = "white" {}
			_FrontTex2("2 Front (+Z)", 2D) = "white" {}
			_BackTex2("2 Back (-Z)", 2D) = "white" {}
			_LeftTex2("2 Left (+X)", 2D) = "white" {}
			_RightTex2("2 Right (-X)", 2D) = "white" {}
			_UpTex2("2 Up (+Y)", 2D) = "white" {}
			_DownTex2("2 Down (-Y)", 2D) = "white" {}
		}   

	SubShader
	{
			Tags { "Queue" = "Transparent"  "RenderType" = "Transparent"}
			Cull Off
			Fog { Mode Off }
			Lighting Off
			Color [_Tint]
		CGPROGRAM
			#paragma surface surf Standard alpha:fade
		ENDCG

		Pass {
			SetTexture [_FrontTex] { combine texture }
			SetTexture [_FrontTex2] { constantColor (0,0,0,[_Blend]) combine texture lerp(constant) previous }
			SetTexture [_FrontTex2] { combine previous + primary, previous * primary }
		}

		Pass {
			SetTexture [_BackTex] { combine texture }
			SetTexture [_BackTex2] { constantColor (0,0,0,[_Blend]) combine texture lerp(constant) previous }
			SetTexture [_BackTex2] { combine previous + primary, previous * primary }
		}

		Pass {
			SetTexture [_LeftTex] { combine texture }
			SetTexture [_LeftTex2] { constantColor (0,0,0,[_Blend]) combine texture lerp(constant) previous }
			SetTexture [_LeftTex2] { combine previous + primary, previous * primary }
		}

		Pass {
			SetTexture [_RightTex] { combine texture }
			SetTexture [_RightTex2] { constantColor (0,0,0,[_Blend]) combine texture lerp(constant) previous }
			SetTexture [_RightTex2] { combine previous + primary, previous * primary }
		}

		Pass {
			SetTexture [_UpTex] { combine texture }
			SetTexture [_UpTex2] { constantColor (0,0,0,[_Blend]) combine texture lerp(constant) previous }
			SetTexture [_UpTex2] { combine previous + primary, previous * primary }
		}

		Pass {
			SetTexture [_DownTex] { combine texture }
			SetTexture [_DownTex2] { constantColor (0,0,0,[_Blend]) combine texture lerp(constant) previous }
			SetTexture [_DownTex2] { combine previous + primary, previous * primary }
			}
	}
	Fallback "SkyBox", 1
}
