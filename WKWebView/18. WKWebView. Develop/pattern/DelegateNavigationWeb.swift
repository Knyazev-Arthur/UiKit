import UIKit
import WebKit

// MARK: - DelegateNavigationWebProtocol
protocol DelegateNavigationWebProtocol: WKNavigationDelegate {
    var userWebView: UserWebView? { get set }
}

class DelegateNavigationWeb: NSObject, WKNavigationDelegate, DelegateNavigationWebProtocol {
    weak var userWebView: UserWebView?
    
    // метод, вызываемый при начале загрузки web страницы
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        userWebView?.isWorkIndicatorTrue()
        userWebView?.goButtonIsEnabledFalse()
    }
    
    // метод, вызываемый после завершения загрузки web страницы
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        userWebView?.isWorkIndicatorFalse()
        if userWebView?.canGoBack ?? false {
            userWebView?.goBackButtonIsEnabled()
        } else if userWebView?.canGoForward ?? false {
            userWebView?.goForwardButtonIsEnabled()
        }
    }
    
    // метод срабатывает каждый раз, когда начинается навигация, и он позволяет вам принять решение относительно политики загрузки страницы и фильтрации некоторых типов запросов или проверки определенных условий перед разрешением или отменой навигации.
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        decisionHandler(.allow)
        print("shouldstartStartLoadWitch", navigationAction.request)
    }
}
