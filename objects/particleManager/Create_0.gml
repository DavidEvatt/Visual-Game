
//pHitEffect
_psHit = part_system_create();
part_system_draw_order(_psHit, true);

//Emitter
_ptype1Hit = part_type_create();
part_type_sprite(_ptype1Hit, hitEffect, false, true, false)
part_type_size(_ptype1Hit, 0.3, 0.5, 0, 0);
part_type_scale(_ptype1Hit, 0.5, 0.5);
part_type_speed(_ptype1Hit, 4, 4, 0, 0);
part_type_direction(_ptype1Hit, 65, 124, 0, 0);
part_type_gravity(_ptype1Hit, 0, 90);
part_type_orientation(_ptype1Hit, 137, 32, 0, 0, false);
part_type_colour3(_ptype1Hit, $FFFFFF, $FFFFFF, $FFFFFF);
part_type_alpha3(_ptype1Hit, 1, 1, 1);
part_type_blend(_ptype1Hit, false);
part_type_life(_ptype1Hit, 10, 15);

_pemit1Hit = part_emitter_create(_psHit);
part_emitter_region(_psHit, _pemit1Hit, -108.829926, 104.829926, -8, 56, ps_shape_ellipse, ps_distr_linear);
part_emitter_burst(_psHit, _pemit1Hit, _ptype1Hit, 6);









