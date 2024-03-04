//
//  TimeWeatherInfo.swift
//  WeatherApp
//
//  Created by 이안진 on 3/4/24.
//

import SwiftUI

struct TimeWeatherInfo: View {
    let time: Int
    
    var body: some View {
        VStack(spacing: 8) {
            Text("오전 \(time)시")
            Image(systemName: "cloud.fill")
            Text("7º")
        }
        .font(.system(size: 16))
    }
}
