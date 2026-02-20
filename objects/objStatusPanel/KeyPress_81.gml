var amount = ds_map_find_value(objTDPlayer.potionInventory, potionInventory[curPotionInventory])

if(amount > 0)
{
	if(potionInventory[curPotionInventory] != "unstabPot")
	{
		applyPotionEffects(potionInventory[curPotionInventory]);
	}
	
	increaseInventory(potionInventory[curPotionInventory], -1);
}







