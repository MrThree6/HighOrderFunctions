//
//  SwiftUIView.swift
//  HighOrderFuncExamples
//
//  Created by Nosaibah Alrajhi on 18/11/2023.
//

import SwiftUI

struct sort: View {
    let doctor = [Doctor(profilepic: "cardiologist" ,title: "Chradiologist", Name: "Dr.Marcus Horize", distance: "800m away", rating: 4.7),
                  Doctor(profilepic: "psychologist" ,title: "Psychologist", Name: "Dr.Maria Elena", distance: "1,5km away", rating: 4.90),
                  Doctor(profilepic: "orthpedist3" ,title: "Orthopedist", Name: "Dr.Stevi Jessi", distance: "2km away", rating: 4.8)]
    
    
    
    let medicicon : Array<MedicIcon> = [
        MedicIcon(title: "Doctor", iconImageName: "stethoscope"),
        MedicIcon(title: "Pharmacy", iconImageName: "pill"),
        MedicIcon(title: "Hospital", iconImageName: "cross"),
        MedicIcon(title: "Ambulance", iconImageName: "cross.case")
    ]
    
    func makeicon(MedicIcon : MedicIcon) -> some View {
       
        VStack {
            Image(systemName: MedicIcon.iconImageName).resizable().scaledToFit().frame(width: 30, height: 30).foregroundColor(MedicIcon.iconColor).frame(width: 60,height: 60).background(RoundedRectangle(cornerRadius: 10.0).foregroundColor(.white))
            
            Text(MedicIcon.title).foregroundColor(.gray)
        }
       
        
    }
    
    func makedoctorlist(doctor: Doctor) -> some View {
        ZStack{
            VStack{
                Image(doctor.profilepic).clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                
                Text(doctor.Name).bold()
                Text(doctor.title).font(.caption).foregroundColor(.gray).multilineTextAlignment(.leading)
                
                
                HStack {
                    HStack {
                        Image(systemName: "star.fill").resizable().scaledToFit().frame(width:10,height: 10).foregroundColor(.darkgreen)
                        
                        Text(String(format: "%.1f", doctor.rating)).font(.caption2).foregroundColor(.darkgreen)
                    }.background(RoundedRectangle(cornerRadius: 2)).foregroundColor(.darkgreen.opacity(0.2))
                    Image(systemName: "mappin").resizable().scaledToFit().frame(width:10,height: 10).foregroundColor(.gray)
                    
                    Text(doctor.distance).font(.caption2).foregroundColor(.gray)
                }
                
                
            }
            
        }.frame(width:150 , height:200).background(RoundedRectangle(cornerRadius: 15).stroke(Color(.darkgreen).opacity(0.3),lineWidth: 0.5))
        
    }
    @State private var searchText = ""
    var body: some View {
        ZStack {
            Color(.lightgray).ignoresSafeArea()
            
            
            
            
            VStack{
                
                ScrollView{
                    
                    HStack {
                        Text("Find your desired health solution").font(.title).bold().padding(.horizontal)
                        Spacer()
                        Image(systemName: "bell").padding(.horizontal)
                    }
                    
                    
                    
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.secondary)
                        TextField("Search doctor, drugs, articles...",text: $searchText).onChange(of: searchText) {
                            
                        }
                        
                        
                    }   .padding()
                        .background(Capsule().stroke(.darkgreen.opacity(0.2),lineWidth: 1.0).fill(Color.gray.opacity(0.1))).frame(width: 350).clipShape(Capsule()).padding(.bottom)
                    
                    
                    ZStack {
                        
                        List {
                            
                            ForEach(performSearch(searchText)) { name in
                                Text("\(name.Name)")
                                
                            }
                        }
                        HStack( spacing: 20) {
                            ForEach(medicicon) { elm in
                                makeicon(MedicIcon: elm)
                                
                            }
                        }
                    
                    }

                    
                    ZStack {
                        
                        
                        
                        HStack{
                            
                            Button(action: {
                                
                            }) {
                                VStack{
                                    
                                    Text("Early protection for\n your family health").font(.title2).foregroundColor(.black).multilineTextAlignment(.leading)
                                    
                                    Text("Learn more")
                                        .frame(width: 130, height: 40)
                                        .background(Color.darkgreen)
                                        .foregroundColor(.white)
                                        .clipShape(RoundedRectangle(cornerRadius: 30))
                                }
                            }.padding(.horizontal)
                            
                            Image("7xm 6")
                            
                        }
                        
                    }.frame(width: 350,height: 170, alignment: .bottomLeading).background(.darkgreen.opacity(0.2)).clipShape(RoundedRectangle(cornerRadius: 10))
                    
                    
                    HStack {
                        Text("Top Doctor").bold().font(.title3)
                        Spacer()
                        Button("See all") {
                            /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                        }.foregroundColor(.darkgreen)
                    }.padding()
                    
                    ScrollView(.horizontal, showsIndicators: false){
                        
                        HStack (spacing: 10){
                            ForEach(doctor.sorted{$0.rating > $1.rating}) { doctor in
                                makedoctorlist(doctor: doctor)
                            }
                        }.padding()
                        
                    }
                    
                    
                    
                }//SCROLL
                
                
            }
            
        }
    }
    
    
    
    func performSearch(_ search: String)-> [Doctor] {
        // Filter doctors based on the search text
        let filteredDoctors = doctor.filter { doctor in
                   return doctor.Name.localizedCaseInsensitiveContains(search)
               }
        return filteredDoctors
        
       
    }
    
    
    
}

#Preview {
    sort()
}
