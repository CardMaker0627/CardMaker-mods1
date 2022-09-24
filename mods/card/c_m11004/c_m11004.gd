extends Card

func init():
    att.cry=3
    lv=1
    type=TYPE.MAGIC
    camp="m_miracle"
    name="Blade Strike"
    tab=""
    dec="Deal 3 damage to target follower. Costs 0 if you have 7 or more cards in your hand."
    aiTab = "hero_hurt_n:1_p:3"

func _gConnect():
    getHero().hand.connect("onChangeNum",self,"r")

func r(num):
    if num >= 7:
        att.cry = 0
    else:
        att.cry = 3

func _use(card,cell):
    hurtCard(card,3)

func useSelIf(card,cell):
    if card != null && card.type == TYPE.CREATURE:
        return true
    else:
        return false
