// Made with Amplify Shader Editor v1.9.8.1
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "MyroP/SpecularWithDetail"
{
	Properties
	{
		_MainTex("MainTex", 2D) = "white" {}
		_Occlusion("Occlusion", 2D) = "white" {}
		_Normal("Normal", 2D) = "bump" {}
		_NormalScale("NormalScale", Float) = 0
		_Roughness("Roughness", 2D) = "white" {}
		_Mask("Mask", 2D) = "black" {}
		_SpecularMask("SpecularMask", 2D) = "black" {}
		_SpecularMaskIntensity("SpecularMaskIntensity", Float) = 0
		_OcclusionMask("OcclusionMask", Range( 0 , 1)) = 0
		_RoughnessMask("RoughnessMask", Range( 0 , 1)) = 0
		_MaskScale("Mask Scale", Float) = 1
		_MaskOffset("Mask Offset", Float) = 0
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Opaque"  "Queue" = "Geometry+0" }
		Cull Back
		CGPROGRAM
		#include "UnityStandardUtils.cginc"
		#pragma target 3.5
		#define ASE_VERSION 19801
		#pragma surface surf StandardSpecular keepalpha addshadow fullforwardshadows 
		struct Input
		{
			float2 uv_texcoord;
		};

		uniform sampler2D _Normal;
		uniform float4 _Normal_ST;
		uniform float _NormalScale;
		uniform sampler2D _Mask;
		uniform float4 _Mask_ST;
		uniform float _MaskScale;
		uniform float _MaskOffset;
		uniform sampler2D _MainTex;
		uniform float4 _MainTex_ST;
		uniform sampler2D _SpecularMask;
		uniform float4 _SpecularMask_ST;
		uniform float _SpecularMaskIntensity;
		uniform sampler2D _Roughness;
		uniform float4 _Roughness_ST;
		uniform float _RoughnessMask;
		uniform sampler2D _Occlusion;
		uniform float4 _Occlusion_ST;
		uniform float _OcclusionMask;

		void surf( Input i , inout SurfaceOutputStandardSpecular o )
		{
			float2 uv_Normal = i.uv_texcoord * _Normal_ST.xy + _Normal_ST.zw;
			float4 color8 = IsGammaSpace() ? float4(0,0,1,0) : float4(0,0,1,0);
			float2 uv_Mask = i.uv_texcoord * _Mask_ST.xy + _Mask_ST.zw;
			float temp_output_32_0 = saturate( (( 1.0 - tex2D( _Mask, uv_Mask ).r )*_MaskScale + _MaskOffset) );
			float3 lerpResult7 = lerp( UnpackScaleNormal( tex2D( _Normal, uv_Normal ), _NormalScale ) , color8.rgb , temp_output_32_0);
			o.Normal = lerpResult7;
			float2 uv_MainTex = i.uv_texcoord * _MainTex_ST.xy + _MainTex_ST.zw;
			o.Albedo = tex2D( _MainTex, uv_MainTex ).rgb;
			float3 temp_cast_0 = (0.01).xxx;
			float2 uv_SpecularMask = i.uv_texcoord * _SpecularMask_ST.xy + _SpecularMask_ST.zw;
			float3 lerpResult11 = lerp( temp_cast_0 , ( tex2D( _SpecularMask, uv_SpecularMask ).rgb * _SpecularMaskIntensity ) , temp_output_32_0);
			o.Specular = lerpResult11;
			float2 uv_Roughness = i.uv_texcoord * _Roughness_ST.xy + _Roughness_ST.zw;
			float3 temp_cast_1 = (_RoughnessMask).xxx;
			float3 lerpResult13 = lerp( tex2D( _Roughness, uv_Roughness ).rgb , temp_cast_1 , temp_output_32_0);
			o.Smoothness = ( 1.0 - lerpResult13 ).x;
			float2 uv_Occlusion = i.uv_texcoord * _Occlusion_ST.xy + _Occlusion_ST.zw;
			float lerpResult20 = lerp( tex2D( _Occlusion, uv_Occlusion ).r , _OcclusionMask , temp_output_32_0);
			o.Occlusion = lerpResult20;
			o.Alpha = 1;
		}

		ENDCG
	}
	Fallback "Diffuse"
	CustomEditor "AmplifyShaderEditor.MaterialInspector"
}
/*ASEBEGIN
Version=19801
Node;AmplifyShaderEditor.SamplerNode;6;-2192,240;Inherit;True;Property;_Mask;Mask;5;0;Create;True;0;0;0;False;0;False;-1;dbd2bc615a909f6498322797c6883a4f;None;True;0;False;black;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.OneMinusNode;30;-1856,320;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;33;-1936,448;Inherit;False;Property;_MaskScale;Mask Scale;10;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;34;-1936,544;Inherit;False;Property;_MaskOffset;Mask Offset;11;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ScaleAndOffsetNode;31;-1680,320;Inherit;True;3;0;FLOAT;0;False;1;FLOAT;5.4;False;2;FLOAT;-0.96;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;4;-672,288;Inherit;True;Property;_Roughness;Roughness;4;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.RangedFloatNode;12;-640,480;Inherit;False;Property;_RoughnessMask;RoughnessMask;9;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;10;-640,1168;Inherit;True;Property;_SpecularMask;SpecularMask;6;0;Create;True;0;0;0;False;0;False;-1;fb4fb26f312b6304eb2ce3ccb85f64fb;None;True;0;False;black;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.RangedFloatNode;21;-976,96;Inherit;False;Property;_NormalScale;NormalScale;3;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;15;-592,1392;Inherit;False;Property;_SpecularMaskIntensity;SpecularMaskIntensity;7;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;32;-1360,320;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;2;-672,64;Inherit;True;Property;_Normal;Normal;2;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;bump;Auto;True;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.LerpOp;13;-240,416;Inherit;True;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;16;-288,1200;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;22;-128,672;Inherit;False;Constant;_Float0;Float 0;11;0;Create;True;0;0;0;False;0;False;0.01;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;3;-704,720;Inherit;True;Property;_Occlusion;Occlusion;1;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.RangedFloatNode;23;-704,960;Inherit;False;Property;_OcclusionMask;OcclusionMask;8;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;8;-384,160;Inherit;False;Constant;_Color0;Color 0;5;0;Create;True;0;0;0;False;0;False;0,0,1,0;0,0,0,0;True;True;0;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.OneMinusNode;14;32,368;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LerpOp;7;-32,80;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LerpOp;11;48,672;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SamplerNode;1;-608,-304;Inherit;True;Property;_MainTex;MainTex;0;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.LerpOp;20;-368,848;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;400,-64;Float;False;True;-1;3;AmplifyShaderEditor.MaterialInspector;0;0;StandardSpecular;MyroP/SpecularWithDetail;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;False;;0;False;;False;0;False;;0;False;;False;0;Opaque;0.5;True;True;0;False;Opaque;;Geometry;All;12;all;True;True;True;True;0;False;;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;2;15;10;25;False;0.5;True;0;0;False;;0;False;;0;0;False;;0;False;;0;False;;0;False;;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;True;Relative;0;;-1;-1;-1;-1;0;False;0;0;False;;-1;0;False;;0;0;0;False;0.1;False;;0;False;;False;17;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;16;FLOAT4;0,0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;30;0;6;1
WireConnection;31;0;30;0
WireConnection;31;1;33;0
WireConnection;31;2;34;0
WireConnection;32;0;31;0
WireConnection;2;5;21;0
WireConnection;13;0;4;5
WireConnection;13;1;12;0
WireConnection;13;2;32;0
WireConnection;16;0;10;5
WireConnection;16;1;15;0
WireConnection;14;0;13;0
WireConnection;7;0;2;0
WireConnection;7;1;8;5
WireConnection;7;2;32;0
WireConnection;11;0;22;0
WireConnection;11;1;16;0
WireConnection;11;2;32;0
WireConnection;20;0;3;1
WireConnection;20;1;23;0
WireConnection;20;2;32;0
WireConnection;0;0;1;5
WireConnection;0;1;7;0
WireConnection;0;3;11;0
WireConnection;0;4;14;0
WireConnection;0;5;20;0
ASEEND*/
//CHKSM=025A7D0C4661C85DCF5ACAFCC9B24374147AAE52