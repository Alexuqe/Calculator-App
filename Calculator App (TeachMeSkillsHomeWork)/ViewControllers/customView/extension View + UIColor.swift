//
//  Untitled.swift
//  Calculator App (TeachMeSkillsHomeWork)
//
//  Created by Sasha on 19.12.24.
//

import UIKit



extension UIView {
    func addGradientView(colorOne: CGColor?, colorTwo: CGColor?) {
        let firstColor = colorOne
        let primaryColor = colorTwo

        let gradient = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = [
            firstColor ?? UIColor.white.cgColor,
            primaryColor ?? UIColor.white.cgColor
        ]

        gradient.locations = [0.0, 1.0]
        gradient.startPoint = CGPoint(x: 0.5, y: -0.7)
        gradient.endPoint = CGPoint(x: 1, y: 1)

        self.layer.addSublayer(gradient)
        self.clipsToBounds = true
    }

    func addBorderGradient(colorOne: CGColor?, colorTwo: CGColor?) {
        let firstColor = colorOne
        let primaryColor = colorTwo

        let gradient = CAGradientLayer()
        gradient.frame = self.frame
        gradient.colors = [
            firstColor ?? UIColor.white.cgColor,
            primaryColor ?? UIColor.clear.cgColor
        ]

        gradient.locations = [0.5, 1.0]
        gradient.startPoint = CGPoint(x: 0.5, y: 0.1)
        gradient.endPoint = CGPoint(x: 0.5, y: 1)


        let shape = CAShapeLayer()
        shape.lineWidth = 1

        shape.path = UIBezierPath(
            roundedRect: self.bounds.insetBy(dx: 0.5, dy: 0.5),
            cornerRadius: self.bounds.height / 2
        ).cgPath

        shape.strokeColor = UIColor.white.cgColor
        shape.fillColor = UIColor.clear.cgColor
        gradient.mask = shape

        self.layer.addSublayer(gradient)
        self.clipsToBounds = true
    }

}
#Preview {
    let view = ViewController()
    view
}
