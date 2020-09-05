//
//  UIButtonExtension.swift
//  CalculadoraIOs
//
//  Created by Mizia Lima on 9/1/20.
//  Copyright © 2020 Mizia Lima. All rights reserved.
//

import UIKit

//Criando uma class para personalizar botoes - redondos
extension UIButton {
    func round() {
        layer.cornerRadius = bounds.height / 2
        clipsToBounds = true
    }
}
