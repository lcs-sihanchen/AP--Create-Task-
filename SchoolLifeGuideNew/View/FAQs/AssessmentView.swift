//
//  AssessmentView.swift
//  SchoolLifeGuideNew
//
//  Created by Chen, Sihan on 2021-03-05.
//

import SwiftUI



struct AssessmentView: View {
    
    
    @ObservedObject var viewModel = AssessmentViewModel()
    @Binding var showing: Bool
    @State private var showAlert = false
    @ObservedObject var store: Offences
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    
                    
                    Group {
                        Section {
                            
                            TextField("Description", text: $viewModel.description)
                            WheelPickerView(viewModel: viewModel)
                            Picker("Violation Times", selection: $viewModel.violationTimes) {
                                Text(TimesOfViolation.First.rawValue).tag(TimesOfViolation.First)
                                Text(TimesOfViolation.Second.rawValue).tag(TimesOfViolation.Second)
                                Text(TimesOfViolation.Third.rawValue).tag(TimesOfViolation.Third)
                            }.pickerStyle(SegmentedPickerStyle())
                        }
                        
                        
                        Section {
                            
                            Text("Forthrightness")
                            
                            Slider(value: $viewModel.complianceLevel, in: 0...100, step: 1).accentColor(viewModel.getColor())
                            
                            
                        }
                        
                        
                        
                        
                        
                        
                    }
                    
                    Button("Get Result") {
                        accountabilityText = viewModel.getAlertMessage()
                        showAlert = true
                        store.offences.append(Offence(areaOfViolation: viewModel.description, timesOfViolation: viewModel.violationTimes, levelOfCompliance: viewModel.complianceLevel))
                        
                    }.alert(isPresented: $showAlert) {
                        Alert(title: Text("Accountability"), message:   Text(accountabilityText), dismissButton: .default(Text("cancel")))
                        
                        
                        
                    }
                    
                    
                }
                
                
            }.navigationTitle("My Status")
            .background(GradientBackground())
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    
                    Text("Cancel").foregroundColor(.white).onTapGesture {
                        saveTask()
                    }
                    
                    
                }
                
                
                
            }
            
            
            
            
            
        }
        
    }
    
    func saveTask() {
        
        // Add the task to the list of tasks
        store.offences.append(Offence(areaOfViolation: viewModel.description, timesOfViolation: viewModel.violationTimes, levelOfCompliance: viewModel.complianceLevel))
        
        // Dismiss this view
        showing = false
        
    }
    
    struct AssessmentView_Previews: PreviewProvider {
        static var previews: some View {
            AssessmentView(showing: .constant(true), store: testStore)
        }
    }
}


var accountabilityText = ""
