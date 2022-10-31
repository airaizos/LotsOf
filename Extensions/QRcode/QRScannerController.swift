//
//  QRScannerController.swift
//  LotsOfUrlSessions
//
//  Created by Adrian Iraizos Mendoza on 29/10/22.
//

import UIKit
import AVFoundation

final class QRScannerController: UIViewController, AVCaptureMetadataOutputObjectsDelegate {
    
    //TODO: ¿añadir viewModel y validar código leido. o solo un string?
    //MARK: Properties
    var promotionalCode = ""
    
    private var captureSession: AVCaptureSession!
    private var previewLayer: AVCaptureVideoPreviewLayer!
    private var isPermissionGiven = false
    
    //MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //Check for camera permissions
        if isPermissionGiven {
            if (captureSession?.isRunning == false) {
                captureSession.startRunning()
            }
        } else {
            checkCameraPermission()
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        //stop capture session when this screen will dissapear
        if (captureSession?.isRunning == true) {
            captureSession.stopRunning()
        }
    }
    
    
    // MARK: Private methods
    
    private func initialSetup() {
        view.backgroundColor = .black
        navigationController?.navigationBar.barStyle = .black
        
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .done, target: self, action: #selector(handleCancelAction))
        cancelButton.tintColor = .white
        navigationItem.rightBarButtonItem = cancelButton
    }
    
    @objc private func handleCancelAction() {
        self.dismiss(animated: true, completion: nil)
    }
    
    private func checkCameraPermission() {
        switch AVCaptureDevice.authorizationStatus(for: .video) {
        case .authorized:
            DispatchQueue.main.async {
                self.isPermissionGiven = true
                self.setupCaptureSession()
            }
        case .notDetermined:
            AVCaptureDevice.requestAccess(for: .video) { success in
                DispatchQueue.main.async {
                    if success {
                        self.isPermissionGiven = true
                        self.setupCaptureSession()
                    } else {
                        self.isPermissionGiven = false
                        self.accessDenied()
                    }
                }
            }
        case .denied, .restricted:
            DispatchQueue.main.async {
                self.isPermissionGiven = false
                self.accessDenied()
            }
        
        @unknown default:
            DispatchQueue.main.async {
                self.isPermissionGiven = false
                self.accessDenied()
            }
        }
    }
    
    private func setupCaptureSession() {
        captureSession = AVCaptureSession()
        
        guard let videoCaptureDevice = AVCaptureDevice.default(for: .video) else { return }
        try! videoCaptureDevice.lockForConfiguration()
        videoCaptureDevice.focusPointOfInterest = self.view.frame.origin
        
        let videoInput: AVCaptureDeviceInput
        do {
            videoInput = try AVCaptureDeviceInput(device: videoCaptureDevice)
        } catch {
            return
        }
        if (captureSession.canAddInput(videoInput)) {
            captureSession.addInput(videoInput)
        } else {
            failedSession()
            return
        }
        let metadataOutput = AVCaptureMetadataOutput()
        if (captureSession.canAddOutput(metadataOutput)) {
            captureSession.addOutput(metadataOutput)
            metadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
            metadataOutput.metadataObjectTypes = [.qr]
        } else {
            failedSession()
            return
        }
        previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        previewLayer.frame = view.layer.bounds
        previewLayer.videoGravity = .resizeAspectFill
        view.layer.addSublayer(previewLayer)
        
        let holeWidth: CGFloat = 150 //270
        let hollowedView = UIView(frame: view.frame)
        hollowedView.backgroundColor = .clear
        
        let hollowedLayer = CAShapeLayer()
        
        let focusRect = CGRect(origin: CGPoint(x: (view.frame.width) / 2, y: (view.frame.height - holeWidth) / 2 ), size: CGSize(width: holeWidth, height: holeWidth))
        let holePath = UIBezierPath(roundedRect: hollowedView.frame, cornerRadius: 12)
        let externalPath = UIBezierPath(rect: hollowedView.frame).reversing()
        holePath.append(externalPath)
        holePath.usesEvenOddFillRule = true
        
        hollowedLayer.path = holePath.cgPath
        hollowedLayer.fillColor = UIColor.black.cgColor
        hollowedLayer.opacity = 0.5
        
        hollowedView.layer.addSublayer(hollowedLayer)
        view.addSubview(hollowedView)
        
        let scannerPlaceholderView = UIImageView(frame: focusRect)
        scannerPlaceholderView.image = UIImage(named: "qr_scan_placeholder")
        scannerPlaceholderView.contentMode = .scaleAspectFill
        scannerPlaceholderView.clipsToBounds = true
        self.view.addSubview(scannerPlaceholderView)
        self.view.bringSubviewToFront(scannerPlaceholderView)
        
        
        
        //TODO: COLA DE DESPACHADO
        let cola = DispatchQueue.global(qos: .background)
        cola.async {
            self.captureSession.commitConfiguration()
            self.captureSession.startRunning()
        }
            
        metadataOutput.rectOfInterest = previewLayer.metadataOutputRectConverted(fromLayerRect: focusRect)
    }
    
    private func failedSession() {
        captureSession = nil
        showAlert(message: "Your device does not support scanning a code from an item.")
    }
    
    private func accessDenied() {
        captureSession = nil
        showAlert(message: "Unable to acceso to your camera, do check privacy settings.")
    }
    private func showAlert(message: String) {
        let alert = UIAlertController(title: message, message: nil, preferredStyle: .alert)
        let actionButton = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(actionButton)
        present(alert, animated: true, completion: nil)
    }
    
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        if let metadataObject = metadataObjects.first {
            guard let readableObject = metadataObject as? AVMetadataMachineReadableCodeObject else { return }
            guard let stringValue = readableObject.stringValue else { return }
            self.showAlert(message: "QR code scanned\n \(stringValue)")
            self.promotionalCode = stringValue
            
            AudioServicesPlaySystemSound(SystemSoundID(kSystemSoundID_Vibrate))
        }
    }
    
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    deinit {
        self.captureSession = nil
    }
    
}
