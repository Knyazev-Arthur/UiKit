import UIKit

struct Source {
    
    enum SourceType {
        case word
        case action
    }
    
    private static let trueSource = [
        "Расскажи 5 фактов о себе",
        "Как выглядело первое свидание и первый поцелуй?",
        "За что до сих пор стыдно?",
        "О чем обычно врешь другим людям?",
        "Как бы Вы потратили миллион долларов?",
        "О чем ты мечтаешь?"]
    
    private static let actionSource = [
        "Потанцуй под музыку, которую выбрали игроки",
        "Спародируй любого человека из присутствующих",
        "Отожмись или присядь 10 раз",
        "Спародируй походку Майкла Джексона или Конора Макрегора",
        "Изобрази свой дьявольских смех",
        "Изобрази известную личность, чтобы другие игроки отгадали"
    ]
    
    static func getInfo(type: SourceType) -> String {
        switch type {
        case .word:
            return trueSource[Int.random(in: 0..<trueSource.count)]
        case .action:
            return actionSource[Int.random(in: 0..<actionSource.count)]
        }
    }
}
