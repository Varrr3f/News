//
//  ShadowImageView.swift
//  MyNews
//
//  Created by Иван Рыбин on 21.04.2021.
//

import UIKit

final class ShadowImageView: UIView {
    
    var image: UIImage? {
        
        didSet {
            
            ImageView.image = image
            
        }
        
    }
    
    private lazy var ImageView: UIImageView = {
        
        let v = UIImageView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.contentMode = .scaleAspectFill
        v.layer.cornerRadius = 20
        v.clipsToBounds = true
        
        return v
        
    } ()
    
    private lazy var baseView: UIView = {
        
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .clear
        v.layer.shadowColor = UIColor.black.cgColor
        v.layer.shadowOffset = CGSize(width: 5, height: 5)
        v.layer.shadowOpacity = 0.7
        v.layer.shadowRadius = 10.0
        
        return v
        
    } ()
    
    init() {
        
        super.init(frame: .zero)
        
        setupView()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        
        addSubview(baseView)
        baseView.addSubview(ImageView)
        
        setupConstraints()
        
    }
    
    func setupConstraints() {
        
        [baseView, ImageView].forEach { (v) in
            
            NSLayoutConstraint.activate([
                
                v.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
                v.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
                v.topAnchor.constraint(equalTo: topAnchor, constant: 16),
                v.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16)
            
            ])
            
        }
        
    }
    
    override func layoutSubviews() {
        
        super.layoutSubviews()
        baseView.layer.shadowPath = UIBezierPath(roundedRect: baseView.bounds, cornerRadius: 10).cgPath
        baseView.layer.shouldRasterize = true
        baseView.layer.rasterizationScale = UIScreen.main.scale
        
    }
 
}
