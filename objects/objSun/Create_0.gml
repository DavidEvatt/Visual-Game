global.night = false;

maxDayTime = 75600;

dawnStart = 0
dayStart = 12600
duskStarts = 37800
nightStarts = 50400

portionTimer = 0;

currentTime = 10800;

alphaVal = 0;

/*
	Dawn  - 3.5 Minutes   -  210 Seconds
	Day   -   7 Minutes   -  420 Seconds
	Dusk  - 3.5 Minutes   -  210 Seconds
	Night -   7 Minutes   -  420 Seconds

	Dawn  - 12600
	Day   - 25200
	Dusk  - 12600
	Night - 25200
	
*/

application_surface_draw_enable(false);
camWidth = camera_get_view_width(objCamera.cam)
camHeight = camera_get_view_height(objCamera.cam)

lightSurf = surface_create(camWidth, camHeight)

midnightBlue = make_color_rgb(6, 27, 59);