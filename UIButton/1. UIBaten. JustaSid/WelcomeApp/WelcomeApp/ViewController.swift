//
//  ViewController.swift
//  WelcomeApp
//
//  Created by Atom on 16.11.2023.
//  Copyright © 2023 Atom. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var welcomeLabel: UILabel!
    
    let codeLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // у класса ViewController есть свойство view, в котором размещены все элементы экраном
        view.addSubview(codeLabel) // с помощью метода addSubview помещаем экран codeLabel в конец очереди
        
        codeLabel.frame = CGRect.init(x: 100, y: 300, width: 200, height: 150) // размер label
        codeLabel.text = "some text for codelab generated from code" // текст label
        codeLabel.textColor = .red // цвет текста label
        codeLabel.numberOfLines = 0 // ставим 0 для того, чтобы текст увеличивался/уменьшался в зависимости от границ label
        
        codeLabel.shadowColor = .blue // цвет тени текста label
        codeLabel.shadowOffset = CGSize(width: 1, height: 1) // размер тени
        
        codeLabel.layer.cornerRadius = 5 // радиус закругления углов label
        codeLabel.layer.borderColor = UIColor.red.cgColor // цвет границ label с приведением типа
        codeLabel.layer.borderWidth = 2 // размер границ label
    }
}

