extends Tsk

func init():
    att.cry = 1
    lv = 1
    camp = "m_miracle"
    name = "Preparation"
    dec = "Add a Shiv to your hand"
    aiTab = "we_hero_buff_n:1_p:1"

func _use(card,cell):
    var s=getHero().newCard("c_m11000")
    getHero().hand.addCard(getHero().newCard(s.id))