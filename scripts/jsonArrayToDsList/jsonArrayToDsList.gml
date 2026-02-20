function jsonArrayToDsList(jsonArray)
{
    var list = ds_list_create();

    for (var i = 0; i < array_length(jsonArray); i++)
    {
        var map = ds_map_create();
        var entry = jsonArray[i];

        // Copy all keys from struct into map
        var keys = variable_struct_get_names(entry);
        for (var k = 0; k < array_length(keys); k++)
        {
            var key = keys[k];
            ds_map_add(map, key, entry[$ key]);
        }

        ds_list_add(list, map);
    }

    return list;
}