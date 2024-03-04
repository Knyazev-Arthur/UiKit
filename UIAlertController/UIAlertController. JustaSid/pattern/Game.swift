import Foundation

class Game {
    var secret: Int
    var answer: Int
    
    init() {
        self.secret = Int()
        self.answer = Int()
    }
    
    func generate() {
        secret = Int.random(in: 1...5)
    }
    
    func isRight(answer: Int) -> Bool {
        return answer == secret
    }
}
