# SPM Noise Generation

A Swift Package containing a fractional Brownian Motion implementation over a noise function.

## Modules

Each noise module comes with two implementations:
1. Swift implementation that runs on the CPU
2. Swift code for generating a Metal Shading Language Kernel that can be run on the GPU

The use case for the second approach is for a Metal project in Swift Playgrounds where Metal shader files can't be used directly but shader code must be provided as a string to load into a MTLLibrary.

### SPM Noise Generation

Fractional Brownian Motion implementation over a noise function.

### SPM Open Simplex 2

A port of [KdotJPG](https://github.com/KdotJPG)'s [Open Simplex 2](https://github.com/KdotJPG/OpenSimplex2) for Swift/Metal.

## Usage

Define a dependency from the source package to this one ([Swift Package Manager Docs](https://github.com/apple/swift-package-manager/blob/main/Documentation/Usage.md#defining-dependencies)). 

To use the CPU implementation you can run:

```swift
import SPMNoiseGeneration

...

let fractalNoise = FractalNoiseCPU()

let fractalNoiseParameters = FractalNoiseParameters(
    noiseTypeParameters: .OpenSimplex2(
        FractalOpenSimplex2NoiseParameters(openSimplex3Variant: .xz)),
    octaves: 8,
    lacunarity: 2,
    hurstExponent: 1.5,
    startingAmplitude: 1,
    startingFrequency: 1)

let noise: Float = openSimplex2.noise3(
    seed: 42, 
    coord: SIMD3<Float>(4.3, 2.0, 1.4), 
    fractalNoiseParameters: fractalNoiseParameters)
```

A Metal reference implementation is provided with the same interface as the CPU implementation. To use it, the above code can be changed to use `FractalNoiseMetal()`. However it creates Metal resources which should be managed by the calling app, so direct usage is not recommended with the implementation showing how to access the shader code.
