struct Source {
    static private let tasks = [
    "сходить на стендап",
    "сходить на выставку",
    "сходить на квест",
    "сходить в кино",
    "посмотреть сериал"
    ]
    
    static func getTask() -> String? {
        tasks.randomElement()
    }
}
