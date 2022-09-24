extends Card

func init():
    att.cry=2
    lv=2
    type=TYPE.MAGIC
    camp="m_miracle"
    name="Miracle Reappear"
    tab=""
    dec="Draw 4 cards. Discard all drawn this way with cost 2 or more."
    
func _use(card,cell):
    for i in range(4):
        var c=getHero().drawCard()
        if c.att.cry >= 2:
            getHero().hand.eraseCard(c)


