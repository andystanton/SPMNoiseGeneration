public class OpenSimplex2MetalNoise4: OpenSimplex2MetalNoiseShader {
    static func getVariableMap() -> [String: String] {
        let N_GRADS_4D_EXPONENT = 9
        let N_GRADS_4D = 1 << N_GRADS_4D_EXPONENT
        let NORMALIZER_4D = 0.0220065933241897
        let grad4 = [
            -0.6740059517812944,   -0.3239847771997537,   -0.3239847771997537,    0.5794684678643381,
             -0.7504883828755602,   -0.4004672082940195,    0.15296486218853164,   0.5029860367700724,
             -0.7504883828755602,    0.15296486218853164,  -0.4004672082940195,    0.5029860367700724,
             -0.8828161875373585,    0.08164729285680945,   0.08164729285680945,   0.4553054119602712,
             -0.4553054119602712,   -0.08164729285680945,  -0.08164729285680945,   0.8828161875373585,
             -0.5029860367700724,   -0.15296486218853164,   0.4004672082940195,    0.7504883828755602,
             -0.5029860367700724,    0.4004672082940195,   -0.15296486218853164,   0.7504883828755602,
             -0.5794684678643381,    0.3239847771997537,    0.3239847771997537,    0.6740059517812944,
             -0.6740059517812944,   -0.3239847771997537,    0.5794684678643381,   -0.3239847771997537,
             -0.7504883828755602,   -0.4004672082940195,    0.5029860367700724,    0.15296486218853164,
             -0.7504883828755602,    0.15296486218853164,   0.5029860367700724,   -0.4004672082940195,
             -0.8828161875373585,    0.08164729285680945,   0.4553054119602712,    0.08164729285680945,
             -0.4553054119602712,   -0.08164729285680945,   0.8828161875373585,   -0.08164729285680945,
             -0.5029860367700724,   -0.15296486218853164,   0.7504883828755602,    0.4004672082940195,
             -0.5029860367700724,    0.4004672082940195,    0.7504883828755602,   -0.15296486218853164,
             -0.5794684678643381,    0.3239847771997537,    0.6740059517812944,    0.3239847771997537,
             -0.6740059517812944,    0.5794684678643381,   -0.3239847771997537,   -0.3239847771997537,
             -0.7504883828755602,    0.5029860367700724,   -0.4004672082940195,    0.15296486218853164,
             -0.7504883828755602,    0.5029860367700724,    0.15296486218853164,  -0.4004672082940195,
             -0.8828161875373585,    0.4553054119602712,    0.08164729285680945,   0.08164729285680945,
             -0.4553054119602712,    0.8828161875373585,   -0.08164729285680945,  -0.08164729285680945,
             -0.5029860367700724,    0.7504883828755602,   -0.15296486218853164,   0.4004672082940195,
             -0.5029860367700724,    0.7504883828755602,    0.4004672082940195,   -0.15296486218853164,
             -0.5794684678643381,    0.6740059517812944,    0.3239847771997537,    0.3239847771997537,
             0.5794684678643381,   -0.6740059517812944,   -0.3239847771997537,   -0.3239847771997537,
             0.5029860367700724,   -0.7504883828755602,   -0.4004672082940195,    0.15296486218853164,
             0.5029860367700724,   -0.7504883828755602,    0.15296486218853164,  -0.4004672082940195,
             0.4553054119602712,   -0.8828161875373585,    0.08164729285680945,   0.08164729285680945,
             0.8828161875373585,   -0.4553054119602712,   -0.08164729285680945,  -0.08164729285680945,
             0.7504883828755602,   -0.5029860367700724,   -0.15296486218853164,   0.4004672082940195,
             0.7504883828755602,   -0.5029860367700724,    0.4004672082940195,   -0.15296486218853164,
             0.6740059517812944,   -0.5794684678643381,    0.3239847771997537,    0.3239847771997537,
             //------------------------------------------------------------------------------------------//
             -0.753341017856078,    -0.37968289875261624,  -0.37968289875261624,  -0.37968289875261624,
             -0.7821684431180708,   -0.4321472685365301,   -0.4321472685365301,    0.12128480194602098,
             -0.7821684431180708,   -0.4321472685365301,    0.12128480194602098,  -0.4321472685365301,
             -0.7821684431180708,    0.12128480194602098,  -0.4321472685365301,   -0.4321472685365301,
             -0.8586508742123365,   -0.508629699630796,     0.044802370851755174,  0.044802370851755174,
             -0.8586508742123365,    0.044802370851755174, -0.508629699630796,     0.044802370851755174,
             -0.8586508742123365,    0.044802370851755174,  0.044802370851755174, -0.508629699630796,
             -0.9982828964265062,   -0.03381941603233842,  -0.03381941603233842,  -0.03381941603233842,
             -0.37968289875261624,  -0.753341017856078,    -0.37968289875261624,  -0.37968289875261624,
             -0.4321472685365301,   -0.7821684431180708,   -0.4321472685365301,    0.12128480194602098,
             -0.4321472685365301,   -0.7821684431180708,    0.12128480194602098,  -0.4321472685365301,
             0.12128480194602098,  -0.7821684431180708,   -0.4321472685365301,   -0.4321472685365301,
             -0.508629699630796,    -0.8586508742123365,    0.044802370851755174,  0.044802370851755174,
             0.044802370851755174, -0.8586508742123365,   -0.508629699630796,     0.044802370851755174,
             0.044802370851755174, -0.8586508742123365,    0.044802370851755174, -0.508629699630796,
             -0.03381941603233842,  -0.9982828964265062,   -0.03381941603233842,  -0.03381941603233842,
             -0.37968289875261624,  -0.37968289875261624,  -0.753341017856078,    -0.37968289875261624,
             -0.4321472685365301,   -0.4321472685365301,   -0.7821684431180708,    0.12128480194602098,
             -0.4321472685365301,    0.12128480194602098,  -0.7821684431180708,   -0.4321472685365301,
             0.12128480194602098,  -0.4321472685365301,   -0.7821684431180708,   -0.4321472685365301,
             -0.508629699630796,     0.044802370851755174, -0.8586508742123365,    0.044802370851755174,
             0.044802370851755174, -0.508629699630796,    -0.8586508742123365,    0.044802370851755174,
             0.044802370851755174,  0.044802370851755174, -0.8586508742123365,   -0.508629699630796,
             -0.03381941603233842,  -0.03381941603233842,  -0.9982828964265062,   -0.03381941603233842,
             -0.37968289875261624,  -0.37968289875261624,  -0.37968289875261624,  -0.753341017856078,
             -0.4321472685365301,   -0.4321472685365301,    0.12128480194602098,  -0.7821684431180708,
             -0.4321472685365301,    0.12128480194602098,  -0.4321472685365301,   -0.7821684431180708,
             0.12128480194602098,  -0.4321472685365301,   -0.4321472685365301,   -0.7821684431180708,
             -0.508629699630796,     0.044802370851755174,  0.044802370851755174, -0.8586508742123365,
             0.044802370851755174, -0.508629699630796,     0.044802370851755174, -0.8586508742123365,
             0.044802370851755174,  0.044802370851755174, -0.508629699630796,    -0.8586508742123365,
             -0.03381941603233842,  -0.03381941603233842,  -0.03381941603233842,  -0.9982828964265062,
             -0.3239847771997537,   -0.6740059517812944,   -0.3239847771997537,    0.5794684678643381,
             -0.4004672082940195,   -0.7504883828755602,    0.15296486218853164,   0.5029860367700724,
             0.15296486218853164,  -0.7504883828755602,   -0.4004672082940195,    0.5029860367700724,
             0.08164729285680945,  -0.8828161875373585,    0.08164729285680945,   0.4553054119602712,
             -0.08164729285680945,  -0.4553054119602712,   -0.08164729285680945,   0.8828161875373585,
             -0.15296486218853164,  -0.5029860367700724,    0.4004672082940195,    0.7504883828755602,
             0.4004672082940195,   -0.5029860367700724,   -0.15296486218853164,   0.7504883828755602,
             0.3239847771997537,   -0.5794684678643381,    0.3239847771997537,    0.6740059517812944,
             -0.3239847771997537,   -0.3239847771997537,   -0.6740059517812944,    0.5794684678643381,
             -0.4004672082940195,    0.15296486218853164,  -0.7504883828755602,    0.5029860367700724,
             0.15296486218853164,  -0.4004672082940195,   -0.7504883828755602,    0.5029860367700724,
             0.08164729285680945,   0.08164729285680945,  -0.8828161875373585,    0.4553054119602712,
             -0.08164729285680945,  -0.08164729285680945,  -0.4553054119602712,    0.8828161875373585,
             -0.15296486218853164,   0.4004672082940195,   -0.5029860367700724,    0.7504883828755602,
             0.4004672082940195,   -0.15296486218853164,  -0.5029860367700724,    0.7504883828755602,
             0.3239847771997537,    0.3239847771997537,   -0.5794684678643381,    0.6740059517812944,
             -0.3239847771997537,   -0.6740059517812944,    0.5794684678643381,   -0.3239847771997537,
             -0.4004672082940195,   -0.7504883828755602,    0.5029860367700724,    0.15296486218853164,
             0.15296486218853164,  -0.7504883828755602,    0.5029860367700724,   -0.4004672082940195,
             0.08164729285680945,  -0.8828161875373585,    0.4553054119602712,    0.08164729285680945,
             -0.08164729285680945,  -0.4553054119602712,    0.8828161875373585,   -0.08164729285680945,
             -0.15296486218853164,  -0.5029860367700724,    0.7504883828755602,    0.4004672082940195,
             0.4004672082940195,   -0.5029860367700724,    0.7504883828755602,   -0.15296486218853164,
             0.3239847771997537,   -0.5794684678643381,    0.6740059517812944,    0.3239847771997537,
             -0.3239847771997537,   -0.3239847771997537,    0.5794684678643381,   -0.6740059517812944,
             -0.4004672082940195,    0.15296486218853164,   0.5029860367700724,   -0.7504883828755602,
             0.15296486218853164,  -0.4004672082940195,    0.5029860367700724,   -0.7504883828755602,
             0.08164729285680945,   0.08164729285680945,   0.4553054119602712,   -0.8828161875373585,
             -0.08164729285680945,  -0.08164729285680945,   0.8828161875373585,   -0.4553054119602712,
             -0.15296486218853164,   0.4004672082940195,    0.7504883828755602,   -0.5029860367700724,
             0.4004672082940195,   -0.15296486218853164,   0.7504883828755602,   -0.5029860367700724,
             0.3239847771997537,    0.3239847771997537,    0.6740059517812944,   -0.5794684678643381,
             -0.3239847771997537,    0.5794684678643381,   -0.6740059517812944,   -0.3239847771997537,
             -0.4004672082940195,    0.5029860367700724,   -0.7504883828755602,    0.15296486218853164,
             0.15296486218853164,   0.5029860367700724,   -0.7504883828755602,   -0.4004672082940195,
             0.08164729285680945,   0.4553054119602712,   -0.8828161875373585,    0.08164729285680945,
             -0.08164729285680945,   0.8828161875373585,   -0.4553054119602712,   -0.08164729285680945,
             -0.15296486218853164,   0.7504883828755602,   -0.5029860367700724,    0.4004672082940195,
             0.4004672082940195,    0.7504883828755602,   -0.5029860367700724,   -0.15296486218853164,
             0.3239847771997537,    0.6740059517812944,   -0.5794684678643381,    0.3239847771997537,
             -0.3239847771997537,    0.5794684678643381,   -0.3239847771997537,   -0.6740059517812944,
             -0.4004672082940195,    0.5029860367700724,    0.15296486218853164,  -0.7504883828755602,
             0.15296486218853164,   0.5029860367700724,   -0.4004672082940195,   -0.7504883828755602,
             0.08164729285680945,   0.4553054119602712,    0.08164729285680945,  -0.8828161875373585,
             -0.08164729285680945,   0.8828161875373585,   -0.08164729285680945,  -0.4553054119602712,
             -0.15296486218853164,   0.7504883828755602,    0.4004672082940195,   -0.5029860367700724,
             0.4004672082940195,    0.7504883828755602,   -0.15296486218853164,  -0.5029860367700724,
             0.3239847771997537,    0.6740059517812944,    0.3239847771997537,   -0.5794684678643381,
             0.5794684678643381,   -0.3239847771997537,   -0.6740059517812944,   -0.3239847771997537,
             0.5029860367700724,   -0.4004672082940195,   -0.7504883828755602,    0.15296486218853164,
             0.5029860367700724,    0.15296486218853164,  -0.7504883828755602,   -0.4004672082940195,
             0.4553054119602712,    0.08164729285680945,  -0.8828161875373585,    0.08164729285680945,
             0.8828161875373585,   -0.08164729285680945,  -0.4553054119602712,   -0.08164729285680945,
             0.7504883828755602,   -0.15296486218853164,  -0.5029860367700724,    0.4004672082940195,
             0.7504883828755602,    0.4004672082940195,   -0.5029860367700724,   -0.15296486218853164,
             0.6740059517812944,    0.3239847771997537,   -0.5794684678643381,    0.3239847771997537,
             0.5794684678643381,   -0.3239847771997537,   -0.3239847771997537,   -0.6740059517812944,
             0.5029860367700724,   -0.4004672082940195,    0.15296486218853164,  -0.7504883828755602,
             0.5029860367700724,    0.15296486218853164,  -0.4004672082940195,   -0.7504883828755602,
             0.4553054119602712,    0.08164729285680945,   0.08164729285680945,  -0.8828161875373585,
             0.8828161875373585,   -0.08164729285680945,  -0.08164729285680945,  -0.4553054119602712,
             0.7504883828755602,   -0.15296486218853164,   0.4004672082940195,   -0.5029860367700724,
             0.7504883828755602,    0.4004672082940195,   -0.15296486218853164,  -0.5029860367700724,
             0.6740059517812944,    0.3239847771997537,    0.3239847771997537,   -0.5794684678643381,
             0.03381941603233842,   0.03381941603233842,   0.03381941603233842,   0.9982828964265062,
             -0.044802370851755174, -0.044802370851755174,  0.508629699630796,     0.8586508742123365,
             -0.044802370851755174,  0.508629699630796,    -0.044802370851755174,  0.8586508742123365,
             -0.12128480194602098,   0.4321472685365301,    0.4321472685365301,    0.7821684431180708,
             0.508629699630796,    -0.044802370851755174, -0.044802370851755174,  0.8586508742123365,
             0.4321472685365301,   -0.12128480194602098,   0.4321472685365301,    0.7821684431180708,
             0.4321472685365301,    0.4321472685365301,   -0.12128480194602098,   0.7821684431180708,
             0.37968289875261624,   0.37968289875261624,   0.37968289875261624,   0.753341017856078,
             0.03381941603233842,   0.03381941603233842,   0.9982828964265062,    0.03381941603233842,
             -0.044802370851755174,  0.044802370851755174,  0.8586508742123365,    0.508629699630796,
             -0.044802370851755174,  0.508629699630796,     0.8586508742123365,   -0.044802370851755174,
             -0.12128480194602098,   0.4321472685365301,    0.7821684431180708,    0.4321472685365301,
             0.508629699630796,    -0.044802370851755174,  0.8586508742123365,   -0.044802370851755174,
             0.4321472685365301,   -0.12128480194602098,   0.7821684431180708,    0.4321472685365301,
             0.4321472685365301,    0.4321472685365301,    0.7821684431180708,   -0.12128480194602098,
             0.37968289875261624,   0.37968289875261624,   0.753341017856078,     0.37968289875261624,
             0.03381941603233842,   0.9982828964265062,    0.03381941603233842,   0.03381941603233842,
             -0.044802370851755174,  0.8586508742123365,   -0.044802370851755174,  0.508629699630796,
             -0.044802370851755174,  0.8586508742123365,    0.508629699630796,    -0.044802370851755174,
             -0.12128480194602098,   0.7821684431180708,    0.4321472685365301,    0.4321472685365301,
             0.508629699630796,     0.8586508742123365,   -0.044802370851755174, -0.044802370851755174,
             0.4321472685365301,    0.7821684431180708,   -0.12128480194602098,   0.4321472685365301,
             0.4321472685365301,    0.7821684431180708,    0.4321472685365301,   -0.12128480194602098,
             0.37968289875261624,   0.753341017856078,     0.37968289875261624,   0.37968289875261624,
             0.9982828964265062,    0.03381941603233842,   0.03381941603233842,   0.03381941603233842,
             0.8586508742123365,   -0.044802370851755174, -0.044802370851755174,  0.508629699630796,
             0.8586508742123365,   -0.044802370851755174,  0.508629699630796,    -0.044802370851755174,
             0.7821684431180708,   -0.12128480194602098,   0.4321472685365301,    0.4321472685365301,
             0.8586508742123365,    0.508629699630796,    -0.044802370851755174, -0.044802370851755174,
             0.7821684431180708,    0.4321472685365301,   -0.12128480194602098,   0.4321472685365301,
             0.7821684431180708,    0.4321472685365301,    0.4321472685365301,   -0.12128480194602098,
             0.753341017856078,     0.37968289875261624,   0.37968289875261624,   0.37968289875261624,
        ].map { Float($0 / NORMALIZER_4D) }
        var GRADIENTS_4D = Array<Float>.init(repeating: 0, count: N_GRADS_4D * 4)

        var j = 0
        for i in 0..<GRADIENTS_4D.count {
            if j == grad4.count {
                j = 0
            }
            GRADIENTS_4D[i] = grad4[j];
            j += 1
        }

        let variableMap = [
            "N_GRADS_4D": String(N_GRADS_4D),
            "N_GRADS_4D_EXPONENT": String(N_GRADS_4D_EXPONENT),
            "GRADIENTS_4D": "{ \(GRADIENTS_4D.map { formatDouble(Double($0)) }.joined(separator: ", ")) }",
        ]

        return variableMap
    }

     static var functionName: String = "openSimplexNoise4"

    static var metalFunction: String =
"""
    kernel void \(functionName)(
        constant OpenSimplex2MetalParameters &uniforms [[ buffer(0) ]],
        constant const float4 * in                     [[ buffer(1) ]],
        device float * out                             [[ buffer(2) ]],
        uint2 thread_position_in_grid                  [[ thread_position_in_grid ]]
    ) {
        int index = thread_position_in_grid.x;

        switch (uniforms.noise4Variant) {
            case OpenSimplex2MetalNoise4Variant::xyz:
                out[index] = noise4_ImproveXYZ(uniforms.seed, in[index].x, in[index].y, in[index].z, in[index].w);
                break;
            case OpenSimplex2MetalNoise4Variant::xyz_xy:
                out[index] = noise4_ImproveXYZ_ImproveXY(uniforms.seed, in[index].x, in[index].y, in[index].z, in[index].w);
                break;
            case OpenSimplex2MetalNoise4Variant::xyz_xz:
                out[index] = noise4_ImproveXYZ_ImproveXZ(uniforms.seed, in[index].x, in[index].y, in[index].z, in[index].w);
                break;
            case OpenSimplex2MetalNoise4Variant::xy_zw:
                out[index] = noise4_ImproveXY_ImproveZW(uniforms.seed, in[index].x, in[index].y, in[index].z, in[index].w);
                break;
            case OpenSimplex2MetalNoise4Variant::fallback:
                out[index] = noise4_Fallback(uniforms.seed, in[index].x, in[index].y, in[index].z, in[index].w);
                break;
        }
    }

"""

    static var metalFunctionWithNormal: String? = nil

    static var functionWithNormalName: String? = nil

    static var baseFunction: String =
"""
    constant static int const N_GRADS_4D_EXPONENT = ${N_GRADS_4D_EXPONENT};
    constant static int const N_GRADS_4D = ${N_GRADS_4D};
    constant static float GRADIENTS_4D[N_GRADS_4D * 8] = ${GRADIENTS_4D};

    constant static float const SKEW_4D = -0.138196601125011f;
    constant static float const UNSKEW_4D = 0.309016994374947f;
    constant static float const LATTICE_STEP_4D = 0.2f;
    constant static float const RSQUARED_4D = 0.6f;
    constant static long const SEED_OFFSET_4D = 0xE83DC3E0DA7164DL;

    float grad(long seed, long xsvp, long ysvp, long zsvp, long wsvp, float dx, float dy, float dz, float dw) {
        long hash = seed ^ (xsvp ^ ysvp) ^ (zsvp ^ wsvp);
        hash *= HASH_MULTIPLIER;
        hash ^= hash >> (64 - N_GRADS_4D_EXPONENT + 2);
        int gi = (int)hash & ((N_GRADS_4D - 1) << 2);
        return (GRADIENTS_4D[gi | 0] * dx + GRADIENTS_4D[gi | 1] * dy) + (GRADIENTS_4D[gi | 2] * dz + GRADIENTS_4D[gi | 3] * dw);
    }

    float noise4_UnskewedBase(long seed, float xs, float ys, float zs, float ws) {

        // Get base points and offsets
        int xsb = fastFloor(xs), ysb = fastFloor(ys), zsb = fastFloor(zs), wsb = fastFloor(ws);
        float xsi = (float)(xs - xsb), ysi = (float)(ys - ysb), zsi = (float)(zs - zsb), wsi = (float)(ws - wsb);

        // Determine which lattice we can be confident has a contributing point its corresponding cell's base simplex.
        // We only look at the spaces between the diagonal planes. This proved effective in all of my tests.
        float siSum = (xsi + ysi) + (zsi + wsi);
        int startingLattice = (int)(siSum * 1.25);

        // Offset for seed based on first lattice copy.
        seed += startingLattice * SEED_OFFSET_4D;

        // Offset for lattice point relative positions (skewed)
        float startingLatticeOffset = startingLattice * -LATTICE_STEP_4D;
        xsi += startingLatticeOffset; ysi += startingLatticeOffset; zsi += startingLatticeOffset; wsi += startingLatticeOffset;

        // Prep for vertex contributions.
        float ssi = (siSum + startingLatticeOffset * 4) * UNSKEW_4D;

        // Prime pre-multiplication for hash.
        long xsvp = xsb * PRIME_X, ysvp = ysb * PRIME_Y, zsvp = zsb * PRIME_Z, wsvp = wsb * PRIME_W;

        // Five points to add, total, from five copies of the A4 lattice.
        float value = 0;
        for (int i = 0; ; i++) {

            // Next point is the closest vertex on the 4-simplex whose base vertex is the aforementioned vertex.
            float score0 = 1.0 + ssi * (-1.0 / UNSKEW_4D); // Seems slightly faster than 1.0-xsi-ysi-zsi-wsi
            if (xsi >= ysi && xsi >= zsi && xsi >= wsi && xsi >= score0) {
                xsvp += PRIME_X;
                xsi -= 1;
                ssi -= UNSKEW_4D;
            }
            else if (ysi > xsi && ysi >= zsi && ysi >= wsi && ysi >= score0) {
                ysvp += PRIME_Y;
                ysi -= 1;
                ssi -= UNSKEW_4D;
            }
            else if (zsi > xsi && zsi > ysi && zsi >= wsi && zsi >= score0) {
                zsvp += PRIME_Z;
                zsi -= 1;
                ssi -= UNSKEW_4D;
            }
            else if (wsi > xsi && wsi > ysi && wsi > zsi && wsi >= score0) {
                wsvp += PRIME_W;
                wsi -= 1;
                ssi -= UNSKEW_4D;
            }

            // gradient contribution with falloff.
            float dx = xsi + ssi, dy = ysi + ssi, dz = zsi + ssi, dw = wsi + ssi;
            float a = (dx * dx + dy * dy) + (dz * dz + dw * dw);
            if (a < RSQUARED_4D) {
                a -= RSQUARED_4D;
                a *= a;
                value += a * a * grad(seed, xsvp, ysvp, zsvp, wsvp, dx, dy, dz, dw);
            }

            // Break from loop if we're done, skipping updates below.
            if (i == 4) break;

            // Update for next lattice copy shifted down by <-0.2, -0.2, -0.2, -0.2>.
            xsi += LATTICE_STEP_4D; ysi += LATTICE_STEP_4D; zsi += LATTICE_STEP_4D; wsi += LATTICE_STEP_4D;
            ssi += LATTICE_STEP_4D * 4 * UNSKEW_4D;
            seed -= SEED_OFFSET_4D;

            // Because we don't always start on the same lattice copy, there's a special reset case.
            if (i == startingLattice) {
                xsvp -= PRIME_X;
                ysvp -= PRIME_Y;
                zsvp -= PRIME_Z;
                wsvp -= PRIME_W;
                seed += SEED_OFFSET_4D * 5;
            }
        }

        return value;
    }

    float noise4_ImproveXYZ_ImproveXY(long seed, float x, float y, float z, float w) {
        float xy = x + y;
        float s2 = xy * -0.21132486540518699998;
        float zz = z * 0.28867513459481294226;
        float ww = w * 0.2236067977499788;
        float xr = x + (zz + ww + s2), yr = y + (zz + ww + s2);
        float zr = xy * -0.57735026918962599998 + (zz + ww);
        float wr = z * -0.866025403784439 + ww;

        return noise4_UnskewedBase(seed, xr, yr, zr, wr);
    }

    float noise4_ImproveXYZ_ImproveXZ(long seed, float x, float y, float z, float w) {
        float xz = x + z;
        float s2 = xz * -0.21132486540518699998;
        float yy = y * 0.28867513459481294226;
        float ww = w * 0.2236067977499788;
        float xr = x + (yy + ww + s2), zr = z + (yy + ww + s2);
        float yr = xz * -0.57735026918962599998 + (yy + ww);
        float wr = y * -0.866025403784439 + ww;

        return noise4_UnskewedBase(seed, xr, yr, zr, wr);
    }

    float noise4_ImproveXYZ(long seed, float x, float y, float z, float w) {

        float xyz = x + y + z;
        float ww = w * 0.2236067977499788;
        float s2 = xyz * -0.16666666666666666 + ww;
        float xs = x + s2, ys = y + s2, zs = z + s2, ws = -0.5 * xyz + ww;

        return noise4_UnskewedBase(seed, xs, ys, zs, ws);
    }

    float noise4_ImproveXY_ImproveZW(long seed, float x, float y, float z, float w) {

        float s2 = (x + y) * -0.178275657951399372 + (z + w) * 0.215623393288842828;
        float t2 = (z + w) * -0.403949762580207112 + (x + y) * -0.375199083010075342;
        float xs = x + s2, ys = y + s2, zs = z + t2, ws = w + t2;

        return noise4_UnskewedBase(seed, xs, ys, zs, ws);
    }

    /**
     * 4D OpenSimplex2 noise, fallback lattice orientation.
     */
    float noise4_Fallback(long seed, float x, float y, float z, float w) {

        // Get points for A4 lattice
        float s = SKEW_4D * (x + y + z + w);
        float xs = x + s, ys = y + s, zs = z + s, ws = w + s;

        return noise4_UnskewedBase(seed, xs, ys, zs, ws);
    }


"""
}
