//
//  AddBackgroundView.swift
//  LinkedIn-Clone
//
//  Created by Kulnis Chattratitiphan on 14/11/2564 BE.
//

import SwiftUI

struct AddBackgroundView: View {
    @Environment(\.dismiss) var dismiss
    @State var name = ""
    @State var location = ""
    @State var date = ""
    @State var description = ""
    
    @State var value = ""
    var placeholder = "Select Type"
    var dropDownList = ["Experience", "Education", "Licenses & certifications", "Volunteering"]
    
    let dateFormatter: DateFormatter = {
            let formatter = DateFormatter()
            formatter.dateStyle = .long
            return formatter
        }()
    
    @State private var pickDate = Date()
    
    
    
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                Text("Type")
                    .font(.system(size: 15, weight: .light))
                    .foregroundColor(.black)
                Menu {
                    ForEach(dropDownList, id: \.self){ client in
                        Button(client) {
                            self.value = client
                        }
                    }
                } label: {
                    VStack(spacing: 5){
                        HStack{
                            Text(value.isEmpty ? placeholder : value)
                                .foregroundColor(value.isEmpty ? .gray : .black)
                                
                            //Spacer()
                            Image(systemName: "chevron.down")
                                .foregroundColor(Color.gray)
                                .font(Font.system(size: 17, weight: .medium))
                        }
                        .padding(.horizontal)
                        Rectangle()
                            .fill(Color.gray)
                            .frame(width: UIScreen.main.bounds.width / 1.5, height: 1.5)
                    }
                }
                Text("Name")
                    .font(.system(size: 15, weight: .light))
                    .foregroundColor(.black)
                CustomTextField(text: $name)
                Text("Location")
                    .font(.system(size: 15, weight: .light))
                    .foregroundColor(.black)
                CustomTextField(text: $location)
                Text("Date")
                    .font(.system(size: 15, weight: .light))
                    .foregroundColor(.black)
                DatePicker(selection: $pickDate, in: ...Date(), displayedComponents: .date) {
                    Text("Select a date")
                        .foregroundColor(.gray)
                }
                .frame(width: UIScreen.main.bounds.width / 1.5)
                
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
                //didFollow ? viewModel.unfollow() : viewModel.follow()
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
}
