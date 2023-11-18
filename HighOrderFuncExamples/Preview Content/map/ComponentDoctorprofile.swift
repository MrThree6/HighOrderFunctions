//
//  ComponentDoctorprofile.swift
//  loginView
//
//  Created by Nosaibah Alrajhi on 04/11/2023.
//

import SwiftUI

struct ComponentDoctorprofile: View {
    let doctor = [Doctor(profilepic: "cardiologist" ,title: "Chradiologist", Name: "Dr. Marcus Horize", distance: "800m away", rating: 4.7),
                  Doctor(profilepic: "psychologist" ,title: "Psychologist", Name: "Dr. Maria Elena", distance: "1,5km away", rating: 4.9),
                  Doctor(profilepic: "orthpedist3" ,title: "Orthopedist", Name: "Dr. Stevi Jessi", distance: "2km away", rating: 4.8),
                  Doctor(profilepic: "orthpedist1", title: "Orthopedist", Name: "Dr. Gert Cori", distance: "800m away", rating: 4.7),
                  Doctor(profilepic: "orthpedist2", title: "Orthopedist", Name: "Dr. Diandra", distance: "800m away", rating: 4.7)]
    
    func makedoctorlist(doctor: Doctor) -> some View {
        ZStack{
            HStack{
                Image(doctor.profilepic).resizable().scaledToFit().frame(width: 130, height: 130).clipShape(Circle()).padding()
               
                VStack(alignment: .leading , spacing: 20){
                    VStack(alignment: .leading){
                        Text(doctor.Name).bold()
                        Text(doctor.title).font(.caption).foregroundColor(.gray).multilineTextAlignment(.leading)
                    }
                    
                    HStack(){
                        HStack {
                            Image(systemName: "star.fill").resizable().scaledToFit().frame(width:10,height: 10).foregroundColor(.darkgreen)
                            
                            Text(String(format: "%.1f", doctor.rating)).font(.caption2).foregroundColor(.darkgreen)
                        }.background(RoundedRectangle(cornerRadius: 2)).foregroundColor(.darkgreen.opacity(0.2))
                        
                        HStack{
                        Image(systemName: "mappin").resizable().scaledToFit().frame(width:10,height: 10).foregroundColor(.gray)
                        
                        Text(doctor.distance).font(.caption2).foregroundColor(.gray)
                        }
                    
                    }

                    
                }
            }
            
        }.frame(width:360 , height:150, alignment: .leading).background(RoundedRectangle(cornerRadius: 15).stroke(Color(.gray).opacity(0.3),lineWidth: 0.5))
        
    }
    var body: some View {
        
            makedoctorlist(doctor: doctor[0])
        
    }
}

#Preview {
    ComponentDoctorprofile()
}
