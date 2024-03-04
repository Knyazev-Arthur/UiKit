import UIKit

extension UIView {
    
    // метод настройки анимации рамок
    func animateBorderWidth(toValue: CGFloat, duration: Double) { // toValue - значение ширины рамки, duration - длительность анимации
        let animation = CABasicAnimation(keyPath: "borderWidth") // объект анимации для свойства borderWidth у слоя (layer) UserProfileView. keyPath указывает, какое свойство будет анимироваться - ширина рамки
        animation.fromValue = layer.borderWidth // начальное значение анимации (fromValue) устанавливается на текущее значение ширины границы слоя layer
        animation.toValue = toValue // конечное значение анимации устанавливается на передаваемое значение
        animation.duration = duration // длительность анимации устанавливается на передаваемое значение
        layer.add(animation, forKey: "Width") // добавляем анимацию к слою layer UserProfileView. forKey - ключ для идентификации
        layer.borderWidth = toValue // финальное значение ширины после анимации
    }
    
}
