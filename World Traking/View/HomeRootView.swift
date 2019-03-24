//
//  HomeRootView.swift
//  World Traking
//
//  Created by Abiú Roldán on 3/23/19.
//  Copyright © 2019 Abiú Roldán. All rights reserved.
//

import UIKit
import ARKit

class HomeRootView: UIView {
    
    let sceneView: ARSCNView = {
        let view = ARSCNView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let addButton: UIButton = {
        let button = UIButton()
        button.setTitle("Add", for: .normal)
        button.setTitleColor(.red, for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 15
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let resetButton: UIButton = {
        let button = UIButton()
        button.setTitle("Reset", for: .normal)
        button.setTitleColor(.red, for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 15
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupViews()
        setupLayout()
    }
    
    func setupViews() {
        addSubview(sceneView)
        sceneView.addSubview(addButton)
        sceneView.addSubview(resetButton)
    }
    
    func setupLayout() {
        sceneView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        sceneView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        sceneView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        sceneView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        addButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -35).isActive = true
        addButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 35).isActive = true
        addButton.heightAnchor.constraint(equalToConstant: 55).isActive = true
        addButton.widthAnchor.constraint(equalToConstant: 55).isActive = true
        
        resetButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -35).isActive = true
        resetButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -35).isActive = true
        resetButton.heightAnchor.constraint(equalToConstant: 55).isActive = true
        resetButton.widthAnchor.constraint(equalToConstant: 55).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
