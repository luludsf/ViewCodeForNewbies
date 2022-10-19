//
//  UIViewExtensions.swift
//  ViewCodeForNewbies
//
//  Created by Luana Duarte on 07/10/22.
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
    
    func addCornerRadius(_ radius: CGFloat = 4) {
        layer.cornerRadius = radius
        layer.masksToBounds = true
    }
    
    func makeRounded() {
        layer.masksToBounds = false
        layer.cornerRadius = self.frame.height / 2
        clipsToBounds = true 
       }
}
