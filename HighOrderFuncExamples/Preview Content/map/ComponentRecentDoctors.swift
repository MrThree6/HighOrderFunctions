//
//  ComponentRecentDoctors.swift
//  loginView
//
//  Created by Nosaibah Alrajhi on 04/11/2023.
//

import SwiftUI

struct ComponentRecentDoctors: View {
    
    
    let doctor = [Doctor(profilepic: "cardiologist" ,title: "Chradiologist", Name: "dr. Marcus", distance: "800m away", rating: 4.7),
                  Doctor(profilepic: "psychologist" ,title: "Psychologist", Name: "dr. Maria", distance: "1,5km away", rating: 4.9),
                  Doctor(profilepic: "orthpedist3" ,title: "Orthopedist", Name: "dr. Stevi", distance: "2km away", rating: 4.8),
                  Doctor(profilepic: "orthpedist1", title: "Orthopedist", Name: "dr. Gert", distance: "800m away", rating: 4.7),
    Doctor(profilepic: "orthpedist2", title: "Orthopedist", Name: "dr. Diandra", distance: "800m away", rating: 4.7)]
    
    func makedoctorlist(doctor: Doctor) -> some View {
        ZStack{
            VStack{
                Image(doctor.profilepic).resizable().scaledToFit().frame(width: 70).clipShape(Circle())
               
                     
                
            }
            
        }
        
    }
    var body: some View {
        let capitalizedWords = doctor.map { $0.Name.capitalized }
        
        ForEach(Array(doctor.enumerated()), id: \.offset) { (index,doctor) in
            
            
            VStack {
                makedoctorlist(doctor: doctor)
                Text(capitalizedWords[index]).font(.caption)
                

            }
            
        }
    }
}

#Preview {
    ComponentRecentDoctors()
}
