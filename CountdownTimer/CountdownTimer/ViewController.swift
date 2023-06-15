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
        let label = UILabel()
        label.text = "\(remaningTime)"
        label.font = UIFont.boldSystemFont(ofSize: 26)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var startTimerAction: UIAction = .init { [weak self] _ in
        guard let self else {
            return
        }
        
        let timer = Timer(timeInterval: 1.0,
                          target: self,
                          selector: #selector(self.updateRemaningTime),
                          userInfo: nil,
                          repeats: true)
        
        RunLoop.current.add(timer, forMode: .common)
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
    
    @objc private func updateRemaningTime() {
        guard remaningTime > 0 else {
            timer?.invalidate()
            return
        }
        
        remaningTime -= 1
        timerLable.text = "\(remaningTime)"
    }
}
