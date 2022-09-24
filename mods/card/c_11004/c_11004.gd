extends Card

var combo = 0

func init():
    att.atk = 3
    att.maxHp = 3 
    att.cry = 3
    lv = 2
    type = TYPE.CREATURE 
    camp = "m_miracle" 
    name = "The Deadly Knife" 
    tab = "Human Assassin 人类 刺客" 
    dec = "Battlecry: Add a shiv to your hand. Combo(1): Add another."

func _connect():
    var skill:Skill = addSkill("k_zhanHou")
    skill.connect("onTrigger",self,"runTrigger")

func _gConnect():
    sys.scene.connect("onCardPlayEnd",self,"r1")
    sys.scene.connect("onRoundEnd",self,"r2")

func runTrigger():
    var s=getHero().newCard("c_m11000")
    getHero().hand.addCard(getHero().newCard(s.id))
    if combo>=1:
        getHero().hand.addCard(getHero().newCard(s.id))

func r1(c):
    combo += 1

func r2():
    combo = 0