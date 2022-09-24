extends Card

func init():
    att.atk = 2
    att.maxHp = 3 
    att.cry = 2
    lv = 1
    type = TYPE.CREATURE 
    camp = "m_miracle" 
    name = "The Processor" 
    tab = "Human Assassin 人类 刺客" 
    dec = "Battlecry: Draw an Assassin follower except this one."

func _connect():
    var skill:Skill = addSkill("k_zhanHou")
    skill.connect("onTrigger",self,"runTrigger")

func runTrigger():
    var card = null
    for i in getHero().lib.items:
        if i.type == TYPE.CREATURE && i.hasTab("Assassin") && i.name!="The Processor":
            getHero().lib.eraseCard(i)
            card = i
            break
    if card != null:
        getHero().hand.addCard(card)