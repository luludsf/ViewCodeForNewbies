//
//  CalculatorViewController.swift
//  ViewCodeForNewbies
//
//  Created by Alfin on 14/10/22.
//

import UIKit

struct Button {
    let label: String
    let backgroundColor: UIColor
    let textColor: UIColor
}

class CalculatorViewController: UIViewController {
    private let buttons: [[Button]] = [
        [
            Button(label: "AC", backgroundColor: .systemGray, textColor: .systemBackground),
            Button(label: "+/-", backgroundColor: .systemGray, textColor: .systemBackground),
            Button(label: "%", backgroundColor: .systemGray, textColor: .systemBackground),
            Button(label: "÷", backgroundColor: .systemOrange, textColor: .label),
        ],
        
        [
            Button(label: "7", backgroundColor: .systemGray5, textColor: .label),
            Button(label: "8", backgroundColor: .systemGray5, textColor: .label),
            Button(label: "9", backgroundColor: .systemGray5, textColor: .label),
            Button(label: "×", backgroundColor: .systemOrange, textColor: .label),
        ],
        
        [
            Button(label: "4", backgroundColor: .systemGray5, textColor: .label),
            Button(label: "5", backgroundColor: .systemGray5, textColor: .label),
            Button(label: "6", backgroundColor: .systemGray5, textColor: .label),
            Button(label: "-", backgroundColor: .systemOrange, textColor: .label),
        ],
        
        [
            Button(label: "1", backgroundColor: .systemGray5, textColor: .label),
            Button(label: "2", backgroundColor: .systemGray5, textColor: .label),
            Button(label: "3", backgroundColor: .systemGray5, textColor: .label),
            Button(label: "+", backgroundColor: .systemOrange, textColor: .label),
        ],
        
        [
            Button(label: "0", backgroundColor: .systemGray5, textColor: .label),
            Button(label: ".", backgroundColor: .systemGray5, textColor: .label),
            Button(label: "=", backgroundColor: .systemOrange, textColor: .label),
        ],
    ]
    
    private var label: UILabel!
    private var buttonsStackView: UIStackView!
    private let spacing: CGFloat = 15

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        setupButtonsStackView()
        setupButtons()
        setupLabel()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    func setupLabel() {
        label = UILabel()
        label.textColor = .label
        label.font = UIFont.systemFont(ofSize: 80, weight: .light)
        label.textAlignment = .right
        label.text = "0"
        
        self.view.addSubview(label)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.leftAnchor.constraint(equalTo: buttonsStackView.leftAnchor),
            label.rightAnchor.constraint(equalTo: buttonsStackView.rightAnchor),
            label.bottomAnchor.constraint(equalTo: buttonsStackView.topAnchor, constant: -20),
        ])
    }
    
    func setupButtonsStackView() {
        buttonsStackView = UIStackView()
        buttonsStackView.axis  = NSLayoutConstraint.Axis.vertical
        buttonsStackView.distribution  = UIStackView.Distribution.equalSpacing
        buttonsStackView.alignment = UIStackView.Alignment.fill
        buttonsStackView.spacing = spacing
        
        self.view.addSubview(buttonsStackView)
        
        buttonsStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            buttonsStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            buttonsStackView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 10),
            buttonsStackView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -10),
        ])
    }
    
    func setupButtons() {
        buttons.forEach { buttonsRow in
            let buttonStackView = UIStackView()
            buttonStackView.axis  = NSLayoutConstraint.Axis.horizontal
            buttonStackView.distribution  = UIStackView.Distribution.equalSpacing
            buttonStackView.alignment = UIStackView.Alignment.leading
            buttonStackView.spacing = spacing
            
            buttonsRow.forEach { button in
                var config = UIButton.Configuration.filled()
                config.title = button.label
                config.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: button.label == "0" ? 40 : 0, bottom: 0, trailing: 0)
                config.baseForegroundColor = button.textColor
                config.baseBackgroundColor = button.backgroundColor
                config.cornerStyle = .capsule
                
                config.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer { incoming in
                    var outgoing = incoming
                    outgoing.font = .systemFont(ofSize: 36)
                    return outgoing
                }
                
                
                let uiButton = UIButton(configuration: config)
                uiButton.contentHorizontalAlignment = button.label == "0" ? .leading : .center
                
                let size: CGFloat = (view.bounds.size.width - (spacing * 4)) / 4
                let width: CGFloat = button.label == "0" ? (size * 2) + spacing : size
                let height: CGFloat = size
                
                uiButton.translatesAutoresizingMaskIntoConstraints = false
                NSLayoutConstraint.activate([
                    uiButton.widthAnchor.constraint(equalToConstant: width),
                    uiButton.heightAnchor.constraint(equalToConstant: height),
                ])
                
                buttonStackView.addArrangedSubview(uiButton)
            }
            
            buttonsStackView.addArrangedSubview(buttonStackView)
        }
    }
}
