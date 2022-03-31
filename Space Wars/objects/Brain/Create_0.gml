//Ship global stats:
					   
global.Deuterium = 0   //Combustivel para o reator
global.Energy = 0      //Energia que a nave é capaz de gerar, armazenas e consumir
global.Resistance = 0  //Pontos de resistencia subtraem de ataques 
global.Food = 0        //Comida
global.ammo = 0		   //Munição
global.Peso = 0		   //Peso da nave (Em toneladas)
global.RawMaterial = 0 //Matéria prima
global.crew = 0        //Tripulação

//Variaveis tecnicas:

global.power = false
global.hostile = false
global.gatilho = false
global.marcha = 0
global.mode = 0
global.time = 0

global.generatorNumber = 0
global.engineNumber = 0
chave = false
contador = 0

global.module_Direction = 0

global.subLightFactor = 0
global.shipSpeed = "FullStop"
global.velocity = 0
global.maxVelocity = 0.6
global.cruisingVelocity = 0.3
global.direction = 1

//Ações iniciais:

alarm[0] = 60
alarm[1] = 1000

//Funções compartilhadas:

function marcha()

{
	
	if keyboard_check(ord("W"))
	
	{
		
		global.marcha = global.marcha + 1
		
	}
	
	else if keyboard_check(ord("S"))
	
	{
		
		global.marcha = global.marcha - 1 
		
	}
	
}

function move()

{
	
	switch global.marcha
	
	{
	
	case 0:
	global.velocity = 0
	break
	
	case 1:
	global.velocity = global.cruisingVelocity
	break
	
	case 2:
	global.velocity = global.maxVelocity
	break
	
	case -1:
	global.velocity = 0 - global.cruisingVelocity
	break
	
	case -2:
	global.velocity = 0 - global.maxVelocity
	break
		
	}
	
	if keyboard_check_pressed(vk_space)

	{
	
	global.gatilho = true
	
	}
	
	if keyboard_check(ord("A"))
	
	{
		
		direction += 1
		
	}
	
	else if keyboard_check(ord("D"))
	
	{
		
		direction -= 1
		
	}
	
	if global.marcha > 2 
	
	{
		
		A = 2
		
	}
	
	else if global.marcha < -2
	
	{
	
	A = -2
	
	}
	 
	speed = global.velocity
	
	image_angle = direction
	
}

function moveGUI()

{
	
	switch global.marcha
	
	{
	
	case 0:
	global.velocity = 0
	break
	
	case 1:
	global.velocity = global.cruisingVelocity
	break
	
	case 2:
	global.velocity = global.maxVelocity
	break
	
	case -1:
	global.velocity = 0 - global.cruisingVelocity
	break
	
	case -2:
	global.velocity = 0 - global.maxVelocity
	break
		
	}
	
	
	if keyboard_check(ord("A"))
	
	{
		
		direction += 1
		
	}
	
	else if keyboard_check(ord("D"))
	
	{
		
		direction -= 1
		
	}
	
	if global.marcha > 2 
	
	{
		
		global.marcha = 2
		
	}
	
	else if global.marcha < -2
	
	{
	
		global.marcha = -2
	
	}
	 
	speed = global.velocity
	
}

function radar()

{
	
	xx = global.targetx
	yy = global.targety
		
	image_angle = point_direction(x,y,xx,yy)
	
	
}

function commands()

{
	
	if keyboard_check_released(ord("F"))
	
	{
	
		if global.hostile == false
	
		{
		
			global.hostile = true
		
		}
	
		else if global.hostile == true 
	
		{
		
			global.hostile = false
		
		}
	
	}
	
}

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

function calculations()

{
	
	//Calculo da velocidade de cruseiro e maxima da nave.
	
	if global.cruisingVelocity <= 0
	
	{
		
		global.cruisingVelocity = 0	
		
	}
		
	if global.maxVelocity <= 0 
	
	{
		
		global.maxVelocity = 0
		
	}
	//Velocodade FIM
	
	//Calculo deletrecidade
	
	global.cruisingVelocity = (global.subLightFactor / 3) - global.Peso
	global.maxVelocity = (global.subLightFactor / 2) - global.Peso
		
	if contador >= 2000

	{
	
		if global.Deuterium >= 1 
	
		{
	
			global.Deuterium -= 1
			global.power = true
			chave = true
			contador = 0
		
		} 
		
		else
		
		{
			
			chave = false
			
		}
	
	}

	contador += 1
	
	if chave == true
	
	{
		
		global.Energy = global.generatorNumber * 100
		
	}
	//Eletrecidade FIM
	
	//Consumo de eletrcidade
	if global.power == true and global.Energy >= 60
	
	{
		
		localA = global.engineNumber * 50
		global.Energy -= localA
		
	}
	//Consumo de eletrecidade FIM
	
}

function moveBuild()

{
	
	global.time = global.time + 1
	
	if ( keyboard_check(ord("W")) and global.time >= 20 )
	
	{
		
		y = y - 64
		global.time = 0
		
	}
	
	if ( keyboard_check(ord("S")) and global.time >= 20 )
	
	{
		
		y = y + 64
		global.time = 0		

	}
	
	if ( keyboard_check(ord("A")) and global.time >= 20 )
	
	{
		
		x = x - 64
		global.time = 0
		
	}
	
	if ( keyboard_check(ord("D")) and global.time >= 20 )
	
	{
		
		x = x + 64
		global.time = 0
		
	}
	
	//girar
	
	if ( keyboard_check(vk_up) and global.time >= 20 )
	
	{
		
		global.module_Direction = 1 
		
	}
	
	if ( keyboard_check(vk_down) and global.time >= 20 )
	
	{
		
		global.module_Direction = 2	

	}
	
	if ( keyboard_check(vk_left) and global.time >= 20 )
	
	{
		
		global.module_Direction = 3 
		
	}
	
	if ( keyboard_check(vk_right) and global.time >= 20 )
	
	{
		
		global.module_Direction = 4 
		
	}
	
	global.time = global.time + 1
	
}