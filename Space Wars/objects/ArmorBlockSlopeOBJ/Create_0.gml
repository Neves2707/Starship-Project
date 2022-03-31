global.Resistance = global.Resistance + 10
global.Peso = global.Peso + 0.05

switch global.module_Direction

{
	
	case 1: //up
	image_angle = 90
	break;
	
	case 2: //down
	image_angle = -90
	break;
	
	case 3: //left
	image_angle = 0
	break;
	
	case 4: //right
	image_angle = 180
	break;
	
}