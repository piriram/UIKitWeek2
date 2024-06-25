//
//  ViewController.swift
//  UIKitWeek2
//
//  Created by ram on 6/23/24.
//
import UIKit

class ViewController: UIViewController {
    @IBOutlet var squareButton: [UIButton]!
    var checkBoxes: [UIButton] = []
    @IBOutlet weak var containerView: CircleCheckBox!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.squareButton.forEach {
            $0.addTarget(self, action: #selector(squareButton(_:)), for: .touchUpInside)
        }
    }
    
    @objc func squareButton(_ sender: UIButton) {
        print("태그 번호: \(sender.tag)")
        
        if sender.currentImage == UIImage(systemName: "square") {
            sender.setImage(UIImage(systemName: "checkmark.square.fill"), for: .normal)
        } else {
            sender.setImage(UIImage(systemName: "square"), for: .normal)
        }
    }
}
