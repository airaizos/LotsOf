//
//  TaskTimerViewController.swift
//  LotsOfUrlSessions
//
//  Created by Adrian Iraizos Mendoza on 18/10/22.
//

import UIKit

final class TaskTimerViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var imageContainerView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var taskLabel: UILabel!
    @IBOutlet weak var timerView: UIView!
    @IBOutlet weak var timerContainerView: UIView!
    @IBOutlet weak var timerLabel: UILabel!
    
    @IBOutlet weak var pauseResumeView: UIView!
    @IBOutlet weak var pauseResumeButton: UIButton!
    @IBOutlet weak var playView: UIView!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var restartView: UIView!
    @IBOutlet weak var restartButton: UIButton!
    @IBOutlet weak var taskDescriptionLabel: UILabel!
    @IBOutlet weak var buttonsStackView: UIStackView!
    
    // MARK: - Variables
    
    var taskViewModel: TaskViewModel!
    var totalSeconds = 0 {
        didSet {
            timerSeconds = totalSeconds
        }
    }
    var timerSeconds = 0
    
    let timeAttributes = [NSAttributedString.Key.font: UIFont(name: "Verdana", size: 46)!, .foregroundColor: UIColor(hex: "471337")]
    let semiboldAttributes = [NSAttributedString.Key.font: UIFont(name: "Verdana", size: 46)!, .foregroundColor: UIColor(hex: "471337")]
    
    let timerTrackLayer = CAShapeLayer()
    let timerCircleFillLayer = CAShapeLayer()
    
    var timerState: CountdownState = .suspended
    var countdownTimer = Timer()
    
    lazy var timerEndAnimation: CABasicAnimation = {
        let strokeEnd = CABasicAnimation(keyPath: "strokeEnd")
        strokeEnd.toValue = 0
        strokeEnd.fillMode = .forwards
        strokeEnd.isRemovedOnCompletion = true
        return strokeEnd
    }()
    
    lazy var timerResetAnimation: CABasicAnimation = {
        let strokeEnd = CABasicAnimation(keyPath: "strokeEnd")
        strokeEnd.toValue = 1
        strokeEnd.duration = 1
        strokeEnd.fillMode = .forwards
        strokeEnd.isRemovedOnCompletion = false
        return strokeEnd
    }()
    
    // MARK: - LifeCycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        DispatchQueue.main.async {
            self.setupLayers()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    
    
    // MARK: - Outlets & objc functions
    
    @IBAction func closedButtonPressed(_ sender: UIButton) {
        timerTrackLayer.removeFromSuperlayer()
        timerCircleFillLayer.removeFromSuperlayer()
        countdownTimer.invalidate()
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func pauseButtonPressed(_ sender: UIButton) {
        switch timerState {
       
        case .running:
            timerState = .pause
            timerCircleFillLayer.strokeEnd = CGFloat(timerSeconds) / CGFloat(totalSeconds)
            resetTimer()
            animatePauseButton(symbolName: "play.fill")
        case .pause:
            timerState = .running
            timerEndAnimation.duration = Double(timerSeconds) + 1
            startTimer()
            animatePauseButton(symbolName: "pause.fill")
            
        default: break
        }
        
    }
    
    @IBAction func playButtonPressed(_ sender: UIButton) {
        guard timerState == .suspended else  { return }
        timerEndAnimation.duration = Double(timerSeconds)
        animatePauseButton(symbolName: "pause.fill")
        animatePlayPauseResetView(timerPlaying: false)
        startTimer()
    }
    
    @IBAction func restartButtonPressed(_ sender: UIButton) {
      restartTimer()
        
    }
    // MARK: - Functions
    override class func description() -> String {
        "TaskTimerViewController"
    }
    
    /// Añade círculos decrecientes con el tiempo
    func setupLayers() {
        let radius = timerView.frame.width < timerView.frame.height ? timerView.frame.width / 2 : timerView.frame.height / 2
        let arcPath = UIBezierPath(arcCenter: CGPoint(x: timerView.frame.height / 2, y: timerView.frame.width / 2 ), radius: radius, startAngle: 0, endAngle: 360.degreeToRadians(), clockwise: true)
        
        timerTrackLayer.path = arcPath.cgPath
        timerTrackLayer.strokeColor = UIColor(hex: "b13254").cgColor
        timerTrackLayer.lineWidth = 20
        timerTrackLayer.fillColor = UIColor.clear.cgColor
        timerTrackLayer.lineCap = .round
        
        timerCircleFillLayer.path = arcPath.cgPath
        timerCircleFillLayer.strokeColor = UIColor(hex: "471337").cgColor
        timerCircleFillLayer.lineWidth = 21
        timerCircleFillLayer.fillColor = UIColor.clear.cgColor
        timerCircleFillLayer.lineCap = .round
        timerCircleFillLayer.strokeEnd = 1
        
        timerView.layer.addSublayer(timerTrackLayer)
        timerView.layer.addSublayer(timerCircleFillLayer)
        
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseInOut){
            self.timerContainerView.layer.cornerRadius = self.timerContainerView.frame.width / 2
            
        }
    }
    
    func setupView() {
        let task = taskViewModel.getTask()
        totalSeconds = task.seconds
        taskLabel.text = task.taskName
        taskDescriptionLabel.text = task.taskDescription
        updateLabels()
        addCircles()
        
        imageContainerView.layer.cornerRadius = imageContainerView.frame.width / 2
        imageView.layer.cornerRadius = imageView.frame.width / 2
        imageView.image = UIImage(systemName: task.taskType.symbolName)
        
        [pauseResumeView, restartView].forEach {
            guard let view = $0 else { return }
            
            view.layer.opacity = 0
            view.isUserInteractionEnabled = false
        }
        
        [playView, pauseResumeView, restartView].forEach { $0?.layer.cornerRadius = 17 }
        
        timerView.transform = timerView.transform.rotated(by: 270.degreeToRadians())
        timerLabel.transform = timerLabel.transform.rotated(by: 90.degreeToRadians())
        timerContainerView.transform = timerContainerView.transform.rotated(by: 90.degreeToRadians())
        
        
    }
    func animatePauseButton(symbolName: String) {
        UIView.transition(with: pauseResumeButton, duration: 0.3, options: .transitionCrossDissolve) {
            self.pauseResumeButton.setImage(UIImage(systemName: symbolName,withConfiguration: UIImage.SymbolConfiguration(pointSize: 24, weight: .semibold, scale: .default)), for: .normal)
        }
    }
    
    func animateButton(button: UIButton, symbolName: String) {
        UIView.transition(with: button, duration: 0.3, options: .transitionCrossDissolve){
            button.setImage(UIImage(systemName: symbolName, withConfiguration: UIImage.SymbolConfiguration(pointSize: 24, weight: .semibold, scale: .default) ), for: .normal)
        }
    }
    
    /// Oculta el boton play si el timer esta en marcha. o los botones pausa y restart si no lo está
    /// - Parameter timerPlaying: ¿tiempo está en marcha?
    func animatePlayPauseResetView(timerPlaying: Bool) {
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseInOut) {
            self.playView.layer.opacity = timerPlaying ? 1 : 0
            self.pauseResumeView.layer.opacity = timerPlaying ? 0 : 1
            self.restartView.layer.opacity = timerPlaying ? 0 : 1
        } completion: { [weak self] _ in
            [self?.pauseResumeView, self?.restartView].forEach { guard let view = $0 else { return }
                view.isUserInteractionEnabled = timerPlaying ? false : true
            }
        }
    }
    
    func startTimer() {
        //update labels
        countdownTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            self.timerSeconds -= 1
            self.updateLabels()
            if (self.timerSeconds == 0) {
                timer.invalidate()
                self.timerState = .suspended
                //aqui
                self.restartTimer()
                self.timerSeconds = self.totalSeconds
                self.resetTimer()
            }
        }
        
        timerState = .running
        timerCircleFillLayer.add(timerEndAnimation, forKey: "timerEnd")
    }
    
    func updateLabels() {
        let seconds = timerSeconds % 60
        let minutes = timerSeconds / 60 % 60
        let hours = timerSeconds / 3600
        
        //Da formato a las labels del timer
        if hours > 0 {
            let hoursCount = String(hours).count
            let minutesCount = String(minutes).count
            let secondsCount = String(seconds.appendZeros()).count
            let timeString = "\(hours)h \(minutes)m \(seconds.appendZeros())s"
            let attributedString = NSMutableAttributedString(string: timeString, attributes: semiboldAttributes)
            
            attributedString.addAttributes(timeAttributes, range: NSRange(location: 0, length: hoursCount))
            attributedString.addAttributes(timeAttributes, range: NSRange(location: hoursCount + 2 , length: minutesCount))
            attributedString.addAttributes(timeAttributes, range: NSRange(location: hoursCount + 2 + minutesCount + 2, length: secondsCount))
            timerLabel.attributedText = attributedString
        } else {
            let minutesCount = String(minutes).count
            let secondsCount = String(seconds.appendZeros()).count
            let timeString = "\(minutes)m \(seconds.appendZeros())s"
            let attributedString = NSMutableAttributedString(string: timeString, attributes: semiboldAttributes)
            
            attributedString.addAttributes(timeAttributes, range: NSRange(location: 0, length: minutesCount))
            attributedString.addAttributes(timeAttributes, range: NSRange(location: minutesCount + 3, length: secondsCount))
            timerLabel.attributedText = attributedString
        }
    }
    
    func resetTimer() {
        countdownTimer.invalidate()
        timerCircleFillLayer.removeAllAnimations()
        updateLabels()
    }
    
    func restartTimer() {
        timerState = .suspended
        timerSeconds = totalSeconds
        resetTimer()
        timerCircleFillLayer.add(timerResetAnimation, forKey: "reset")
        
        animatePauseButton(symbolName: "play.fill")
        animatePlayPauseResetView(timerPlaying: true)
    }
    
    func addCircles(){
        let circleLayer = CAShapeLayer()
        circleLayer.path = UIBezierPath(arcCenter: CGPoint(x: 0, y: view.frame.height - 90), radius: 80, startAngle: 0, endAngle: 360.degreeToRadians(), clockwise: true).cgPath
        circleLayer.fillColor = UIColor(hex: "ff7249").cgColor
        circleLayer.opacity = 0.15
        
        let circleTwoLayer = CAShapeLayer()
        circleTwoLayer.path = UIBezierPath(arcCenter: CGPoint(x: 80, y: view.frame.height - 60), radius: 70, startAngle: 0, endAngle: 360.degreeToRadians(), clockwise: true).cgPath
        circleTwoLayer.fillColor = UIColor(hex: "ff7249").cgColor
        circleTwoLayer.opacity = 0.35
        
        view.layer.insertSublayer(circleLayer, below: view.layer)
        view.layer.insertSublayer(circleTwoLayer, below: view.layer)

        view.bringSubviewToFront(taskDescriptionLabel)
        view.bringSubviewToFront(buttonsStackView)
        
    }
    
    deinit {
        
        print("    [DEINIT] ->      TASKTIMER ViewController")
    }
}
