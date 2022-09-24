extends Card
    
var combo = 0

func init(): 
    att.cry = 1
    lv = 2
    type = TYPE.MAGIC
    camp = "m_miracle" 
    name = "Thought Gathering" 
    tab = "Mind Spell" 
    dec = "Draw a card. Combo(3): Draw three instead."

func _gConnect():
    sys.scene.connect("onCardPlayEnd",self,"r1")
    sys.scene.connect("onRoundEnd",self,"r2")

func _use(card,cell):
    getHero().drawCard()
    if combo >= 3:
        getHero().drawCard()
        getHero().drawCard()

func r1(c):
    combo += 1

func r2():
    combo = 0
