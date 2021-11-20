//
//  AddJobView.swift
//  LinkedIn-Clone
//
//  Created by Kulnis Chattratitiphan on 17/11/2564 BE.
//

import SwiftUI

struct AddJobView: View {
    @ObservedObject var viewModel = addJobViewModel()
     
    @Environment(\.dismiss) var dismiss
    @State var jobTitle = ""
    @State var jobLocation = ""
    @State var description = ""
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Create new job")
                .font(.system(size: 30, weight: .medium))
                .foregroundColor(.black)
                .padding(.bottom, 25)
            Text("Job Title")
                .font(.system(size: 15, weight: .light))
                .foregroundColor(.black)
            CustomTextField(text: $jobTitle)
            Text("Job location")
                .font(.system(size: 15, weight: .light))
                .foregroundColor(.black)
            CustomTextField(text: $jobLocation)
            Text("Description")
                .font(.system(size: 15, weight: .light))
                .foregroundColor(.black)
        }
        Rectangle()
            .fill(Color.gray)
            .frame(width: UIScreen.main.bounds.width / 1.5, height: 1.5)
        TextEditor(text: $description)
            .frame(width: UIScreen.main.bounds.width / 1.5, height: 150)
            .padding()
        Rectangle()
            .fill(Color.gray)
            .frame(width: UIScreen.main.bounds.width / 1.5, height: 1.5)
            .padding(.bottom, 30)
        
        Button {
            viewModel.addJob(jobTitle: jobTitle, jobLocation: jobLocation, jobDescription: description)
            dismiss()
        } label: {
            RoundedRectangle(cornerRadius: 30)
                .foregroundColor(.blue)
                .frame(width: UIScreen.main.bounds.width / 1.5, height: 45)
                .overlay(
                    Text("Add")
                        .font(.system(size: 20, weight: .semibold))
                        .foregroundColor(.white)
                )
        }
    }
}
