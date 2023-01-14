//
//  ViewController.swift
//  example
//
//  Created by Nazar Kovalyk on 20.04.2021.
//

import UIKit
import MomenzoVideoEngine
import AVFoundation
import Photos
import Alamofire
import RealityKit

struct CompleteMontageContext {
    let template: Template
    let shots: [Shot]
    let montage: Montage
    let videos: [Video]
}

struct MontageComposition {
    let asset: AVAsset
    let videoComposition: AVVideoComposition
    let audioMix: AVAudioMix
}

class ViewController: UIViewController {
    private var montage: Montage?
    private var template: Template?
    private var shots: [Shot]?
    private var videos: [Video]?
    
    
    var templateOverlay: [TemplateOverlay]? = nil
    var templateScene: [Scene]? = nil
    var templateAll: Template? = nil
    var transition: Transition? = nil

    var templateText: [TemplateText]? = nil
    let queue = DispatchQueue(label: "com.momenzo.mediaProcessing")
    var templateQuestion: [TemplateQuestion]? = nil
    var templateAudioSegment: [TemplateAudioSegment]? = nil
    var templateShotProperties: [String : TemplateShotProperties]? = nil
    var templateSoundtrack: [TemplateSoundtrack]? = nil
    
    @IBAction func getTemplate(_ sender: Any) {
        getOrders() { responseObject, error in

          let decoder = JSONDecoder()
          decoder.keyDecodingStrategy = .convertFromSnakeCase
          let result = try! decoder.decode(defaultSceneDefoltModel.self, from: responseObject!)
          let templetett = result.templates
            templetett!.forEach { templetet in
                let templateOverlayString = templetet.overlays?.map({ TemplateOverlay(overlay: $0) })

                templateOverlayString?.forEach{ i in
                    print(i.asset)
                    
                    let destination: DownloadRequest.Destination = { _, _ in
                        let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
                                let fileURL = documentsURL.appendingPathComponent("\(i.asset).png")

                                return (fileURL, [.removePreviousFile, .createIntermediateDirectories])
                        }
                    AF.download("https://api.momenzo.com/resources/assets/\(i.asset)?", to: destination).response { response in
                        debugPrint(response)
                        if response.error == nil, let imagePath = response.fileURL?.path {
                            _ = UIImage(contentsOfFile: imagePath)
                        }
                    }
                    }
                }
          }
        }
    var indicatorView: UIActivityIndicatorView? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getOrders() { responseObject, error in
          let decoder = JSONDecoder()
          decoder.keyDecodingStrategy = .convertFromSnakeCase
          let result = try! decoder.decode(defaultSceneDefoltModel.self, from: responseObject!)
            var number = 0
            var namberTab = 0
            for i in 0..<(result.templates?.count)! {
                number += 10
                let playButton = UIButton(frame: CGRect(x: 10, y: number * 6, width: 110, height: 50))
                namberTab += 1
                playButton.tag = namberTab
                playButton.backgroundColor = UIColor(red: 84.0, green: 0.0, blue: 0.0, alpha: 1)
                playButton.setTitle("Template \(i + 1)", for: .normal)
                playButton.addTarget(self, action: #selector(self.actionWithoutTemplates), for: .touchUpInside)
                self.view.addSubview(playButton)
            }
        }
    }
    
