    //
    //  Button with drop Shadow.swift
    //  Calculator App (TeachMeSkillsHomeWork)
    //
    //  Created by Sasha on 19.12.24.
    //

import UIKit

final class ButtonWithDropShadow: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func getButton(with text: String?, frame: CGRect = CGRect(x: 0, y: 0, width: 80, height: 80), color: UIColor = .background) -> UIButton {

        let firstColor = UIColor.white.withAlphaComponent(0.1).cgColor
        let secondaryColor = color.withAlphaComponent(0.0).cgColor
        let whiteColor = UIColor.white.withAlphaComponent(0.1).cgColor

        let backgroundColor = color
        let fontSize: CGFloat = 40

        self.frame = frame
        self.addGradientView(colorOne: firstColor, colorTwo: secondaryColor)
        self.addBorderGradient(colorOne: whiteColor, colorTwo: secondaryColor)

        var configuration = UIButton.Configuration.plain()
        configuration.title = text
        configuration.baseForegroundColor = .white
        configuration.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer { incoming in
            var outgoing = incoming
            outgoing.font = UIFont.systemFont(ofSize: fontSize, weight: .medium)
            return outgoing
        }

        self.configuration = configuration
        self.configurationUpdateHandler = { button in
            switch button.state {
                case .highlighted:
//                    button.alpha = 0.7
                    button.backgroundColor = .white.withAlphaComponent(0.1)
                default:
//                    button.alpha = 1.0
                    button.backgroundColor = backgroundColor
            }
        }

        self.layer.cornerRadius = self.frame.height / 2
        self.layer.borderColor = UIColor.clear.cgColor
        self.layer.borderWidth = 1

        return self
    }

}

#Preview {
    let view = ViewController()
    view
}
