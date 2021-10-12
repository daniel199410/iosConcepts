import Foundation


func sum(n1: Int?, n2: Int?) throws -> Int {
    guard n1 != nil else {
        throw SumError.firstNumberNill
    }
    guard n2 != nil else {
        throw SumError.secondNumberNill
    }
    if n1! < 0 || n2! < 0 {
        throw SumError.negativeNumber(n1: n1!, n2: n2!)
    }
    return n1! + n2!
}

enum SumError: Error {
    case firstNumberNill
    case secondNumberNill
    case negativeNumber(n1: Int, n2: Int)
}

do {
    print(try sum(n1: 100, n2: -3))
} catch(SumError.firstNumberNill) {
    print("Primer número negativo")
} catch(SumError.secondNumberNill) {
    print("Segundo número negativo")
} catch(SumError.negativeNumber(let n1, let n2)) {
    print("Algún número es negativo: \(n1), \(n2)")
}
