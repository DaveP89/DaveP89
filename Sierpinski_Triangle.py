from graphics import *
from random import randrange

def main():
    h = 500
    w = 600
    x = w / 2
    y = h / 2
    OLDx = 0
    OLDy = 0
    
    win = GraphWin("My window",h,w)
    win.setBackground(color_rgb(0,0,0))
    
    #1-3 are all left to right
    for i in range(1,10000):
        dice = round(randrange(3) + 1) 
        OLDx = round(x)
        OLDy = round(y)
        
        if dice == 1 :
            x = OLDx / 2
            y = ((h - OLDy) / 2 ) + OLDy
            win.plot(round(x), round(y), "red")
            
        if dice == 2 :
            y = OLDy / 2 
            if x > (w / 2) :
                x = OLDx - ((OLDx - (w / 2)) / 2 )
            else:
                x = OLDx + (((w / 2) - OLDx) / 2 )
            win.plot(round(x), round(y), "blue")
            
        if dice == 3 :
            y = OLDy + ((h - OLDy) / 2)
            x = OLDx + ((w - OLDx) / 2)
            win.plot(round(x), round(y), "green")
            
        #print("Dice:" + str(dice) + ", X=" + str(round(x)) + ", Y=" + str(round(y)))
        print("Done")
    win.getMouse()
    win.close()

main()