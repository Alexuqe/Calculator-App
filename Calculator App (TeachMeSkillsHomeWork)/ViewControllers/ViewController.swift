    //
    //  ViewController.swift
    //  Calculator App (TeachMeSkillsHomeWork)
    //
    //  Created by Sasha on 19.12.24.
    //

import UIKit

class ViewController: UIViewController {

    lazy var subviews: [UIView] = [numberOne, numberTwo]

    let numberOne = ButtonWithDropShadow().getButton(with: "1")
    let numberTwo = ButtonWithDropShadow().getButton(with: "2")
    lazy var operationLabel = getLabel(text: "9900393")



    lazy var leftHorizontalStackView = getStackView(
        axis: .horizontal,
        spacing: 10,
        distribution: .fill,
        aligment: .center,
        subviews: subviews
    )

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.background

        configureNumbers()
    }


}

private extension ViewController {
    func updateUI() {
        configureNumbers()
    }

    func configureNumbers() {
        addSubview(UIElement: numberOne)
        addSubview(UIElement: numberTwo)
        addSubview(UIElement: operationLabel)
        addSubview(UIElement: leftHorizontalStackView)

        NSLayoutConstraint.activate([
            numberOne.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            numberOne.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30)
        ])
        
        getSized(element: numberOne)
        getSized(element: numberTwo)
    }

    func addSubview(UIElement: UIView) {
        UIElement.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(UIElement)
    }

    func getLabel(text: String, font: UIFont = .systemFont(ofSize: 72, weight: .bold)) -> UILabel {
        {
            $0.text = text
            $0.font = font
            $0.textColor = .white
            $0.numberOfLines = 1
            $0.adjustsFontSizeToFitWidth = true
            $0.textAlignment = .right


            return $0

        }(UILabel())
    }

    func getStackView(axis: NSLayoutConstraint.Axis, spacing: CGFloat, distribution: UIStackView.Distribution, aligment: UIStackView.Alignment, subviews: [UIView] ) -> UIStackView {
        {
            let stackView = $0
            stackView.spacing = spacing
            stackView.distribution = distribution
            stackView.axis = axis
            subviews.forEach { stackView.addArrangedSubview($0) }

            return stackView

        }(UIStackView())
            }
    }

    func getSized(element: UIView) {
        NSLayoutConstraint.activate([
            element.heightAnchor.constraint(equalToConstant: 87.5),
            element.widthAnchor.constraint(equalToConstant: 87.5)
        ])
    }

    func getConstraint(element: UIView, leading: CGFloat?, trailing: CGFloat?, top: CGFloat?, bottom: CGFloat?) {

    }



#Preview {
    let view = ViewController()
    view
}

