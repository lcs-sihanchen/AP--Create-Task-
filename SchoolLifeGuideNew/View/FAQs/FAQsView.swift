//
//  FAQsView.swift
//  SchoolLifeGuideNew
//
//  Created by Chen, Sihan on 2021-01-31.
//

import SwiftUI

struct FAQsView: View {
    //Change Navigation Bar Text color
    
   
    
    @State private var showingAssessmentView = false
    @ObservedObject var store: Offences
    var body: some View {
        
        let questions = Issues()
         
        UITableView.appearance().backgroundColor = .clear
        UITableViewCell.appearance().backgroundColor = .clear
        
        return  ZStack {
            GradientBackground().edgesIgnoringSafeArea(.all)
            
            Form {
                List(questions.list) { question in
                    
                    NavigationLink(destination: FAQsDetailView(question: question)) {
                        
                     
                        ZStack{
                           
                            Label(question.question, systemImage: question.systemImageName).font(Font.body.bold())
                            
                        }
                        
                        
                    }
                
                
                }.foregroundColor(Color(red: 43.0 / 255, green: 104.0 / 255, blue: 78.0 / 255))
            }.navigationTitle(Text("FAQs"))
            
            
            
        }.toolbar {
            ToolbarItem(placement: .primaryAction) {
                
                Text("My Status")
                    .foregroundColor(.white)
                    .onTapGesture {
                        print("pressed")
                        showingAssessmentView = true
                    }
            }
        }.sheet(isPresented: $showingAssessmentView) {
            AssessmentView(showing: $showingAssessmentView, store: store)
            // Save in JSON when user quits the app
        }.onReceive(NotificationCenter.default.publisher(for: UIApplication.willResignActiveNotification)) { _ in
            
            // Save the list of offences
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(store.offences) {
                print("Saving tasks list now, app has been backgrounded or quit...")
                // Actually save the tasks to UserDefaults
                UserDefaults.standard.setValue(encoded, forKey: "offences")
            }

        }
    }
       
                
        
               
            }
            
        
        
        
        
       
        
        
    
    
    
    
    


struct FAQsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            FAQsView(store: testStore)
        }
        
    }
}
