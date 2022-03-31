function creation()

{
	
	switch global.mode
	
	{
		
		case 0:
		instance_create_layer(x,y,"GAME",ArmorBlockOBJ)
		break;
		
		case 1:
		instance_create_layer(x,y,"GAME",ArmorBlockSlopeOBJ)
		break;
		
		case 2:
		instance_create_layer(x,y,"GAME",MagneticEngineOBJ)
		break;
		
		case 3:
		instance_create_layer(x,y,"GAME",FusionReactorOBJ)
		break;
		
		case 4:
		instance_create_layer(x,y,"GAME",CargoOBJ)
		break;
		
	}
		
}

