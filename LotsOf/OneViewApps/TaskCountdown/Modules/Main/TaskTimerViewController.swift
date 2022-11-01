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
    
    // MARK: - Variables
    
    var taskViewModel: TaskViewModel!
    var totalSeconds = 0 {
        didSet {
            timerSeconds = totalSeconds
        }
    }
    var timerSeconds = 0
    
    let timeAttributes = [NSAttributedString.Key.font: UIFont(name: "Verdana", size: 46)!, .foregroundColor: UIColor.black]
    let semiboldAttributes = [NSAttributedString.Key.font: UIFont(name: "Verdana", size: 46)!, .foregroundColor: UIColor.black]
    
    let timerTrackLayer = CAShapeLayer()
    let timerCircleFillLayer = CAShapeLayer()
    
    var timerState: CountdownState = .suspended
    var countdownTimer = Timer()
    
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


}


extension CAShapeLayer {
    
    
    
}
