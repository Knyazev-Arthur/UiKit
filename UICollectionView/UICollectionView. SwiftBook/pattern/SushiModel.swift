import Foundation
import UIKit

struct SushiModel {
    var mailnImage: UIImage
    var sushiName: String
    var smallDescription: String
    var cost: Int
    
    static func fetchSushi() -> [SushiModel] {
        let firstItem = SushiModel(mailnImage: UIImage(named: "sushi1") ?? UIImage(),
                                   sushiName: "Jengibre",
                                   smallDescription: "Original Japanese",
                                   cost: 8)
        let secondItem = SushiModel(mailnImage: UIImage(named: "sushi2") ?? UIImage(),
                                   sushiName: "Caviar",
                                   smallDescription: "Original Japanese",
                                   cost: 10)
        let thirdItem = SushiModel(mailnImage: UIImage(named: "sushi3") ?? UIImage(),
                                   sushiName: "Camaron",
                                   smallDescription: "Original Japanese",
                                   cost: 7)
        let fouthItem = SushiModel(mailnImage: UIImage(named: "sushi4") ?? UIImage(),
                                   sushiName: "Salmon",
                                   smallDescription: "Original Japanese",
                                   cost: 12)
        let five = SushiModel(mailnImage: UIImage(named: "sushi5") ?? UIImage(),
                                   sushiName: "RNB",
                                   smallDescription: "Original Japanese",
                                   cost: 12)
        return [firstItem, secondItem, thirdItem, fouthItem, five]
    }
}

struct Constants {
    static let leftDistanceToView: CGFloat = 40 // рассчет расстояния от экрана до левой ячейки
    static let rightDistanceToView: CGFloat = 40 // рассчет расстояния от экрана до правой ячейки
    static let galleryMinimumLineSpacing: CGFloat = 10
    static let galleryItemWidth = (UIScreen.main.bounds.width - Constants.leftDistanceToView - Constants.rightDistanceToView - (Constants.galleryMinimumLineSpacing / 2)) / 2 // выисиляем ширину ячейки
}
