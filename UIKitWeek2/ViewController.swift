//
//  ViewController.swift
//  UIKitWeek2
//
//  Created by ram on 6/23/24.
//
import UIKit

class ViewController: UIViewController {
    @IBOutlet var squareButton: [UIButton]!
    
    @IBOutlet weak var containerView: CircleCheckBox!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.squareButton.forEach {
            $0.addTarget(self, action: #selector(self.squareButton(_ :)), for: .touchUpInside)
        }
    }
    
    @IBAction func squareButton(_ sender: UIButton) {
        print("태그 번호: \(sender.tag)")
        
        self.squareButton.forEach{
            if $0.tag == sender.tag {
                $0.setImage(UIImage(systemName: "checkmark.square.fill"), for: .normal)
            }
            else{
                $0.setImage(UIImage(systemName: "square"),for: .normal)
            }
        }
        
    }
    
}
