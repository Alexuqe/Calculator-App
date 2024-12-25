    //
    //  ViewController.swift
    //  Calculator App (TeachMeSkillsHomeWork)
    //
    //  Created by Sasha on 19.12.24.
    //

import UIKit

final class ViewController: UIViewController {

        //MARK: - Calculator Properties
    private let calculator = CalculatorManager.shared

        //MARK: - Layout Properties
    private let leadingConstraint: CGFloat = 20
    private let trailingConctraint: CGFloat = -20
    private let indent: CGFloat = -15

        //MARK: - UI Labels
    private lazy var operationLabel: UILabel = getLabel(text: "0")

    private lazy var secondaryOperationLabel: UILabel = getLabel(
        text: "",
        font: .systemFont(ofSize: 36, weight: .regular),
        color: .gray)

        //MARK: - UI Buttons
    private let zeroButton = ButtonWithDropShadow().getButton(
        with: "0",
        frame: CGRect(x: 0, y: 0, width: 175, height: 80)
    )
    private let numberOne = ButtonWithDropShadow().getButton(with: "1")
    private let numberTwo = ButtonWithDropShadow().getButton(with: "2")
    private let numberThree = ButtonWithDropShadow().getButton(with: "3")
    private let numberFour = ButtonWithDropShadow().getButton(with: "4")
    private let numberFive = ButtonWithDropShadow().getButton(with: "5")
    private let numberSix = ButtonWithDropShadow().getButton(with: "6")
    private let numberSeven = ButtonWithDropShadow().getButton(with: "7")
    private let numberEight = ButtonWithDropShadow().getButton(with: "8")
    private let numberNine = ButtonWithDropShadow().getButton(with: "9")

        //MARK: - Operation Buttons
    private let equallyButton = ButtonWithDropShadow().getButton(with: "=")
    private let plusButton = ButtonWithDropShadow().getButton(with: "+")
    private let minusButton = ButtonWithDropShadow().getButton(with: "-")
    private let multiplyButton = ButtonWithDropShadow().getButton(with: "×")
    private let separationButton = ButtonWithDropShadow().getButton(with: "÷")
    private let percentButton = ButtonWithDropShadow().getButton(with: "%")
    private let togleNumberEquale = ButtonWithDropShadow().getButton(with: "+/-")
    private let dotButton = ButtonWithDropShadow().getButton(with: ".")

    private let cancelButton = ButtonWithDropShadow().getButton(with: "C")

        //MARK: - Stack Views
    private lazy var zeroRowButtons: [UIView] = [zeroButton, dotButton, equallyButton]
    private lazy var firstRowButtons: [UIView] = [numberOne, numberTwo, numberThree, plusButton]
    private lazy var secondRowButtons: [UIView] = [numberFour, numberFive, numberSix, minusButton]
    private lazy var thirdRowButtons: [UIView] = [
        numberSeven, numberEight, numberNine, multiplyButton,
    ]
    private lazy var topRowButtons: [UIView] = [
        cancelButton, togleNumberEquale, percentButton, separationButton,
    ]
    private lazy var operationColumsLabels: [UIView] = [secondaryOperationLabel, operationLabel]

    private lazy var zeroRowStackView = getStackView(distribution: .fill, subviews: zeroRowButtons)
    private lazy var firstRowStackView = getStackView(subviews: firstRowButtons)
    private lazy var secondRowStackView = getStackView(subviews: secondRowButtons)
    private lazy var thirdRowStackView = getStackView(subviews: thirdRowButtons)
    private lazy var topRowStackView = getStackView(subviews: topRowButtons)
    private lazy var operationsColumStackView = getStackView(
        axis: .vertical,
        spacing: 2,
        distribution: .equalSpacing,
        aligment: .trailing,
        subviews: operationColumsLabels
    )

        //MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.background
        updateUI()
        setupButtonActions()
    }
}

    //MARK: - Extension ViewController
extension ViewController {

        //MARK: - UI update
    private func updateUI() {
        configureNumbers()
        configureConstraints()
    }

