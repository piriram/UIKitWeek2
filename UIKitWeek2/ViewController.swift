//
//  ViewController.swift
//  UIKitWeek2
//
//  Created by ram on 6/23/24.
//
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var containerView: UIView!

    // 체크박스를 저장할 배열
    var checkBoxes: [UIButton] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // 체크박스 3개 생성
        createCheckBoxes()
    }

    func createCheckBoxes() {
        let titles = ["Most Relevant", "Date Added(Newest First)", "Most Popular"]
        let checkBoxSize: CGFloat = 24
        let spacing: CGFloat = 20

        for i in 0..<3 {
            // UIStackView + 수평 정렬 = Horizontal Stack View
            let horizontalStack = UIStackView()
            horizontalStack.axis = .horizontal
            
            horizontalStack.alignment = .leading
            horizontalStack.spacing = 10
            
            // true나 주석처리하면 내용물이 시뮬에서 보이지않음
            // https://zeddios.tistory.com/474
            horizontalStack.translatesAutoresizingMaskIntoConstraints = false

            
            // 체크박스 버튼 생성
            let checkBox = UIButton(type: .custom)
            checkBox.layer.cornerRadius = checkBoxSize / 2
            checkBox.layer.borderWidth = 2
            checkBox.layer.borderColor = UIColor.black.cgColor
            checkBox.translatesAutoresizingMaskIntoConstraints = false
            checkBox.widthAnchor.constraint(equalToConstant: checkBoxSize).isActive = true
            checkBox.heightAnchor.constraint(equalToConstant: checkBoxSize).isActive = true
            checkBox.tag = i
            checkBox.addTarget(self, action: #selector(checkBoxTapped(_:)), for: .touchUpInside)

            // 레이블 생성
            let label = UILabel()
            label.text = titles[i]
            label.translatesAutoresizingMaskIntoConstraints = false

            // StackView에 체크박스와 레이블 추가
            horizontalStack.addArrangedSubview(checkBox)
            horizontalStack.addArrangedSubview(label)

            // 메인 UIView에 추가
            containerView.addSubview(horizontalStack)

            // 제약 조건 설정
            NSLayoutConstraint.activate([
                horizontalStack.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
                horizontalStack.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
                horizontalStack.topAnchor.constraint(equalTo: containerView.topAnchor, constant: CGFloat(i) * (checkBoxSize + spacing))
            ])

            // 체크박스 배열에 추가
            checkBoxes.append(checkBox)
        }
    }

    @objc func checkBoxTapped(_ sender: UIButton) {
        // 모든 체크박스의 선택 상태를 해제
        for checkBox in checkBoxes {
            checkBox.backgroundColor = .white
        }
        // 클릭한 체크박스를 선택 상태로 설정
        sender.backgroundColor = .black
    }
}
