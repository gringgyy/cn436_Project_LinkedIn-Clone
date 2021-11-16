//
//  JobDetail.swift
//  LinkedIn-Clone
//
//  Created by Kulnis Chattratitiphan on 14/11/2564 BE.
//

import SwiftUI

struct JobDetailView: View {
    var body: some View {
        ScrollView {
            LazyVStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 0)
                    .stroke(.tertiary, lineWidth: 1)
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width / 2)
                    .scaledToFill()
                    .background(.white)
                    .overlay(
                        VStack(alignment: .leading) {
                            Text("Job name")
                                .font(.system(size: 25, weight: .bold))
                                .padding(.top, 20)
                            HStack(alignment: .top) {
                                Image("Anchilee")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 50, height: 50)
                                    .clipped()
                                    .clipShape(Circle())
                                    .padding(.top, 5)
                                VStack(alignment: .leading) {
                                    Text("Job Poster")
                                        .font(.system(size: 15, weight: .light))
                                    
                                    Text("Location")
                                        .font(.system(size: 15, weight: .light))
                                        .padding(.top, -3)
                                }
                                .padding(.top, 5)
                            }
                            //Spacer()
                            Button {
                                //didFollow ? viewModel.unfollow() : viewModel.follow()
                            } label: {
                                Text("Apply")
                                    .font(.system(size: 16, weight: .semibold))
                                    .frame(width: 110, height: 30)
                                    .foregroundColor(Color.blue)
                                    .background(.white)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 30)
                                            .stroke(Color.blue, lineWidth: 2)
                                    )
                            }
                            .padding(.top, 10)
                        }
                            .padding(.leading, -190)
                            .padding(.top, -30)
                    )
                
                RoundedRectangle(cornerRadius: 0)
                    .stroke(.tertiary, lineWidth: 1)
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 4)
                    .scaledToFill()
                    .background(.white)
                    .overlay(
                        VStack(alignment: .leading) {
                            Text("Job Description")
                                .font(.system(size: 25, weight: .bold))
                            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
                                .font(.system(size: 16, weight: .light))
                        }
                            .padding()
                    )
                
                RoundedRectangle(cornerRadius: 0)
                    .stroke(.tertiary, lineWidth: 1)
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 4)
                    .scaledToFill()
                    .background(.white)
                    .overlay(
                        VStack(alignment: .leading) {
                            Text("About The Job Poster")
                                .font(.system(size: 25, weight: .bold))
                            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
                                .font(.system(size: 16, weight: .light))
                        }
                            .padding()
                    )
            }
            .background(.quaternary)
        }
        }
        
        
}

struct JobDetailView_Previews: PreviewProvider {
    static var previews: some View {
        JobDetailView()
    }
}
