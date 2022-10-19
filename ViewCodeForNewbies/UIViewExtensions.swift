//
//  UIViewExtensions.swift
//  ViewCodeForNewbies
//
//  Created by Kaká Sena on 19/10/22.
//

import Foundation
import UIKit

extension UIView {
    public func setConstraintsToSuperview(top: CGFloat = 0, leading: CGFloat = 0,
                                          trailing: CGFloat = 0, bottom: CGFloat = 0) {
        guard let superview else { return }
        let safeArea = superview.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: safeArea.topAnchor, constant: top),
            leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: leading),
            trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: trailing),
            bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: bottom)
        ])
    }
    
    func addBorderLine(width: CGFloat = 1, color: UIColor) {
        layer.borderWidth = width
        layer.borderColor = color.cgColor
 }
}
