//
//  ViewController.swift
//  ClickCounter
//
//  Created by Ielena Rybina on 4/30/20.
//  Copyright © 2020 Ielena Rybina. All rights reserved.
//

import UIKit


extension UIColor {
    static func random() -> UIColor {
        return UIColor(
            red:   .random(in: 0...1),
            green: .random(in: 0...1),
            blue:  .random(in: 0...1),
            alpha: 1.0
        )
    }
}

class ViewController: UIViewController {
    var count = 0
    let label = UILabel()
    let label2 = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.purple
        
        [label,
         label2].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        
        //  label
        
        label.text = "0"
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 60)
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,
                                       constant: 40)
        ])
        
        // new label
        
        label2.text = "No click added"
        label2.textColor = UIColor.white
        label2.font = UIFont.systemFont(ofSize: 40)
        
        NSLayoutConstraint.activate([
            label2.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label2.topAnchor.constraint(equalTo: label.bottomAnchor,
                                        constant: 40)
        ])
        
        // button
        let button = UIButton()
        button.backgroundColor = UIColor.white
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 5
        button.layer.borderColor = UIColor.random().cgColor
        
        button.setTitle("Click here", for: .normal)
        button.setTitleColor(UIColor.purple, for: .normal)
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.topAnchor.constraint(equalTo: label2.bottomAnchor,
                                        constant: 50),
            button.widthAnchor.constraint(equalToConstant: 300),
            button.heightAnchor.constraint(equalToConstant: 80)
        ])
        
        button.addTarget(self, action: #selector(ViewController.incrementCount), for: UIControl.Event.touchUpInside)
        button.addTarget(self, action: #selector(ViewController.changeBackgroundColor), for: UIControl.Event.touchUpInside)
    }
    @objc func incrementCount () {
        self.count += 1
        self.label.text = "\(self.count)"
        self.label2.text = "Clicks added!"
    }
    
    @objc func changeBackgroundColor () {
        self.view.backgroundColor = .random()
    }
}
