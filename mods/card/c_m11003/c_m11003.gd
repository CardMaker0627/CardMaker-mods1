extends Card

var counter = 0

func init():
    att.cry=7
    lv=5
    type=TYPE.MAGIC
    camp="m_miracle"
    name="Last Stand"
    tab=""
    dec="Draw your deck until it is empty. Add Human or Assassin followers from your graveyard to your hand until your hand is full, they cost 0. At the end of your next turn, you lose the game."
    bdec="When nothing remains, everything is equally possible."
    isMount=true

func _use(card,cell):
    for i in range(len(getHero().lib.items)):
        getHero().drawCard()
    var cs = []
    while len(getHero().hand.items) < getHero().mostHandNum:
        for i in getHero().gry.items:
            if i.type == Card.TYPE.CREATURE && i.hasOrTab("人类 刺客"):
                cs=[]
                cs.append(i)
        if cs.size() > 0 :
            var inx = sys.rndRan(0,cs.size()-1)
            var c = cs[inx]
            cs.remove(inx)
            getHero().gry.eraseCard(c)
            c.att.cry=0
            getHero().hand.addCard(c)
        else:
            break

func _connect():
    sys.scene.connect("onRoundEnd",self,"r")

func r():
    if sys.scene.roundhero==getHero():
        counter += 1
    if counter == 2:
        mountEnd()

func mountEnd():
    sys.scene.end(false)