        //MARK: - UI Configuration
    private func configureNumbers() {
        addSubview(UIElement: operationsColumStackView)
        addSubview(UIElement: zeroRowStackView)
        addSubview(UIElement: firstRowStackView)
        addSubview(UIElement: secondRowStackView)
        addSubview(UIElement: thirdRowStackView)
        addSubview(UIElement: topRowStackView)

        getSized(element: zeroButton, width: 175, height: 80)
        getSized(element: numberOne)
        getSized(element: numberTwo)
        getSized(element: numberThree)
        getSized(element: numberFour)
        getSized(element: numberFive)
        getSized(element: numberSix)
        getSized(element: numberSeven)
        getSized(element: numberEight)
        getSized(element: numberNine)

        getSized(element: plusButton)
        getSized(element: dotButton)
        getSized(element: equallyButton)
        getSized(element: separationButton)
        getSized(element: multiplyButton)
        getSized(element: percentButton)
        getSized(element: cancelButton)
        getSized(element: togleNumberEquale)

        setupButtonActions()
    }

        //MARK: - UI Constraints
    private func configureConstraints() {
        NSLayoutConstraint.activate(
            [
                //Zero
                zeroRowStackView.bottomAnchor.constraint(
                    equalTo: view.safeAreaLayoutGuide.bottomAnchor,
                    constant: trailingConctraint
                ),
                zeroRowStackView.leadingAnchor.constraint(
                    equalTo: view.leadingAnchor,
                    constant: leadingConstraint
                ),
                zeroRowStackView.trailingAnchor.constraint(
                    equalTo: view.trailingAnchor,
                    constant: trailingConctraint
                ),

                //First
                firstRowStackView.bottomAnchor.constraint(
                    equalTo: zeroRowStackView.topAnchor,
                    constant: indent
                ),
                firstRowStackView.leadingAnchor.constraint(equalTo: zeroRowStackView.leadingAnchor),
                firstRowStackView.trailingAnchor.constraint(equalTo: zeroRowStackView.trailingAnchor),

                //Second
                secondRowStackView.bottomAnchor.constraint(
                    equalTo: firstRowStackView.topAnchor,
                    constant: indent
                ),
                secondRowStackView.leadingAnchor.constraint(equalTo: zeroRowStackView.leadingAnchor),
                secondRowStackView.trailingAnchor.constraint(equalTo: zeroRowStackView.trailingAnchor),

                //Third
                thirdRowStackView.bottomAnchor.constraint(
                    equalTo: secondRowStackView.topAnchor,
                    constant: indent
                ),
                thirdRowStackView.leadingAnchor.constraint(equalTo: zeroRowStackView.leadingAnchor),
                thirdRowStackView.trailingAnchor.constraint(equalTo: zeroRowStackView.trailingAnchor),

                //Top
                topRowStackView.bottomAnchor.constraint(
                    equalTo: thirdRowStackView.topAnchor,
                    constant: indent
                ),
                topRowStackView.leadingAnchor.constraint(equalTo: zeroRowStackView.leadingAnchor),
                topRowStackView.trailingAnchor.constraint(equalTo: zeroRowStackView.trailingAnchor),

                //Operations
                operationsColumStackView.bottomAnchor.constraint(
                    equalTo: topRowStackView.topAnchor,
                    constant: -37
                ),
                operationsColumStackView.leadingAnchor.constraint(equalTo: zeroRowStackView.leadingAnchor),
                operationsColumStackView.trailingAnchor.constraint(equalTo: zeroRowStackView.trailingAnchor),
            ]
        )
    }

        //MARK: - UI Helpers
    private func addSubview(UIElement: UIView) {
        UIElement.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(UIElement)
    }

    private func getLabel(
        text: String,
        font: UIFont = .systemFont(ofSize: 72, weight: .bold),
        color: UIColor = .white
    ) -> UILabel {
        {
            $0.text = text
            $0.font = font
            $0.textColor = color
            $0.numberOfLines = 1
            $0.adjustsFontSizeToFitWidth = true
            $0.textAlignment = .right

            return $0
        }(UILabel())
    }

