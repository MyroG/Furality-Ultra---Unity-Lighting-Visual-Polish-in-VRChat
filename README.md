# Unity Lighting & Visual Polish in VRChat
In this repository you can download :
- My full presentation, it's the file `FULL PRESENTATION.pdf`
- Unity examples

Each folder starts with a number. That's the page number of the presentation, for instance "26 - X" is on the 26th page of the presentation, and talks about X

## Installation

Requires :
- VRChat world SDK

Some scenes require :
- Silent Filamented shader https://gitlab.com/s-ilent/filamented
- z3y graphlit https://github.com/z3y/Graphlit
- z3y Clustered BIRP https://github.com/z3y/ClusteredBIRP
- Light volumes https://github.com/REDSIM/VRCLightVolumes
- Baked volumetric https://github.com/Ikeiwa/Unity-Baked-Volumetrics 

Download the entire folder as a .zip, unpack it, and import it into Unity (2022)

## Credits & License
- The textures were dowloaded from ambientCG and Polyhaven, they are licensed under the CC0 license.
- The vrcfox avatar (made by trev3d) is licensed under the Creative Commons Attribution-NonCommercial 4.0 International License. https://github.com/trev3d/vrcfox?tab=License-1-ov-file#readme
- The included shaders were all written by me (except the MetaPass shader), they are licensed under the MIT license https://opensource.org/license/mit so feel free using and modifying them in your project
- Everything else, including the presentration, are licensed under CC BY-NC 4.0 https://creativecommons.org/licenses/by-nc/4.0/deed.en, the credits should link to this GitHub repository.

# Content

### 6 - Filamented
Here you can compare Unity Standard and Filamented.

There's a weird issue I noticed that makes surfaces non-metallic when the "specular highlight" toggle was turned on, so in this example I turned that setting Off. 

### 11 - Oil
A very basic oil puddle shader that uses the specular workflow to reflect colored specular reflections

### 13~15 - Transparency
Compares different transparency modes : Fade, transparent and cutout

### 29 - Lightmap mask
An example of a shader allowing you to change the color of 3 baked light sources. 

The scene has 3 light sources red, green, and blue. Each color channel of the baked lightmap then acts as a separate mask. The custom shader can read each channel independently and use it to control different lighting colors.

Use the material to change the color of each light source.

### 44 - Shadow radius
Demo showing the effect of the baked shadow radius setting. I also added an example of a baked emissive light source, an orb that has a size of 0.2, notice that it emits a light equivalent to a light source with a shadow radius set to 0.1.

### 45 - Indirect light multiplier
Very basic demo showing the effect of the indirect light multiplier.

### 46~47 - Cookie
A bunch of examples showing what you can achieve with cookie textures. (Baked and not baked)

### 45 - Light Probes
An example scene that uses light probes, move the avatar around to see how light probes affect the lighting of it.

### 54 - Light volumes
An example scene that uses light volumes, move the avatar and the spheres around to see how light volumes affect the lighting of them.

### 78~80 - Reflection probe
4 different reflection probe settups :
- Box projection OFF
- Box projection ON, RP at eye level
- Box projection ON, RP closer to the floor
- Box projection ON, RP closer to the roof
Notice the difference in quality of the reflection depending on its position

### 84 - Reflection Proxy
Example showing how speculars can be added in a scene that doesn't have any real-time lights


### 89~93 - Bakery directional modes
**This scene requires a rebake using Bakery.**

One area light was baked using "Self-Shadow" On, the other one was baked with that toggle off, notice the difference in quality.

### 96 - Bakery Area Light
**This scene requires a rebake using Bakery.**

In this scene, you can compare the different directional modes Bakery offers.

I also added a few examples comparing the quality of baked specular, but I personally didn't noticed much of a difference

### 97 - Bakery Soft Shadow
**This scene requires a rebake using Bakery.**
Test how sample count affects shadow quality, and how "legacy sampling" can decrease shadow quality

### 107 - Meta Pass
An example shader that uses meta pass to make a surface reflect green light even though the surface is actually white. The small wall in the middle of the room uses such a shader.

This is the only shader in this repository that wasn't made with Amplify.

### 108 - TransparencyLM
Example of a shader that uses TransparencyLM to add light transmission properties to the material

### 114 - CBIRP
This scene requires the CBIRP package https://github.com/z3y/ClusteredBIRP

Demo scene with 16 light sourcesvrcblender

### 115 - Stochastic
AN example where you want specular occlusion to be OFF, or at least less intense, notice the floor not reflecting the Window.

### 121 - Specular Occlusion
Example of Stochastic sampling

### 127~128 - Height map
Comparison of different parallax mapping methods using different shaders.

### 129 - Height map Soft edges
Demonstration of the hard vs soft edges issue, notice the material "warping" around when you get closer to a surface that has "soft" normals

### X - Terrain
Not shown in the full presentation : An example showing that triplanar shaders can be used on terrains to automatically paint slopes.


