//
//  CalculatorUI.swift
//  ViewCodeForNewbies
//
//  Created by Arthur Pereira on 14/10/22.
//

import Foundation
import UIKit

protocol TemplateViewDelegate: AnyObject {
    func didTapButton()
}

public class TemplateView: UIView {

    // MARK: UI

    private lazy var exampleStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [exampleLabel, exampleButton])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .center
        stackView.spacing = 8
        stackView.axis = .vertical
        return stackView
    }()

    private lazy var exampleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Example Label"
        label.textColor = .white
        return label
    }()

    private lazy var exampleButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .orange
        button.layer.cornerRadius = 8
        button.setTitle(" Example Button ", for: .normal)
        button.addTarget(self, action: #selector(buttonTap), for: .touchUpInside)
        return button
    }()

    // MARK: PROPERTIES

    weak var delegate: TemplateViewDelegate?

    // MARK: INITIALIZERS

    override init(frame: CGRect) {
        super.init(frame: frame)
        createViewHierarchy()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: SETUP

    private func createViewHierarchy(){
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(exampleStackView)
        NSLayoutConstraint.activate([
            exampleStackView.topAnchor.constraint(equalTo: topAnchor),
            exampleStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            exampleStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            exampleStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }

    @objc private func buttonTap() {
        delegate?.didTapButton()
    }
}
