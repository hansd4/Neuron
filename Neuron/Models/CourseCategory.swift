//
//  CourseCategory.swift
//  Neuron
//
//  Created by Hans de los Santos on 12/12/23.
//

import Foundation

struct CourseCategory {
    static var allCategories: [CourseCategory] = []
    
    let name: String
    let courses: [String]
    
    init(name: String, courses: [String]) {
        self.name = name
        self.courses = courses
        allCategories.append(self)
    }
}
