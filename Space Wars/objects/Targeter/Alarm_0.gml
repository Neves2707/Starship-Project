if global.hostile == true and global.ammo >= 1

{
	
	projetil = instance_create_layer(x,y,"instances_1",SPACETORPEDOESOBJ)
	projetil.direction = image_angle
	global.ammo -=1
	
}

alarm_set(0,60)