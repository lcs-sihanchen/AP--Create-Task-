//
//  SearchBarView.swift
//  StudentLifeGuide
//
//  Created by Chen, Sihan on 2021-01-28.
//

import SwiftUI

struct SearchBarView: View {
    
    @Binding var text: String
    @State var isEditing = false
    @State var placeholderText = "Search..."
    
    
    var body: some View {
        
        HStack {
            TextField(placeholderText, text: $text)
                .padding(7)
                .padding(.horizontal, 25)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .onTapGesture {
                    self.isEditing = true
            }

                .cornerRadius(10)
                .overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 8)
                        
                        
                        
                    }
                    
                
                )
            if isEditing == true {
                Button("Cancel", action: {
                    self.text = ""
                    self.isEditing = false
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                })
                .padding(.trailing, 20)
                .padding(.bottom, -2)
                .transition(.move(edge: .trailing))
                .animation(.default)
                .foregroundColor(.white)
            }
            
        }.padding(.horizontal, 20)
        
        
        
       
        
    }
}

struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarView(text: .constant(""), isEditing: false)
    }
}
