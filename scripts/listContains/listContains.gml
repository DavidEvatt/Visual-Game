// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function listContains(list, value)
{
	for (var i = 0; i < ds_list_size(list); i++)
    {
        if (list[| i] == value)
        {
            return true;
        }
    }
    return false;
}