    private func getStackView(
        axis: NSLayoutConstraint.Axis = .horizontal,
        spacing: CGFloat = 15,
        distribution: UIStackView.Distribution = .fillEqually,
        aligment: UIStackView.Alignment = .fill,
        subviews: [UIView]
    ) -> UIStackView {
        {
            let stackView = $0
            stackView.spacing = spacing
            stackView.distribution = distribution
            stackView.axis = axis
            subviews.forEach { stackView.addArrangedSubview($0) }

            return stackView

        }(UIStackView())
    }

    private func getSized(element: UIView, width: CGFloat = 80, height: CGFloat = 80) {
        NSLayoutConstraint.activate([
            element.heightAnchor.constraint(equalToConstant: height),
            element.widthAnchor.constraint(equalToConstant: width),
        ])
    }

        //MARK: - Setup Button Actions
    private func setupButtonActions() {
            // Numbers
        numberOne.addTarget(self, action: #selector(numberPressed(_:)), for: .touchUpInside)
        numberTwo.addTarget(self, action: #selector(numberPressed(_:)), for: .touchUpInside)
        numberThree.addTarget(self, action: #selector(numberPressed(_:)), for: .touchUpInside)
        numberFour.addTarget(self, action: #selector(numberPressed(_:)), for: .touchUpInside)
        numberFive.addTarget(self, action: #selector(numberPressed(_:)), for: .touchUpInside)
        numberSix.addTarget(self, action: #selector(numberPressed(_:)), for: .touchUpInside)
        numberSeven.addTarget(self, action: #selector(numberPressed(_:)), for: .touchUpInside)
        numberEight.addTarget(self, action: #selector(numberPressed(_:)), for: .touchUpInside)
        numberNine.addTarget(self, action: #selector(numberPressed(_:)), for: .touchUpInside)
        zeroButton.addTarget(self, action: #selector(numberPressed(_:)), for: .touchUpInside)

            // Operations
        plusButton.addTarget(self, action: #selector(operationPressed(_:)), for: .touchUpInside)
        minusButton.addTarget(self, action: #selector(operationPressed(_:)), for: .touchUpInside)
        multiplyButton.addTarget(self, action: #selector(operationPressed(_:)), for: .touchUpInside)
        separationButton.addTarget(self, action: #selector(operationPressed(_:)), for: .touchUpInside)
        percentButton.addTarget(self, action: #selector(operationPressed(_:)), for: .touchUpInside)

            // Special operations
        equallyButton.addTarget(self, action: #selector(equalPressed), for: .touchUpInside)
        cancelButton.addTarget(self, action: #selector(clearPressed), for: .touchUpInside)
        togleNumberEquale.addTarget(self, action: #selector(togglePressed), for: .touchUpInside)
        dotButton.addTarget(self, action: #selector(decimalPressed), for: .touchUpInside)
    }

        //MARK: - Button Actions
    @objc private func numberPressed(_ sender: UIButton) {
        if let number = sender.titleLabel?.text {
            print("Button pressed: \(number)")
            calculator.inputNumber(number)
            print("Current number: \(calculator.currentNumber)")
            operationLabel.text = calculator.currentNumber
        }
    }

    @objc private func operationPressed(_ sender: UIButton) {
        guard let symbol = sender.titleLabel?.text else { return }
        switch symbol {
            case "+": calculator.setOperation(.plus)
            case "-": calculator.setOperation(.minus)
            case "×": calculator.setOperation(.multiple)
            case "÷": calculator.setOperation(.separation)
            case "%": calculator.setOperation(.percent)
            default: break
        }

        secondaryOperationLabel.text = calculator.previousNumber + " " + calculator.displayOperation
        operationLabel.text = calculator.currentNumber
    }

    @objc private func equalPressed() {
        calculator.calculateResult()
        operationLabel.text = calculator.currentNumber
        secondaryOperationLabel.text = ""
    }

    @objc private func clearPressed() {
        calculator.reset()
        operationLabel.text = calculator.currentNumber
        secondaryOperationLabel.text = ""
    }

    @objc private func togglePressed() {
        calculator.toggleSign()
        operationLabel.text = calculator.currentNumber
    }

    @objc private func decimalPressed() {
        calculator.inputDecimal()
        operationLabel.text = calculator.currentNumber
    }

}

//MARK: Perview

//#Preview{
//    let view = ViewController()
//    view
//}
