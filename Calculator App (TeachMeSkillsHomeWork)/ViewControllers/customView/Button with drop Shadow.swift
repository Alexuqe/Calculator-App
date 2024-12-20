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

    func getButton(with text: String?) -> UIButton {
            //        let firstColor = UIColor.white.withAlphaComponent(0.2).cgColor
            //        let secondaryColor = UIColor.background.withAlphaComponent(0.0).cgColor
            //        let whiteColor = UIColor.white.withAlphaComponent(0.1).cgColor
            //
            //        self.frame = CGRect(x: 0, y: 0, width: 87.5, height: 87.5)
            //        self.addGradientView(colorOne: firstColor, colorTwo: secondaryColor)
            //        self.addBorderGradient(colorOne: whiteColor, colorTwo: secondaryColor)
            //        self.backgroundColor = UIColor.clear
            //
            //        self.setTitle(text, for: .normal)
            //        self.titleLabel?.font = UIFont.systemFont(ofSize: 40, weight: .medium)
            //
            //        self.layer.cornerRadius = self.frame.height / 2
            //        self.layer.borderColor = UIColor.clear.cgColor
            //        self.layer.borderWidth = 1
            //
            //        self.setTitleColor(.white, for: .normal)
            //        self.setTitleColor(.systemGray, for: .highlighted)
            //
            //        self.adjustsImageWhenDisabled = true
            //
            //
            //        return self

        let firstColor = UIColor.white.withAlphaComponent(0.2).cgColor
        let secondaryColor = UIColor.background.withAlphaComponent(0.0).cgColor
        let whiteColor = UIColor.white.withAlphaComponent(0.1).cgColor
        let fontSize: CGFloat = 40

        self.frame = CGRect(x: 0, y: 0, width: 87.5, height: 87.5)
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
                    button.alpha = 0.7
                default:
                    button.alpha = 1.0
            }
        }

        self.titleLabel?.font = UIFont.systemFont(ofSize: 40, weight: .medium)
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
