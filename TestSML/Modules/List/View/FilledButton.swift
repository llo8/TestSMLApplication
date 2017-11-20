//
//  FilledButton.swift
//  TestSML
//
//  Created by Юрий on 18.11.17.
//  Copyright © 2017 Юрий. All rights reserved.
//

import UIKit

class FilledButton: UIButton {
    
    private var fillLayer: CALayer = CALayer()
    var fillPath: Double = 0.0 {
        didSet {
            fillLayer.frame = CGRect(x:0.0,
                                     y:0.0,
                                     width:Double(bounds.size.width) * fillPath,
                                     height:Double(bounds.size.height))
        }
    }
    
    open override func awakeFromNib() {
        super.awakeFromNib()
        
        setupView()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        fillLayer.frame = CGRect(x:0.0,
                                 y:0.0,
                                 width:Double(bounds.size.width) * fillPath,
                                 height:Double(bounds.size.height))
    }
    
    private func setupView() {
        fillLayer.backgroundColor = UIColor.green.cgColor
        fillLayer.frame = CGRect(x:0.0,
                                 y:0.0,
                                 width:Double(bounds.size.width) * fillPath,
                                 height:Double(bounds.size.height))
        layer.insertSublayer(fillLayer, at: 0)
    }
}
