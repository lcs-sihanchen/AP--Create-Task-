//
//  LibraryView.swift
//  SchoolLifeGuideNew
//
//  Created by Chen, Sihan on 2021-02-01.
//

import SwiftUI
import AVKit
struct LibraryView: View {
  
    
    var urlList = Videos()
    var body: some View {
        UITableView.appearance().backgroundColor = .clear
        UITableViewCell.appearance().backgroundColor = .clear
        
        
      return  ZStack {
            GradientBackground()
            List(urlList.list) { Video in
                
               
                NavigationLink(destination: VideoView(video: Video)) {
                    
                    ZStack {
                        Image("Safety")
                        Text("Video").bold()
                    }
                }
                        
                    
                
               
               
                        
                        
                    
        
                
                
                
            }.navigationTitle("Video Library")
        }
       
                
            
            
            
        
    }
}

struct LibraryView_Previews: PreviewProvider {
    static var previews: some View {
        LibraryView()
    }
}
