protocol BossDelegate {
    func cofee()
}

class Boss {
    var delegate: BossDelegate?
    
    func wantCofee() {
        delegate?.cofee()
    }
}

class Helper: BossDelegate {
    func cofee() {
        print("bring cofee")
    }
}

var boss = Boss()
var helper = Helper()

boss.delegate = helper

// у класса Boss нет реализации метода cofee. Она проделегирована классу Helper с помощью протокола BossDelegate
boss.wantCofee()
