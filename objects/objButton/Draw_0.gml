draw_set_color(c_white)
draw_self();
//draw_rectangle(x -14, y-46, x+14 , y-20, true);//top
//draw_rectangle(x -14, y+46, x+14 , y+20, true);//bottom

if(curentVal >= 10)
{
	draw_text(x-15,y-15, string(curentVal));

}

else
{
	draw_text(x-7,y-15, string(curentVal));
}





