# OPSNUG
# Licensed under the MIT license
# Under all conditions
# By Kiamehr Eskandari
# You may use this peice in your own way, including granting ownership of this work and saying you made it under you countries laws


# Genarate a number
# OPSNUG is "OPen Source NUmber Generator"
from random import choice, randint
import math
from platform import processor
class OPSNUG:
    def __init__(self):

        self.newnum = randint(1, int(1e6)) # 1e6 = 1,000,000/1 Million
        self.expby = randint(1, 20)
    # GNN for Genarate New Number
    def GNN(self):
            try:
                self.operations = (math.sqrt(self.newnum), math.pow(self.newnum, self.expby), math.pi )
                self.soper = (self.newnum + choice(self.operations), self.newnum * choice(self.operations), self.newnum - choice(self.operations), self.newnum - choice(self.operations))
                self.newnum = choice(self.soper)
                if (self.newnum >= 1) and (self.newnum <= int(1e6)):
                    return self.newnum
                else:
                    # this is to make another number if its not within the range
                    self.GNN()
            except:
                # FI a OverFlowError occures, it restarts the class
                self.__init__()
            

    def __str__(self):
        return f"{self.newnum}"
    def __repr__(self):
        return f"{self.newnum}"



# Shell




#################
# SHELL
#################
# dispni for "display needed info"
 
def gr():
        pro = processor().split()
        if "Intel64" in pro[0]:
            pro = pro[0].removesuffix("64")
            return "Intel 64 Bit"
        elif "Intel32" in pro[0]:
            pro = pro[0].removesuffix("32")
            return "Intel 32 Bit"
        else:
            pass
def dispni():
    print("OPSNUG First Edition")
    print(f"running on {gr()} processor")
    print("Under the MIT license and under all conditions with ABSOLUTELY NO warranty, in any terms ")
   
    
dispni()
retback = OPSNUG()
print(retback.GNN())

