//
//  CustomContainerView.swift
//  UIKitWeek2
//
//  Created by ram on 6/23/24.
//
import UIKit

class CircleCheckBox: UIView {

    // 체크박스를 저장할 배열
    var checkBoxes: [UIButton] = []

    override init(frame: CGRect) {
        super.init(frame: frame)
        createCheckBoxes()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        createCheckBoxes()
    }

    private func createCheckBoxes() {
        let titles = ["Most Relevant", "Date Added(Newest First)", "Most Popular"]
        let checkBoxSize: CGFloat = 24
        let spacing: CGFloat = 20

        for i in 0..<3 {
            // UIStackView + 수평 정렬 = Horizontal Stack View
            let horizontalStack = UIStackView()
            horizontalStack.axis = .horizontal
            horizontalStack.alignment = .leading
            horizontalStack.spacing = 10
            horizontalStack.translatesAutoresizingMaskIntoConstraints = false

            // 체크박스 버튼 생성
            let checkBox = UIButton(type: .custom)
            checkBox.layer.cornerRadius = checkBoxSize / 2
            checkBox.layer.borderWidth = 1
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
            self.addSubview(horizontalStack)

            // 제약 조건 설정
            NSLayoutConstraint.activate([
                horizontalStack.leadingAnchor.constraint(equalTo: self.leadingAnchor),
                horizontalStack.trailingAnchor.constraint(equalTo: self.trailingAnchor),
                horizontalStack.topAnchor.constraint(equalTo: self.topAnchor, constant: CGFloat(i) * (checkBoxSize + spacing))
            ])

            // 체크박스 배열에 추가
            checkBoxes.append(checkBox)
        }
    }

    @objc private func checkBoxTapped(_ sender: UIButton) {
        // 모든 체크박스의 선택 상태를 해제
        for checkBox in checkBoxes {
            checkBox.subviews.forEach { $0.removeFromSuperview() } // 기존의 중첩된 동그라미 제거
        }
        // 클릭한 체크박스를 선택 상태로 설정
        let innerCircleSize: CGFloat = 12
        let innerCircle = UIView()
        innerCircle.backgroundColor = .black
        innerCircle.layer.cornerRadius = innerCircleSize / 2
        innerCircle.translatesAutoresizingMaskIntoConstraints = false
        sender.addSubview(innerCircle)
        NSLayoutConstraint.activate([
            innerCircle.centerXAnchor.constraint(equalTo: sender.centerXAnchor),
            innerCircle.centerYAnchor.constraint(equalTo: sender.centerYAnchor),
            innerCircle.widthAnchor.constraint(equalToConstant: innerCircleSize),
            innerCircle.heightAnchor.constraint(equalToConstant: innerCircleSize)
        ])
    }
}
