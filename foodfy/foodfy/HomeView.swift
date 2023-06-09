//
//  HomeView.swift
//  foodfy
//
//  Created by Student14 on 14/06/23.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        
        ZStack(){
            
            VStack() {
                Rectangle()
                    .fill(Color.healthyGreen)
                    .ignoresSafeArea()
                    .frame(height: 10)
                
                
                NavigationStack {
                    VStack(alignment: .leading) {
                        Text("Recomendados")
                            .font(.title)
                            .fontWeight(.medium)
                            .foregroundColor(Color.healthyGreen)
                            .padding(.top, 50)
                            .padding(.leading, 10)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(Recipes) { item in
                                    NavigationLink(destination: detailedView(foodItem: item)) {
                                        
                                        VStack() {
                                            Rectangle()
                                                .fill(Color.healthyGreen)
                                                .frame(width: 210 , height: 40)
                                                .padding(.bottom, -10)
                                                .overlay(Text(item.name.capitalized).font(.system(size: 24).bold())
                                                    .foregroundColor(.white).padding(.top, 5))
                                            
                                            ZStack() {
                                                AsyncImage(url: URL(string: item.image)) { image in
                                                    image
                                                        .resizable()
                                                        .aspectRatio(contentMode: .fill)
                                                    
                                                } placeholder: {
                                                    Color.gray
                                                }
                                                .frame(width: 210 , height: 250)
                                                
                                                
                                            }
                                            Rectangle()
                                                .fill(Color.healthyGreen)
                                                .frame(width: 210 , height: 70)
                                                .padding(.top, -15)
                                                .overlay(Text(item.description.capitalized).font(.system(size: 22))
                                                    .foregroundColor(.white).padding(.top, -30))
                                            
                                            
                                        }
                                        .cornerRadius(9)
                                        .padding(.horizontal, 5)
                                        
                                    }
                                }
                                
                            }
                            
                            Spacer()
                                                                
                        }
                        
                        
                       

                        
                    }
                }
                
            }
        }.accentColor(.black)
    }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
