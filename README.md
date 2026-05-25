# Unity Lighting & Visual Polish in VRChat
In this repository you can download :
- My full presentation, it's the file `FULL PRESENTATION.pdf`
- Unity examples

Each folder starts with a number. That's the page number of the presentation, for instance "26 - X" is on the 26th page of the presentation, and talks about X

## Installation

Requires :
- VRChat world SDK
- Silent Filamented shader
- z3y graphlit
- z3y Clustered BIRP

Download the entire folder as a .zip, unpack it, and import it into Unity (2022)

## Credits & License
- The textures were dowloaded from ambientCG and Polyhaven, they are licensed under the CC0 license.
- The included shaders were all written by me (except the MetaPass shader), they are licensed under the MIT license https://opensource.org/license/mit so feel free using and modifying them in your project
- Everything else, including the presentration, are licensed under CC BY-NC 4.0 https://creativecommons.org/licenses/by-nc/4.0/deed.en, the credits should link to this GitHub repository.

# Content

### 6 - Filamented
Here you can compare Unity Standard and Filamented.

There's a weird issue I noticed that makes surfaces non-metallic when the "specular highlight" toggle was turned on, so in this example I turned that setting Off. 

### 11 - Oil
A very basic oil puddle shader that uses the specular workflow to reflect colored specular reflections

### 39 - Shadow radius examples
Demo showing the effect of the baked shadow radius setting. I also added an example of a baked emissive light source, an orb that has a size of 0.2, notice that it emits a light equivalent to a light source with a shadow radius set to 0.1.

### 40 - Indirect light multiplier
Very basic demo showing the effect of the indirect light multiplier.

### 41~42 - Cookie
A bunch of examples showing what you can achieve with cookie textures. (Baked and not baked)

### 45 - Light Probes
An example scene that uses light probes, move the avatar around to see how light probes affect the lighting of it.

### 47 - Light Probes
An example scene that uses light volumes, move the avatar and the spheres around to see how light volumes affect the lighting of them.

### 71~73 - Reflection probe
4 different reflection probe settups :
- Box projection OFF
- Box projection ON, RP at eye level
- Box projection ON, RP closer to the floor
- Box projection ON, RP closer to the roof
Notice the difference in quality of the reflection depending on its position

### 77 - Reflection Proxy
Example showing how speculars can be added in a scene that doesn't have any real-time lights


### 89 - Bakery Area Light
**This scene requires a rebake using Bakery.**

One area light was baked using "Self-Shadow" On, the other one was baked with that toggle off, notice the difference in quality.

### 82~86 - Bakery directional modes
**This scene requires a rebake using Bakery.**

In this scene, you can compare the different directional modes Bakery offers.

I also added a few examples comparing the quality of baked specular, but I personally didn't noticed much of a difference

### 90 - Bakery Soft Shadow
**This scene requires a rebake using Bakery.**
Test how sample count affects shadow quality, and how "legacy sampling" can decrease shadow quality

### 100 - Meta Pass
An example shader that uses meta pass to make a surface reflect green light even though the surface is actually white. The small wall in the middle of the room uses such a shader.

This is the only shader in this repository that wasn't made with Amplify.

### 101 - TransparencyLM
Example of a shader that uses TransparencyLM to add light transmission properties to the material

### 107 - CBIRP
This scene requires the CBIRP package https://github.com/z3y/ClusteredBIRP

Demo scene with 16 light sources

### 114 - Specular Occlusion
AN example where you want specular occlusion to be OFF, or at least less intense, notice the floor not reflecting the Window.

### 115 - Stochastic
Example of Stochastic sampling

### 120~121 - Height map
Comparison of different parallax mapping methods using different shaders.

### 122 - Height map Soft edges
Demonstration of the hard vs soft edges issue, notice the material "warping" around when you get closer to a surface that has "soft" normals

### X - Terrain
Not shown in the full presentation : An example showing that triplanar shaders can be used on terrains to automatically paint slopes.


