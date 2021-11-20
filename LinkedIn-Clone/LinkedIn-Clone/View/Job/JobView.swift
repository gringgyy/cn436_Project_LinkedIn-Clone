//
//  JobView.swift
//  LinkedIn-Clone
//
//  Created by Kulnis Chattratitiphan on 10/11/2564 BE.
//

import SwiftUI

struct JobView: View {
    @ObservedObject var viewModel = JobViewModel()
    
    var body: some View {
        ScrollView {
            AddJobButtonView(viewModel: viewModel)
                .padding(.top, 10)

            LazyVStack(alignment: .leading) {
                ForEach(viewModel.jobs) { job in
                    JobCellView(viewModel: JobCellViewModel(job: job))
                        .padding(.top)
                }
            }
            .padding(.leading, 20)
        }
    }
}

struct JobView_Previews: PreviewProvider {
    static var previews: some View {
        JobView()
    }
}
