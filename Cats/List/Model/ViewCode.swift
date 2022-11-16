//
//  ViewCode.swift
//  Cats
//
//  Created by Lígia Maria on 06/09/22.
//

import UIKit

protocol ViewCode {
    func setupViews()
    func setupViewHierarchy()
    func setupConstrains()
    func configureViews()
}

extension ViewCode {
    func setupViews() {
        setupViewHierarchy()
        setupConstrains()
        configureViews()
    }
    
    func configureViews() { }
}
