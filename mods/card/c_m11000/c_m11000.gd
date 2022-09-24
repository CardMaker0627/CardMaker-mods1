extends Card

func init(): 
    att.cry = 1
    lv = 1
    type = TYPE.MAGIC
    camp = "m_miracle" 
    name = "Shiv" 
    tab = "" 
    dec = "Deal 1 damage. Draw a card."
    aiTab = "hero_hurt_n:1_p:1"

func _use(card,cell):
    hurtCard(card,1)
    getHero().drawCard()

func useSelIf(card,cell):
    if card != null && (card.type == TYPE.CREATURE || card.type == TYPE.HERO):
        return true	
    else:
        return false
