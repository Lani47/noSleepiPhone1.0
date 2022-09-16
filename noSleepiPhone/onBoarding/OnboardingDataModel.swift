//
//  OnboardingDataModel.swift
//  noSleepiPhone
//
//  Created by cmStudent on 2022/09/16.
//

//
//  OnboardingModel.swift
//  Onboarding
//
//  Created by Augustinas Malinauskas on 06/07/2020.
//  Copyright © 2020 Augustinas Malinauskas. All rights reserved.
//

import Foundation

struct OnboardingDataModel {
    var image: String
    var heading: String
    var text: String
}

extension OnboardingDataModel {
    static var data: [OnboardingDataModel] = [
        OnboardingDataModel(image: "nedoko_smartphone", heading: "Welcome to App", text: "このアプリはスマホをどれくらい寝ながら操作していたかを表示します。"),
        OnboardingDataModel(image: "computer_smartphone1_編集", heading: "バックグラウンドで動くので、開始するを押してホームに戻って使ってください。", text: ""),
        OnboardingDataModel(image: "IMG_0107copy", heading: "結果はこのアプリの画面に戻ると分かります", text: ""),
        OnboardingDataModel(image: "sagyouin_stand_smartphone_man", heading: "寝ながらスマホを操作をすると目に悪いそうなので気をつけましょう", text: ""),
        
//        OnboardingDataModel(image: "onboarding-relax", heading: "Welcome to App", text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."),
//        OnboardingDataModel(image: "onboarding-lookingatart", heading: "Explore the World", text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."),
//        OnboardingDataModel(image: "onboarding-sharing1", heading: "Live Life Baby", text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."),
        
//
//        OnboardingDataModel(image: "onboarding-security1", heading: "Work Hard", text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."),
//        OnboardingDataModel(image: "onboarding-showclients", heading: "Stay Careless", text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."),
 
    ]
}

