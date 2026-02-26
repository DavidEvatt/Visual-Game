/// @description The Clock

var rotation = (360 / (maxDayTime / currentTime))

draw_sprite_ext(sprClock, 0, window_get_width() - 100, 100, 2, 2, -rotation, c_white, 1)
draw_sprite_ext(sprClockOverlay, 0, window_get_width() - 100, 100, 2, 2, 0, c_white, 1)
