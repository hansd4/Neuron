//
//  CourseCategory.swift
//  Neuron
//
//  Created by Hans de los Santos on 12/12/23.
//

import Foundation

struct CourseCategory: Identifiable {
    static var allCategories: [CourseCategory] = []
    
    let id = UUID()
    let name: String
    let courses: [String]
    
    init(name: String, courses: [String]) {
        self.name = name
        self.courses = courses
        CourseCategory.allCategories.append(self)
    }
    
    func update() {
        // TODO: write a function that converts stuff in Classes.swift to objects of type CourseCategory
    }
}
