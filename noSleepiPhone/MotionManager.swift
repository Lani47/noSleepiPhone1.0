//
//  MotionManager.swift
//  noSleepiPhone
//
//  Created by cmStudent on 2022/09/06.
//

import Foundation
import CoreMotion
import UserNotifications
import SwiftUI
//シングルトンは必ずfinalにする CMMotionManagerのテンプレ？
final class MotionManager {
    
    

    var text = ""
    
    var count = 0
    //①通知関係のメソッド作成
    func makeNotification(){
        //②通知タイミングを指定
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)
        
        //③通知コンテンツの作成
        let content = UNMutableNotificationContent()
        content.title = "注意"
        content.body = "携帯が傾いています。\(self.count)回目"
        content.sound = UNNotificationSound.default
        
        //④通知タイミングと通知内容をまとめてリクエストを作成。
        let request = UNNotificationRequest(identifier: "notification001", content: content, trigger: trigger)

        //⑤④のリクエストの通りに通知を実行させる
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
        print("通知を発行")
    }
    
    
    //staticでインスタンスを保持しておく
    // MotionManager.sharedでアクセスができる
    static let shared: MotionManager = .init()
    //privateのletでCMMOtionManagerのインスタンスを作っておく
    private let motion = CMMotionManager()
    
    private let queue = OperationQueue()
    
    //シングルトンにするためにinitを潰してインスタンスを作らせない このクラス内だけのものにする
    private init() { }
    
    func removeNotification(){
      
        UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: ["notification001"])
       }
    
    func startQueuedUpdates() {
        //加速度センサーが使えな場合はここまで
        guard motion.isAccelerometerAvailable else { return }
        //ジャイロセンサーが使えな場合はここまで
        guard motion.isGyroAvailable else { return }
        //まとめたDeviceMotion
        guard motion.isDeviceMotionAvailable else { return }
        
//        self.motion.deviceMotionUpdateInterval = 1.0 / 60.0
        self.motion.deviceMotionUpdateInterval = 60.0 / 60.0
        //おまじない
        self.motion.showsDeviceMovementDisplay = true
        
       
        
        self.motion.startDeviceMotionUpdates(using: .xMagneticNorthZVertical, to: self.queue){ [self]
            data, error in
            if let valldData = data {
                //　角度
//                print(valldData.attitude.roll)
                print("valldData.attitude.roll:\(valldData.attitude.roll)")
                print("valldData.attitude.pitch:\(valldData.attitude.pitch)")
                print("valldData.attitude.yaw:\(valldData.attitude.yaw)")
                
                if valldData.attitude.roll >= 1 || valldData.attitude.roll <= -1{
                    self.count += 1
                    print("count:\(self.count)")
                    
                    if self.count == 10 {
//                        self.removeNotification()

//                        self.count = 0
                        
                        self.makeNotification()
                        
                    }
                }
//                print(valldData.attitude.pitch)
//                print(valldData.attitude.yaw)
//                //加速度
//                print(valldData.userAcceleration.x)
//                print(valldData.userAcceleration.y)
//                print(valldData.userAcceleration.z)
//                //回転速度
//                print(valldData.rotationRate.x)
//                print(valldData.rotationRate.y)
//                print(valldData.rotationRate.z)
//                //重力
//                print(valldData.gravity.x)
//                print(valldData.gravity.y)
//                print(valldData.gravity.z)
                //コンパス
//                print(valldData.magneticField.field.x)
//                print(valldData.magneticField.field.y)
//                print(valldData.magneticField.field.z)
            }

        }
        
        //更新間隔
        motion.accelerometerUpdateInterval = 6.0 / 60.0 // 0.1秒間隔
        
        //加速度センサーを利用して値を取得する。
        //とってくるdataの型はCMAccelerometerHandler
//        motion.startAccelerometerUpdates(to: queue) {data,error in
//            if let vallidData = data {
//                let x = vallidData.acceleration.x
//                let y = vallidData.acceleration.y
//                let z = vallidData.acceleration.z
//
//                print("x:\(x)")
//                print("y:\(y)")
//                print("z:\(z)")
//            }
//        }
        //ジャイロセンサーを利用して値を取得する。
        //取ってくるdataの型はCMAccelerometerHandler
//        motion.startGyroUpdates(to: queue) {data, error in
//            //dataはオプショナル型なので安全に取り出す
//            if let vallidData = data {
//                let x = vallidData.rotationRate.x
//                let y = vallidData.rotationRate.y
//                let z = vallidData.rotationRate.z
//
//                print("x:\(x)")
//                print("y:\(y)")
//                print("z:\(z)")
//
//
//            }
//        }
        
    
    }
    
    func stopQueuedUpdates() {
        
        print("stop")
        self.motion.stopDeviceMotionUpdates()
        self.motion.stopAccelerometerUpdates()
        self.motion.stopGyroUpdates()
        self.motion.stopMagnetometerUpdates()
    }
    
}