    @objc func actionWithoutTemplates(sender: UIButton){
        getOrders() { responseObject, error in
          let decoder = JSONDecoder()
          decoder.keyDecodingStrategy = .convertFromSnakeCase
          let result = try! decoder.decode(defaultSceneDefoltModel.self, from: responseObject!)
          let templetett = result.templates
            templetett!.forEach { templetet in
                let formatt: [Format] = templetet.format
                var number = 0
                var namberTab = 0
                for i in formatt {
                number += 10
                    let playButton = UIButton(frame: CGRect(x: Int(self.view.center.x) - 70, y: number * 7 - 10, width: 200, height: 60))
                    namberTab += 1
                    playButton.tag = namberTab
                    playButton.backgroundColor = UIColor(red: CGFloat(namberTab * 10), green: 0.0, blue: 0.0, alpha: 1)
                    playButton.setTitle(i.identifier, for: .normal)
                    playButton.addTarget(self, action: #selector(self.actionWithoutParam), for: .touchUpInside)
                     self.view.addSubview(playButton)
                }
          }
        }
    }
    
    func request(tag: Int) {
        getOrders() { responseObject, error in
          let decoder = JSONDecoder()
          decoder.keyDecodingStrategy = .convertFromSnakeCase
          let result = try! decoder.decode(defaultSceneDefoltModel.self, from: responseObject!)
            let templetett = result.templates!
            templetett.forEach { templetet in
                let formatt: [Format] = templetet.format
                var number = 0
                var namberTab = 0
                for i in formatt {
                number += 10
                    let playButton = UIButton(frame: CGRect(x: Int(self.view.center.x) - 70, y: number * 7 - 10, width: 200, height: 60))
                    namberTab += 1
                    playButton.tag = namberTab
                    playButton.backgroundColor = UIColor(red: CGFloat(namberTab * 10), green: 0.0, blue: 0.0, alpha: 1)
                    playButton.setTitle(i.identifier, for: .normal)
                    playButton.addTarget(self, action: #selector(self.actionWithoutParam), for: .touchUpInside)
                     self.view.addSubview(playButton)
                }
          }
        }
    }
    
    private func activityIndicator(style: UIActivityIndicatorView.Style = .medium,
                                       frame: CGRect? = nil,
                                       center: CGPoint? = nil) -> UIActivityIndicatorView {
        let activityIndicatorView = UIActivityIndicatorView(style: style)
        if let frame = frame {
            activityIndicatorView.frame = frame
        }
        if let center = center {
            activityIndicatorView.center = center
        }
        return activityIndicatorView
    }
    
    @objc func actionWithoutParam(sender: UIButton){
        // 1
        indicatorView = activityIndicator(style: .medium,
                                                  center: view.center)
        
        self.view.tag = 100
          // 2
        self.view.addSubview(indicatorView!)
          
          // 3
        indicatorView!.startAnimating()
        
                if sender.tag == 1{
                    requestTemplets(videoFormat: .landscape)
                } else if sender.tag == 2{
                    requestTemplets(videoFormat: .oneOnOneCropped)
                } else if sender.tag == 3{
                    requestTemplets(videoFormat: .oneOnOne)
                } else if sender.tag == 4{
                    requestTemplets(videoFormat: .landscapeCropped)
                }
    }
    
    
    
    var templateReturn: Template?
    
    func requestTemplets(videoFormat: VideoFormat) {
        getOrders() { responseObject, error in

          let decoder = JSONDecoder()
          decoder.keyDecodingStrategy = .convertFromSnakeCase
          let result = try! decoder.decode(defaultSceneDefoltModel.self, from: responseObject!)
          let templetett = result.templates
            templetett!.forEach { templetet in
           self.templateOverlay = templetet.overlays?.map({ TemplateOverlay(overlay: $0) })
           self.templateScene = templetet.scenes?.map({ Scene(overlay: $0) })
           self.templateText = templetet.text?.map({ TemplateText(overlay: $0)})
                self.templateSoundtrack = templetet.soundtracks?.map({TemplateSoundtrack(overlay: $0)})
                let templateOve = templetet.format?.map({$0})
                print(templateOve!)
        
                self.templateAll = Template.from(overlay: templetet, templateOverlay: self.templateOverlay!, templateScene: self.templateScene!, templateText: self.templateText!, templateSoundtrack: self.templateSoundtrack!)
                
              
                self.initV(videoFormat: videoFormat, _template: self.templateAll!)
          }
        }
    }
    
    
    func getOrders(completionHandler: @escaping (Data?, Error?) -> ()){
        getRequestAPICall(completionHandler: completionHandler)
    }

    func getRequestAPICall(completionHandler: @escaping (Data?, Error?) -> ()){
        guard let fileURL = Bundle(for: type(of: self)).url(forResource: "TemplatesJSON", withExtension:"json") else {
                fatalError("File not found")
        }
            AF.request(fileURL, method: .get, encoding: JSONEncoding.default, headers: [
            ])
                    .responseData { response in // note the change to responseData
                        switch response.result {
                        case .failure(let error):
                            completionHandler(nil, error)
                        case .success(let data):
                            completionHandler(data as? Data, nil)
                            }
                        }
        }
    
    func initV(videoFormat: VideoFormat, _template: Template){
        var _montag = Montage(id: UUID().uuidString, template: "tpl_demo0_en_bt:10", date: Date(), subject: "",
                             author: "", videos: [String](repeating: "", count: 3),
                             answers: ["price": "", "surface": "", "projectName": ""], soundtrack: "demo0_soundtrack0",
                             videoAnswers: [String](repeating: "", count: 3))

        let _videos: [Video] = [Video(id: "4B3730B2-363E-442E-BA0A-5A66F9804831", shot: "shot_demo0_en_intro",
                                      duration: 4000, author: "", subject: "", date: Date()),
                                Video(id: "4B3730B2-363E-442E-BA0A-5A66F9804832", shot: "shot_demo0_en_living_s",
                                                              duration: 5400, author: "", subject: "", date: Date()),
                                Video(id: "4B3730B2-363E-442E-BA0A-5A66F9804833", shot: "shot_demo0_en_kitchen_s",
                                                              duration: 4400, author: "", subject: "", date: Date())]
        let _shots = [Shot.from()!]
        let context = CompleteMontageContext(template: _template, shots: _shots, montage: _montag, videos: _videos)
        let tempUrl = temporaryVideoURL()

        export(context: context, to: tempUrl, videoFormat: videoFormat, progressHandler: {progress in

        }, completionHandler: {error in

        })
    }
    
    func file() -> [URL] {
        var arrayFilep: [URL] = []
        let imageArray = Bundle.main.urls(forResourcesWithExtension: "mp4", subdirectory: "") as! [NSURL]
        let nn = imageArray.map({$0.absoluteString})
        for i in 0..<(nn.count) {
        let documentDirectoryUrl = URL(string: nn[i]!)!
        let fileName = documentDirectoryUrl.lastPathComponent
        let stringResult = fileName.contains("video_")
            if stringResult {
                arrayFilep.append(documentDirectoryUrl)
            } else {
                
            }
        }
        return arrayFilep
    }
    var str = 0
    func mockVideo() -> URL{
        if str >= file().count{
            let alert = UIAlertController(title: "Error", message: "does not match the number of scenes with the number of videos", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Click", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return URL(string: "")!
        } else {
            let documentDirectoryUrl = file()[str]
           str += 1
           return documentDirectoryUrl
        }
    }

    func compositionBuilder(forContext context: CompleteMontageContext,
                            renderSize: CGSize?, videoFormat: VideoFormat) -> (VideoCompositionBuilder?, String?) {
        let assetURLs = self.assetURLs(for: context)

        let mmzVideos = context.videos.map { $0.mmzVideo(at: mockVideo()) }
        let compositionContext = TemplateCompositionContext(template: context.template.mmzTemplate,
                                                            shots: context.shots.map { $0.mmzShot },
                                                            montage: context.montage.mmzMontage, videos: mmzVideos)
        let compositionCreator = TemplateCompositionCreator()
        return compositionCreator.compositionBuilder(forContext: compositionContext, assetURLs: assetURLs,
                                                     renderSize: renderSize, videoFormat: videoFormat)
    }
    
    func assetURLs(for context: CompleteMontageContext) -> [String: URL] {
        let availableAssets = AvailableAssets().availableAssetsFunc()
        let assets = Set<String>(context.template.requiredAssets())
        return availableAssets.filter { assets.contains($0.key) }
    }
    
    
    func composition(forContext context: CompleteMontageContext, renderSize: CGSize, videoFormat: VideoFormat) -> (MontageComposition?, String?) {
        
        
        let (builder_, error1) = self.compositionBuilder(forContext: context, renderSize: renderSize, videoFormat: videoFormat)
        guard let builder = builder_ else {
            return (nil, error1) }

        let (composition_, error2) = builder.build(videoFormat: videoFormat)
        guard let composition = composition_ else { return (nil, error2) }

        let mc = MontageComposition(asset: composition.composition, videoComposition: composition.videoComposition,
                                    audioMix: composition.audioMix)
        return (mc, nil)
    }
    
    func export(context: CompleteMontageContext, to destinationURL: URL, videoFormat: VideoFormat,
                progressHandler: ((Double) -> Void)?, completionHandler: @escaping (String?) -> Void) {
        var renderSize = CGSize(width: 0.0, height: 0.0)
        switch videoFormat {
        case .landscape:
           renderSize = CGSize(width: 1920.0, height: 1080.0)
        case .oneOnOneCropped:
           renderSize = CGSize(width: 1080.0, height: 1080.0)
        case .oneOnOne:
           renderSize = CGSize(width: 1080.0, height: 1080.0)
        case .landscapeCropped:
           renderSize = CGSize(width: 1080.0, height: 1920.0)
        }
        self.queue.async {
            let (composition_, error) = self.composition(forContext: context, renderSize: renderSize , videoFormat: videoFormat)
            guard let composition = composition_ else {
                DispatchQueue.main.async { completionHandler(error) }
                return
            }

            let exporter = AssetExporter(asset: composition.asset)
            exporter.videoComposition = composition.videoComposition
            exporter.audioMix = composition.audioMix
            exporter.averageAudioBitRate = AssetExporter.kRecommendedAudioBitRate
            exporter.averageVideoBitRate = renderSize.videoBitRate
            exporter.export(to: destinationURL, progressHandler: progressHandler, completionHandler: { error in
                if error == nil {
                }
                self.saveToAlbum(videoAt:destinationURL) { assetIdentifier in
                    assetIdentifier
                }
                
                completionHandler(error)
            })
        }
    }
    
    func saveToAlbum(videoAt url: URL, completionHandler: @escaping (String?) -> Void) {
        self.authorizePhotosAccess { authorized in
            guard authorized else {
                completionHandler(nil)
                return
            }

            var localIdentifier: String?
            PHPhotoLibrary.shared().performChanges({
                localIdentifier = PHAssetChangeRequest.creationRequestForAssetFromVideo(atFileURL: url)?
                                                      .placeholderForCreatedAsset?.localIdentifier
            }, completionHandler: { success, _ in
                DispatchQueue.main.async { completionHandler(success ? localIdentifier : nil) }
            })
            self.indicatorView?.stopAnimating()
            let alert = UIAlertController(title: "Done", message: "go to your gallery and check out the video", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Click", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    private func authorizePhotosAccess(completionHandler: @escaping (Bool) -> Void) {
        let complete = { (status: PHAuthorizationStatus) in
            DispatchQueue.main.async { completionHandler(status == .authorized) }
        }

        let status = PHPhotoLibrary.authorizationStatus()
        if status == .notDetermined {
            PHPhotoLibrary.requestAuthorization(complete)
        } else {
            complete(status)
        }
    }
    
    func temporaryURL() -> URL {
        let tempDir = URL(fileURLWithPath: NSTemporaryDirectory(), isDirectory: true)
        let tempID = UUID().uuidString
        return tempDir.appendingPathComponent(tempID)
    }

    func temporaryVideoURL() -> URL {
        let kVideoFileExtension = "mp4"
        return self.temporaryURL().appendingPathExtension(kVideoFileExtension)
    }
}
