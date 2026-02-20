attribute vec3 in_Position;
attribute vec4 in_Colour;
attribute vec2 in_TextureCoord;

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main() {
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION]
                  * vec4(in_Position, 1.0);

    v_vTexcoord = in_TextureCoord;
    v_vColour   = in_Colour;
}
/*
	[16]  Body
	[32]  Eyes
	[64]  Hairs
	[96]  Hoof
	[128] Horns
	[160] Skin
	
	[180] Primary
	[200] Secondary
	[220] Terciary
	[240] Effect
*/