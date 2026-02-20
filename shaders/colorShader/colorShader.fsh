varying vec2 v_vTexcoord;
varying vec4 v_vColour;

// Color to replace (normalized 0–1)
uniform vec3 sourceColor0;
uniform vec3 sourceColor1;
uniform vec3 sourceColor2;
uniform vec3 sourceColor3;
uniform vec3 sourceColor4;
uniform vec3 sourceColor5;
uniform vec3 sourceColor6;
uniform vec3 sourceColor7;
uniform vec3 sourceColor8;
uniform vec3 sourceColor9;


// Replacement color (normalized 0–1)
uniform vec3 targetColor0;
uniform vec3 targetColor1;
uniform vec3 targetColor2;
uniform vec3 targetColor3;
uniform vec3 targetColor4;
uniform vec3 targetColor5;
uniform vec3 targetColor6;
uniform vec3 targetColor7;
uniform vec3 targetColor8;
uniform vec3 targetColor9;

void main() {
    vec4 src = texture2D(gm_BaseTexture, v_vTexcoord);

    // Preserve transparency
    if (src.a == 0.0) {
        gl_FragColor = vec4(0.0);
        return;
    }

   float tol = 0.01; // tolerance for color matching
    vec3 outColor = src.rgb;

    // Check each part and replace if within tolerance
		 if (distance(src.rgb, sourceColor0) < tol) outColor = targetColor0;
    else if (distance(src.rgb, sourceColor1) < tol) outColor = targetColor1;
    else if (distance(src.rgb, sourceColor2) < tol) outColor = targetColor2;
    else if (distance(src.rgb, sourceColor3) < tol) outColor = targetColor3;
    else if (distance(src.rgb, sourceColor4) < tol) outColor = targetColor4;
    else if (distance(src.rgb, sourceColor5) < tol) outColor = targetColor5;
	else if (distance(src.rgb, sourceColor6) < tol) outColor = targetColor6;
    else if (distance(src.rgb, sourceColor7) < tol) outColor = targetColor7;
    else if (distance(src.rgb, sourceColor8) < tol) outColor = targetColor8;
    else if (distance(src.rgb, sourceColor9) < tol) outColor = targetColor9;

    // Output the final color with original alpha
    gl_FragColor = vec4(outColor, src.a) * v_vColour;
}