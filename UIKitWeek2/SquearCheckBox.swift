//
//  SquearCheckBox.swift
//  UIKitWeek2
//
//  Created by ram on 6/24/24.
//

import UIKit

class SquearCheckBox: UIView {

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
        let titles = ["In-Store Only", "Offers"]
        let checkBoxSize: CGFloat = 24  // 체크박스 크기를 키움
        let spacing: CGFloat = 20

        for i in 0..<2 {
            // UIStackView + 수평 정렬 = Horizontal Stack View
            let horizontalStack = UIStackView()
            horizontalStack.axis = .horizontal
            horizontalStack.alignment = .center // 수직 중앙 정렬
            horizontalStack.spacing = 10
            horizontalStack.translatesAutoresizingMaskIntoConstraints = false

            // 체크박스 버튼 생성
            let checkBox = UIButton(type: .custom)
            let normalImage = UIImage(systemName: "square")?.withTintColor(.black, renderingMode: .alwaysOriginal)
            let selectedImage = UIImage(systemName: "checkmark.square.fill")?.withTintColor(.black, renderingMode: .alwaysOriginal)
            checkBox.setImage(normalImage, for: .normal)
            checkBox.setImage(selectedImage, for: .selected)
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
                horizontalStack.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0), // Leading 제약 조건 0으로 설정
                horizontalStack.trailingAnchor.constraint(equalTo: self.trailingAnchor),
                horizontalStack.topAnchor.constraint(equalTo: self.topAnchor, constant: CGFloat(i) * (checkBoxSize + spacing))
            ])

            // 체크박스 배열에 추가
            checkBoxes.append(checkBox)
        }
    }

    @objc private func checkBoxTapped(_ sender: UIButton) {
        // 체크박스의 선택 상태를 토글
        sender.isSelected.toggle()
    }
}




#Preview{
    SquearCheckBox()
}
