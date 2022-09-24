extends Card

var combo = 0

func init():
    att.atk = 3 
    att.maxHp = 2 
    att.cry = 3
    lv = 4
    type = TYPE.CREATURE 
    camp = "m_miracle" 
    name = "Orisk, World's Nightfall" 
    tab = "Elf Adventurer Assassin 刺客" 
    dec = "Battlecry: Combo(1): Deal 3 damage to the enemy hero; Combo(2): Instead draw 2 cards; Combo(3): Instead destroy an enemy follower; Combo(4): Instead do nothing."
    bdec = "After the sun falls down, these blades raise up at nights."  

func _gConnect():
    sys.scene.connect("onCardPlayEnd",self,"r1")
    sys.scene.connect("onRoundEnd",self,"r2")

func _use(card,cell):
    if combo == 1:
        hurtCard(getHero().getOppHero(),3)
    elif combo == 2:
        getHero().drawCard()
        getHero().drawCard()
    elif combo == 3:
        cardDeath(card)
    

func useSelIf(card,cell):
    if combo == 3:
        if card == null && len(sys.scene.getAllCard(getHero(),1,false)) == 0:
            return true
        elif card != null && card.type == TYPE.CREATURE && (card in sys.scene.getAllCard(getHero(),1,false)):
            return true
        else:
            return false
    else:
        return true

func r1(c):
    combo += 1

func r2():
    combo = 0