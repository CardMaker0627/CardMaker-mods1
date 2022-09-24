extends Card
    
func init():
    att.atk = 4 
    att.maxHp = 3 
    att.cry = 4
    lv = 3
    type = TYPE.CREATURE 
    camp = "m_miracle" 
    name = "Saborza Beheader" 
    tab = "Human Assassin 人类 刺客" 
    dec = "Battlecry: If you have cards in your library, draw two cards; else deal 4 damage."

func _connect(): 
    addSkill("k_zhanHou")
        
func _use(card,cell):
    if len(getHero().lib.items)==0:
        hurtCard(card,4)
    else:
        getHero().drawCard()
        getHero().drawCard()

func useSelIf(card,cell):
    if len(getHero().lib.items)==0:
        if card != null && (card.type == TYPE.CREATURE || card.type == TYPE.HERO):
            return true
        return false	
    else:
        return true

