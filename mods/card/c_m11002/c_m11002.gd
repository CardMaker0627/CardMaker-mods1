extends Card

func init():
    att.cry=0
    lv=3
    type=TYPE.MAGIC
    camp="m_miracle"
    name="Mind Blast"
    tab="Mind Spell"
    dec="Destroy 4 random cards in each library."

func _use(card,cell):
    var c
    for i in range(4):
        c=getHero().lib.rndDarw()
        getHero().hand.eraseCard(c)
        c=getHero().getOppHero().lib.rndDarw()
        getHero().getOppHero().hand.eraseCard(c)

