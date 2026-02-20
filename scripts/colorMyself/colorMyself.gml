/*
	[160] Skin
	[128] Horns
	[96]  Hoof
	[64]  Hairs
	[32]  Eyes
	[16]  Body
	
	[180] Primary
	[200] Secondary
	[220] Terciary
	[240] Effect
	
	playerColors[0] = Skin
	playerColors[1] = Horn 
	playerColors[2] = Hoof
	playerColors[3] = Hair / Legs
	playerColors[4] = Eye
	playerColors[5] = Body

	weaponColor[0] = Primary
	weaponColor[1] = Secondary
	weaponColor[2] = Terciary
	weaponColor[3] = Effect
*/

function colorMyself(inst, skin, horn, hoof, hairs, eye, body, pri, sec, ter, effect)
{
	with(inst)
	{
		shader_set(colorShader);
		
		//skin
		var sSkin = shader_get_uniform(colorShader, "sourceColor0");
		var tSkin = shader_get_uniform(colorShader, "targetColor0");
		shader_set_uniform_f(sSkin, 160/255, 160/255, 160/255);
		shader_set_uniform_f(tSkin, color_get_red(skin) / 255, 
								   color_get_green(skin) / 255, 
								   color_get_blue(skin) / 255);
		//Horns
		var sHorn = shader_get_uniform(colorShader, "sourceColor1");
		var tHorn = shader_get_uniform(colorShader, "targetColor1");
		shader_set_uniform_f(sHorn, 128/255, 128/255, 128/255);
		shader_set_uniform_f(tHorn, color_get_red(horn) / 255, 
								   color_get_green(horn) / 255, 
								   color_get_blue(horn) / 255);
		//Hoof
		var sHoof = shader_get_uniform(colorShader, "sourceColor2");
		var tHoof = shader_get_uniform(colorShader, "targetColor2");
		shader_set_uniform_f(sHoof, 96/255, 96/255, 96/255);
		shader_set_uniform_f(tHoof, color_get_red(hoof) / 255, 
								   color_get_green(hoof) / 255, 
								   color_get_blue(hoof) / 255);
		//Hair
		var sHair = shader_get_uniform(colorShader, "sourceColor3");
		var tHair = shader_get_uniform(colorShader, "targetColor3");
		shader_set_uniform_f(sHair, 64/255, 64/255, 64/255);
		shader_set_uniform_f(tHair, color_get_red(hairs) / 255, 
								   color_get_green(hairs) / 255, 
								   color_get_blue(hairs) / 255);
		//Eyes
		var sEye = shader_get_uniform(colorShader, "sourceColor4");
		var tEye = shader_get_uniform(colorShader, "targetColor4");
		shader_set_uniform_f(sEye, 32/255, 32/255, 32/255);
		shader_set_uniform_f(tEye, color_get_red(eye) / 255, 
								   color_get_green(eye) / 255, 
								   color_get_blue(eye) / 255);
		//Body
		var sBody = shader_get_uniform(colorShader, "sourceColor5");
		var tBody = shader_get_uniform(colorShader, "targetColor5");
		shader_set_uniform_f(sBody, 16/255, 16/255, 16/255);
		shader_set_uniform_f(tBody, color_get_red(body) / 255, 
								   color_get_green(body) / 255, 
								   color_get_blue(body) / 255);
		//Primary
		var sPri = shader_get_uniform(colorShader, "sourceColor6");
		var tPri = shader_get_uniform(colorShader, "targetColor6");
		shader_set_uniform_f(sPri, 180/255, 180/255, 180/255);
		shader_set_uniform_f(tPri, color_get_red(pri) / 255, 
								   color_get_green(pri) / 255, 
								   color_get_blue(pri) / 255);
		//Secondary
		var sSec = shader_get_uniform(colorShader, "sourceColor7");
		var tSec = shader_get_uniform(colorShader, "targetColor7");
		shader_set_uniform_f(sSec, 200/255, 200/255, 200/255);
		shader_set_uniform_f(tSec, color_get_red(sec) / 255, 
								   color_get_green(sec) / 255, 
								   color_get_blue(sec) / 255);
								   
		//Tericiary
		var sTer = shader_get_uniform(colorShader, "sourceColor8");
		var tTer = shader_get_uniform(colorShader, "targetColor8");
		shader_set_uniform_f(sTer, 220/255, 220/255, 220/255);
		shader_set_uniform_f(tTer, color_get_red(ter) / 255, 
								   color_get_green(ter) / 255, 
								   color_get_blue(ter) / 255);
								   
		//Effect
		var sEft = shader_get_uniform(colorShader, "sourceColor9");
		var tEft = shader_get_uniform(colorShader, "targetColor9");
		shader_set_uniform_f(sEft, 240/255, 240/255, 240/255);
		shader_set_uniform_f(tEft, color_get_red(effect) / 255, 
								   color_get_green(effect) / 255, 
								   color_get_blue(effect) / 255);
	}
	
}