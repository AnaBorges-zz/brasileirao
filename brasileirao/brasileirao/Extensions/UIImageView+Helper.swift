//
//  extensions.swift
//  brasileirao
//
//  Created by Ana Julia on 2/3/20.
//  Copyright © 2020 Ana Julia. All rights reserved.

import UIKit

extension UIImageView {
func load(_ urlAPI: String) {
    if let url = URL(string: urlAPI){
        DispatchQueue.global().async { [weak self] in
        if let data = try? Data(contentsOf: url) {
            if let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    self?.image = image
                        }
                    }
                }
            }
        }
    }
}
