import UIKit

extension String {
    
    func textWithdrawal() -> String {
        
        if let filePath = Bundle.main.path(forResource: self, ofType: "txt") { // путь к файлу
            do {
                let contents = try String(contentsOfFile: filePath, encoding: .utf8) // чтение содержимого файла
                return contents
            } catch { // Обработка ошибки, если она возникнет
                return ""
            }
        }
        
        return ""
    }
    
}
