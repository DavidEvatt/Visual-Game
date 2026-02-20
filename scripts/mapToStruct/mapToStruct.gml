// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function mapToStruct(map)
{
	var s = {};
	if(map != undefined)
	{
		if(ds_exists(map, ds_type_map))
		{
			var keys = ds_map_keys_to_array(map);

		    for (var i = 0; i < array_length(keys); i++)
		    {
		        var k = keys[i];
		        s[$ k] = ds_map_find_value(map, k);
		    }
		}
	}
    

    return s;
}