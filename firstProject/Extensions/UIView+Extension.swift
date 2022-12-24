//
//  UIView+Extension.swift
//  firstProject
//
//  Created by Saleh Naser on 14/12/2022.

import UIKit

extension UIView{
    @IBInspectable var cornerRadius: CGFloat {
        get { return cornerRadius }
        set {
            self.layer.cornerRadius = newValue
        }
    }
}
