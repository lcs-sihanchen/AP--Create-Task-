//
//  AssessmentView.swift
//  SchoolLifeGuideNew
//
//  Created by Chen, Sihan on 2021-03-05.
//

import SwiftUI



struct AssessmentView: View {
    
    
    @ObservedObject var viewModel = AssessmentViewModel()
    @State private var showingHistoryView: Bool = false
    
    
    
    
    //    @State private var description = ""
    //    @State private var violationTimes = TimesOfViolation.First
    //    @State private var severity = Severity.Low
    
    //
    //
    //    @State private var complianceLevel: Double = 0
    //    @State private var myColor = Color(red: 255, green: 0, blue: 0)
    //
    //    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    
    @Binding var showing: Bool
    @State var showReference: Bool = false
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
                            Label("Severity", systemImage: "circle.fill").foregroundColor(viewModel.getIconColor())
                            
                            Picker("Severity", selection:$viewModel.severity) {
                                Text(Severity.Low.rawValue)
                                    .tag(Severity.Low)
                                Text(Severity.Medium.rawValue)
                                    .tag(Severity.Medium)
                                Text(Severity.High.rawValue)
                                    .tag(Severity.High)
                                Text(Severity.veryHigh.rawValue)
                                    .tag(Severity.veryHigh)
                            }.pickerStyle(SegmentedPickerStyle())
                        }
                        
                        Section {
                            
                            
                            Slider(value: $viewModel.complianceLevel, in: 0...100, step: 1).accentColor(viewModel.getColor())
                            
                            Text("Current Value is \(Int(viewModel.complianceLevel))")
                            
                            
                            
                        }
                        
                        
                        
                        
                        
                        
                    }
                    
                    Button("Get Result") {
                        accountabilityText = viewModel.getAlertMessage()
                        showAlert = true
                        store.offences.append(Offence(areaOfViolation: viewModel.description, timesOfViolation: viewModel.violationTimes, severity: viewModel.severity, levelOfCompliance: viewModel.complianceLevel))
                        
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
            store.offences.append(Offence(areaOfViolation: viewModel.description, timesOfViolation: viewModel.violationTimes, severity: viewModel.severity, levelOfCompliance: viewModel.complianceLevel))
            
            // Dismiss this view
            showing = false
            
        }
        
        struct ColorStyle: ButtonStyle {
            func makeBody(configuration: Self.Configuration) -> some View {
                configuration.label
                    .padding(12)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
        }
        
        struct AssessmentView_Previews: PreviewProvider {
            static var previews: some View {
                AssessmentView(showing: .constant(true), store: testStore)
            }
        }
    }


var accountabilityText = ""
