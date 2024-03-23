import Foundation

// OPSNUG
// Licensed under the MIT license
// Under all conditions
// By Kiamehr Eskandari
// You may use this piece in your own way, including granting ownership of this work and saying you made it under your country's laws

// Generate a number
// OPSNUG is "Open Source Number Generator"
class OPSNUG {
    var newnum: Int
    var expby: Int
    var operations: (Double, Double, Double) = (0.0, 0.0, 0.0)
    var soper: (Double, Double, Double, Double) = (0.0, 0.0, 0.0, 0.0)
    
    init() {
        self.newnum = Int.random(in: 1...1_000_000) // 1e6 = 1,000,000/1 Million
        self.expby = Int.random(in: 1...20)
    }
    
    // GNN for Generate New Number
    func GNN() -> Int {
        do {
            self.operations = (sqrt(Double(self.newnum)), pow(Double(self.newnum), Double(self.expby)), Double.pi )
            self.soper = (Double(self.newnum) + Double.random(in: 0.0...(self.operations.0)), Double(self.newnum) * Double.random(in: 0.0...(self.operations.1)), Double(self.newnum) - Double.random(in: 0.0...(self.operations.2)), Double(self.newnum) - Double.random(in: 0.0...(self.operations.2)))
            self.newnum = Int(self.soper.0)
            if (self.newnum >= 1) && (self.newnum <= 1_000_000) {
                return self.newnum
            } else {
                return self.GNN()
            }
        }
    }
    
    var description: String {
        return "\(self.newnum)"
    }
    
    var debugDescription: String {
        return "\(self.newnum)"
    }
}

// Shell

// dispni for "display needed info"
func gr() -> String? {
    let pro = ProcessInfo.processInfo.activeProcessorCount
    if pro >= 64 {
        return "Intel 64 Bit"
    } else if pro >= 32 {
        return "Intel 32 Bit"
    } else {
        return nil
    }
}

func dispni() {
    print("OPSNUG First Edition")
    if let processor = gr() {
        print("running on \(processor) processor")
    }
    print("Under the MIT license and under all conditions with ABSOLUTELY NO warranty, in any terms ")
}

dispni()
let retback = OPSNUG()
print(retback.GNN())
