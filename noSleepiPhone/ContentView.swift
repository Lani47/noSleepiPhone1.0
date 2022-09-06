//
//  ContentView.swift
//  noSleepiPhone
//
//  Created by cmStudent on 2022/09/06.
//


import SwiftUI
import UserNotifications


struct ContentView: View {
    @Environment(\.scenePhase) private var scenePhase
    
    @State var flag = false
    var counter = 0
    
    @State var buttonText = "開始する"
    
    @State var textText = "ここにどれくらい画面を傾けて操作していたかを表示します"
        
        //①通知関係のメソッド作成
        func makeNotification(){
            
            //②通知タイミングを指定
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)//60秒以内の設定だとアプリが落とされる
            
            //③通知コンテンツの作成
            let content = UNMutableNotificationContent()
            content.title = "ローカル通知"
            content.body = "ローカル通知を発行しましたか"
            content.sound = UNNotificationSound.default
            
            //④通知タイミングと通知内容をまとめてリクエストを作成。
            let request = UNNotificationRequest(identifier: "notification001", content: content, trigger: trigger)

            //⑤④のリクエストの通りに通知を実行させる
            UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
            
            // 通知の削除
//            UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: ["notification001"])
            print("通知を発行")
        }
  
    
    //motionmanagerのインスタンスを利用する
    let motionManager = MotionManager.shared
    var body: some View {
        VStack {
            Text(textText)
            Button {
                //通知許諾ウィンドウ表示(初回だけ)
                    UNUserNotificationCenter.current().requestAuthorization(options: [.alert,.sound]){
                        (granted, _) in
                        if granted {

                            flag.toggle()
                            if flag  {
                                buttonText = "傾き検知を停止する"
                            } else {
                                buttonText = "傾き検知を開始する"
                                motionManager.stopQueuedUpdates()
                            }

    //                        self.makeNotification()
                            //通知が許可されているときの処理
//                            motionManager.startQueuedUpdates()

                            //⑥メソッドを実行

                        }else {
                            //通知が拒否されているときの処理

                            //①通知が拒否されているという
                                        buttonText = "通知が拒否されているので発動できません"
                                        //②１秒後に表示を元に戻しておく
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                        buttonText = "5秒後にローカル通知を発行する"
                                        }
                        }
                    }


            }
        label: {
            Text(buttonText)
    //            Text("motionmanager")
//                if flag {
//                    Text("通知を停止")
//                        .font(.title)
//                } else {
//
//                    Text("通知を作動")
//                        .font(.title)
//                }

            }
            
     
            
        }
        
        .onChange(of:scenePhase){phase in
            if phase == .background{
                if flag {
                    print(phase)
                    
                } else {
                    print("開始されていません。")
                }
            } else if phase == .inactive{
                if flag {
                    print(phase)
//                    makeNotification()
                    motionManager.startQueuedUpdates()
                } else {
                    print("開始されていません。")
                }
            } else {
                if flag {
                    print(phase)
                    textText = "あなたは\(motionManager.count)秒画面を傾けていましたね。寝ながらスマホを操作するのは目に悪いです。"
                    
                } else {
                    print("開始されていません。")
                }
               
            }
        }
//        .onDisappear{
//
//        }
    }
        
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
