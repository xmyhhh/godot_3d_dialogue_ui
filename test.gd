extends Node3D

@export var dialog_box:Node

var test_data = [
	{
		'name': "Mr.Dot",
		'content':"dsadasfas asdasdas fsad a",
		'end':"..."
	},
	{
		'name': "Mr.Dotasasad",
		'content':" 三千年前，神明降临。
					仙、神决战致天地大灾变。灵气衰弱，仙人消失，神明却重新渗透人间；
					一百六十多年前，异宝降临。
					富饶的赤帕高原、战无不胜的盘龙古城，尽数化为黄土；
					如今，我，降临了！
					追寻仙人留下的线索，扭转既定的宿命，解开仙魔的真相……
					而一切的起源，要从回到盘龙古城、体验波澜悲壮的历史开始。
					PS：本文为迷雾文，不开上帝视角，世界的全貌及真相随主角行动而逐步揭开，重探索、重体验，不套路。
					（已有完结老书三本1200万+字。《保卫国师大人》实体书全网销售，动漫版权售出，影视剧备案已过，筹拍中；
					《宁小闲御神录》影视、动漫、舞台剧版权均已售出。）
					",
		'end':"..."
	},
	{
		'name': "Mr.Dot",
		'content':"dsadasfas asdasdas fsad a",
		'end':"..."
	}
]

func test1():

	dialog_box.set_top(test_data[0]["name"])
	dialog_box.set_center(test_data[0]["content"])
	dialog_box.set_buttom(test_data[0]["end"])

func test2():
	dialog_box.set_top(test_data[1]["name"])
	dialog_box.set_center(test_data[1]["content"])
	dialog_box.set_buttom(test_data[1]["end"])

func test3():
	dialog_box.set_top(test_data[2]["name"])
	dialog_box.set_center(test_data[2]["content"])
	dialog_box.set_buttom(test_data[2]["end"])
