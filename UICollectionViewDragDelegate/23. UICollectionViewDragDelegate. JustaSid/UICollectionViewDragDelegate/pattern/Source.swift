import UIKit

struct Source {
    
    static func allPhotos() -> [Photo] {
        [
            .init(id: 1, imageName: "Anna"),
            .init(id: 2, imageName: "Ariana"),
            .init(id: 3, imageName: "Ariel"),
            .init(id: 4, imageName: "Boris"),
            .init(id: 5, imageName: "Geralt"),
            .init(id: 6, imageName: "John"),
            .init(id: 7, imageName: "Kris"),
            .init(id: 8, imageName: "Sam"),
            .init(id: 9, imageName: "Tessa"),
            .init(id: 10, imageName: "Triss")
        ]
    }
    
    static func randomPhotos(with count: Int) -> [Photo] {
        return (0..<count).map { _ in allPhotos().randomElement()! }
    }
}

class Photo: NSObject, NSItemProviderWriting {
    
    static var writableTypeIdentifiersForItemProvider: [String] { // обязательным условием исполнения протокола является получение им уникальных идентификаторов для массива с фото
        ["Photo"]
    }
    
    // метод отвечающий за отображения процесса подгрузки данных (нам не нужен - возвращаем nil)
    func loadData(withTypeIdentifier typeIdentifier: String, forItemProviderCompletionHandler completionHandler: @escaping (Data?, Error?) -> Void) -> Progress? {
        return nil
    }
    
    let id: Int
    let imageName: String
    
    init(id: Int, imageName: String) {
        self.id = id
        self.imageName = imageName
    }
}

struct SectionPhoto {
    let sectionName: String
    var photos: [Photo]
}
