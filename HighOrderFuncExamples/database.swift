//
//  database.swift
//  HighOrderFuncExamples
//
//  Created by Nosaibah Alrajhi on 18/11/2023.
//

import Foundation
import SwiftUI

struct MedicIcon :Identifiable {
    var id = UUID()
    var title: String
    var iconImageName: String
    var iconColor: Color = .darkgreen
}
struct Doctor : Identifiable{
    var id = UUID()
    var profilepic: String
    var title: String
    var Name: String
    var distance: String
    var rating: Double
}
