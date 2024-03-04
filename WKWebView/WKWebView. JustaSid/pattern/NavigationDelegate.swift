import UIKit
import WebKit

class NavigationDelegate: NSObject, NavigationDelegateProtocol {
    weak var userWebView: UserWebView?
    
    // метод для установки условий возможности перехода по url адресу
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        print("decidePolicyFor")
        
        guard let url = navigationAction.request.url?.absoluteString else { return }
        if url.contains("apple") {
            guard let url = URL(string: "https://www.youtube.com") else { return }
            userWebView?.load(URLRequest(url: url))
            decisionHandler(.cancel) // запрещаем переход по ссылке
        } else {
            decisionHandler(.allow) // разрешаем переход по ссылке
        }
    }
    
    // метод вызываемый перед отображением контента на экране
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        print("didCommit")
    }
    
    // метод вызываемый после отображением контента на экране
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("didFinish")
//        userWebView?.buttonIsEnabled() // не смог устранить ошибку - срабатыват только после обновления страницы
    }
}

// MARK: - NavigationDelegateProtocol
protocol NavigationDelegateProtocol: WKNavigationDelegate {
    var userWebView: UserWebView? { get set }
}
