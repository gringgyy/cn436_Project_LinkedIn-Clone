//
//  JobDetail.swift
//  LinkedIn-Clone
//
//  Created by Kulnis Chattratitiphan on 14/11/2564 BE.
//

import SwiftUI
import Kingfisher

struct JobDetailView: View {
    @ObservedObject var viewModel: JobCellViewModel
    
    var didApply: Bool {
        viewModel.job.didApply ?? false
    }
    
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
                            Text(viewModel.job.jobTitle)
                                .font(.system(size: 25, weight: .bold))
                                .padding(.top, 20)
                            HStack(alignment: .top) {
                                if let imageURL = viewModel.job.ownerImageURL {
                                    KFImage(URL(string:  imageURL))
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 50, height: 50)
                                        .clipped()
                                        .clipShape(Circle())
                                        .padding(.top, 5)
                                } else {
                                Image(systemName: "person.crop.circle.fill")
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 50, height: 50)
                                        .clipped()
                                        .clipShape(Circle())
                                        .padding(.top, 5)
                                }
                                
                                VStack(alignment: .leading) {
                                    Text(viewModel.job.ownerFullname)
                                        .font(.system(size: 15, weight: .light))
                                    
                                    Text(viewModel.job.jobLocation)
                                        .font(.system(size: 15, weight: .light))
                                        .padding(.top, -3)
                                }
                                .padding(.top, 5)
                            }
                            //Spacer()
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
                            Text(viewModel.job.jobDescription)
                                .font(.system(size: 16, weight: .light))
                        }
                            .padding()
                    )
            }
            .background(.quaternary)
        }
        }
        
        
}
