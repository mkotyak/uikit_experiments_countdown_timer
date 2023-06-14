import UIKit

class ViewController: UIViewController {
    private var timer: Timer?
    private var remaningTime: Int = 10
    
    private lazy var startTimerButton: UIButton = {
        let button = UIButton()
        button.configuration = .filled()
        button.configuration?.baseBackgroundColor = .systemPink
        button.configuration?.title = "Start"
        
        button.addAction(
            startTimerAction,
            for: .touchUpInside
        )
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    private lazy var timerLable: UILabel = {
        let label = UILabel(frame: CGRectMake(100, 100, 100, 100))
        
        label.textColor = .black
        label.text = "\(remaningTime)"
        
        return label
    }()
    
    private lazy var startTimerAction: UIAction = .init { [weak self] _ in
        self?.timer = .scheduledTimer(
            withTimeInterval: 1.0,
            repeats: true,
            block: { [weak self] _ in
                self?.updateTimer()
            }
        )
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupTimerLable()
        setupButton()
    }
    
    private func setupView() {
        view.backgroundColor = .systemBackground
        title = "Timer"
    }
    
    private func setupTimerLable() {
        view.addSubview(timerLable)
        
        NSLayoutConstraint.activate([
            timerLable.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            timerLable.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    private func setupButton() {
        view.addSubview(startTimerButton)
        
        NSLayoutConstraint.activate([
            startTimerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            startTimerButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            startTimerButton.widthAnchor.constraint(equalToConstant: 200),
            startTimerButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func updateTimer() {
        guard remaningTime > 0 else {
            timer?.invalidate()
            return
        }
        
        remaningTime -= 1
    }
}
