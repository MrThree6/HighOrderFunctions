//
//  FindDoctor.swift
//  loginView
//
//  Created by Nosaibah Alrajhi on 04/11/2023.
//

import SwiftUI

struct FindDoctor: View {
    @State private var searchText = ""
    
    let medicicon : Array<MedicIcon> = [
        MedicIcon(title: "General", iconImageName: "stethoscope"),
        MedicIcon(title: "Lungs Specialist", iconImageName: "lungs"),
        MedicIcon(title: "Dentist", iconImageName: "tooth"),
        MedicIcon(title: "Psychiatrist", iconImageName: "bubbles.and.sparkles")
        ,MedicIcon(title: "Covid-19", iconImageName: "microbe"),
        MedicIcon(title: "surgen", iconImageName: "syringe"),
        MedicIcon(title: "Cardiologist", iconImageName: "waveform.path.ecg.rectangle")
    ]
    
    func makeicon(MedicIcon : MedicIcon) -> some View {
       
        VStack {
            if MedicIcon.title == "Dentist"{
            Image( MedicIcon.iconImageName).resizable().scaledToFit().frame(width: 30, height: 30).foregroundColor(MedicIcon.iconColor).frame(width: 60,height: 60).background(RoundedRectangle(cornerRadius: 10.0).foregroundColor(.white))
            } else{
                Image(systemName: MedicIcon.iconImageName).resizable().scaledToFit().frame(width: 30, height: 30).foregroundColor(MedicIcon.iconColor).frame(width: 60,height: 60).background(RoundedRectangle(cornerRadius: 10.0).foregroundColor(.white))
                
            }

            Text(MedicIcon.title).font(.caption2).foregroundColor(.gray)
        }
       
        
    }
    
    var body: some View {
        ZStack {
            
            Color(.lightgray).ignoresSafeArea()
            
            ScrollView {
                VStack {
                    ZStack {
                        
                        Button(action: {
                        }) {
                            Image(systemName: "chevron.left")
                                .frame(width: 50, height: 50.0)
                                .foregroundColor(Color.black)
                            
                        }.frame(maxWidth:.infinity,alignment: .topLeading).frame(height: -20.0)
                        
                        Text("Find Doctor").bold().padding()
                        
                        
                        
                    }
                    //search bar
                    
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.secondary)
                        TextField("Search doctor, drugs, articles...",text: $searchText)
                    }   .padding()
                        .background(Capsule().stroke(.darkgreen.opacity(0.2),lineWidth: 1.0).fill(Color.gray.opacity(0.1))).frame(width: 350).clipShape(Capsule()).padding(.bottom)
                    //catagory
                    Text("Catagory").bold().frame(maxWidth:.infinity,alignment: .topLeading).frame(height: -20.0).padding()
                    
                    //medic icon
                    
                    LazyVGrid(columns: [GridItem(.fixed(90)), GridItem(.fixed(90)), GridItem(.fixed(90)), GridItem(.fixed(90))], spacing: 1){
                        ForEach(medicicon) { elm in
                                                    makeicon(MedicIcon: elm)
                                                    
                                                }

                        
                    }.padding()
                    // recommmended doctors
                    Text("Recommended Doctors").bold().frame(maxWidth:.infinity,alignment: .topLeading).frame(height: -20.0).padding()
                    
                    ComponentDoctorprofile().padding()
                    
                    // recent doctors
                    Text("Your Recent Doctors").bold().frame(maxWidth:.infinity,alignment: .topLeading).frame(height: -20.0).padding(.horizontal)
                    ScrollView(.horizontal,showsIndicators: false){
                      
                        HStack{
                            ComponentRecentDoctors()
                        }.padding()
                        
                    }
                    
                    
                }
            }
        }
    }
}

#Preview {
    FindDoctor()
}
