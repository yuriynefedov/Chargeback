//
//  CategoryPicker.swift
//  CreateSubscription
//
//  Created by Yuri Nefedov on 01.12.2025.
//

import SwiftUI

struct CategoryPicker: View {
    
    @Binding var pickerVisible: Bool
    @Binding var category: Category?
    
    var body: some View {
        VStack(spacing: 20.0) {
            VStack(spacing: 12.0) {
                RoundedRectangle(cornerRadius: Constants.Layout.thumbCornerRadius)
                    .fill(Color(Constants.Colors.thumbFill.name))
                    .frame(width: 38.0, height: 6.0)
                ZStack {
                    Text("Service")
                        .font(.graphik(size: 18, weight: .medium))
                        .foregroundStyle(Color(Constants.Colors.textBlack.name))
                    Button {
                        self.pickerVisible = false
                    } label: {
                        Text("Done")
                            .font(.graphik(size: 18, weight: .medium))
                            .foregroundStyle(Color(Constants.Colors.toggleTint.name))
                    }
                    .frame(maxWidth: .infinity, alignment: .trailing)
                }
            }
            .padding(.horizontal, 16.0)
            .padding(.top, 6.0)
            ScrollView {
                VStack(spacing: .zero) {
                    ForEach(Category.allCases) { cat in
                        Button {
                            category = cat
                        } label: {
                            VStack(spacing: .zero) {
                                HStack(spacing: .zero) {
                                    Image(cat.icon)
                                    Text(cat.title)
                                        .font(.graphik(size: 16, weight: .regular))
                                        .foregroundStyle(Color(Constants.Colors.textBlack.name))
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .padding(.leading, 14.0)
                                    if cat == category {
                                        Image(Constants.IconName.icCheckmark.name)
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 18.0, height: 18.0)
                                    }
                                }
                                .frame(height: 60.0)
                                Divider()
                            }

                        }
                    }
                }
                .padding(.horizontal, 16.0)
            }
        }
        .background(Color.white)
    }
}
