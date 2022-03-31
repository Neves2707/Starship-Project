global.targetx = x
global.targety = y

if mouse_check_button_pressed(mb_right)

{
	
	x = mouse_x
	y = mouse_y
	
}

colision_id = instance_place( x , y , ENEMYSHIPOBJ )

if ( colision_id != noone )

	{
		
		x = colision_id.x
		y = colision_id.y
		
	}


moveGUI()