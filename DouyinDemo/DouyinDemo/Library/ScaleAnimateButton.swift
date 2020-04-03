//
//  ScaleAnimateButton.swift
//  DouyinDemo
//
//  Created by zainguo on 2019/11/24.
//  Copyright © 2019 zainguo. All rights reserved.
//

import UIKit


class ScaleAnimateButton: UIButton {

    // 当view被添加到父视图之上时
    override func willMove(toWindow newWindow: UIWindow?) {
        super.willMove(toWindow: newWindow)
        addTarget(self, action: #selector(toggleSelected), for: .touchUpInside)
        
    }
    @objc func toggleSelected() {
        isSelected.toggle()
    }
    override var isSelected: Bool {
        get {
            super.isSelected
        }
        set {
            super.transform = .init(scaleX: 0.8, y: 0.8)
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.1, options: [.beginFromCurrentState, .transitionCrossDissolve], animations: {
                super.isSelected = newValue
                super.transform = .identity
            })
        }
    }
    
}
