import UIKit
import AVFoundation

extension String {
    
    func duration() -> String {
        if let audioFileURL = Bundle.main.url(forResource: self, withExtension: "mp3") { // объект Bundle, предоставляющий доступ к ресурсам приложения
            let avPlayerItem = AVPlayerItem(url: audioFileURL) // AVPlayerItem - класс, предоставляемый фреймворком AVFoundation для представления отдельного элемента определенного медиаконтента
            let duration = avPlayerItem.asset.duration // продолжительность аудиофайла из свойства duration объекта
            let durationSeconds = CMTimeGetSeconds(duration) // преобразование CMTime в секунды
            let minutes = Int(durationSeconds / 60) // количество полных минут в продолжительности
            let seconds = Int(durationSeconds.truncatingRemainder(dividingBy: 60)) // количество секунд, оставшихся после вычета минут
            
            return String(format: "%02d:%02d", minutes, seconds) // продолжительность с двумя знаками для минут и секунд
        } else {
            return "Отсутствует объект для отображения времени"
        }
    }
    
}
