uniform float uTime;
uniform sampler2D uPerlinTexture;

varying vec2 vUv;

void main() {
    // Scale and animate
    vec2 smokeUv = vUv;
    smokeUv.x *= 0.5;
    smokeUv.y *= 0.3;
    smokeUv.y -= uTime * 0.03;

    // Smoke
    float smoke = texture(uPerlinTexture, smokeUv).r;
    smoke *= smoothstep(0.4, 1.0, smoke);

    smoke *= smoothstep(0.0, 0.15, vUv.x);
    smoke *= smoothstep(1.0, 0.85, vUv.x);
    smoke *= smoothstep(0.0, 0.15, vUv.y);
    smoke *= smoothstep(1.0, 0.4, vUv.y);



    // Final Color
    gl_FragColor = vec4(0.8, 0.5, 0.4, smoke);
    #include <tonemapping_fragment>
    #include <colorspace_fragment>
}