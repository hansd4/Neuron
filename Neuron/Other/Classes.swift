//
//  Classes.swift
//  Neuron
//
//  Created by Hans de los Santos on 12/12/23.
//
//  TEMP CLASS; ALL CLASSES NOW STORED IN FIREBASE

import Foundation
import FirebaseFirestore

struct Classes {
    static let CLASSES = [
        "Biology": [
            "Regents Living Environment",
            "AP Environmental Science",
            "AP Psychology",
            "AP Biology",
            "Anatomy & Physiology",
            "Genetics"
        ],
        "Chemistry": [
            "Regents Chemistry",
            "AP Chemistry",
            "Organic Chemistry",
            "Modern Instrumental Chemical Analysis",
            "Quantitative Analysis",
            "Introduction to Chemical Engineering"
        ],
        "Physics": [
            "Regents Physics",
            "Astronomy",
            "AP Physics I",
            "AP Physics II",
            "AP Physics C: Mechanics",
            "AP Physics C: Electricity and Magnetism",
            "Modern Physics"
        ],
        "Mathematics": [
            "Algebra I",
            "Geometry",
            "Algebra II",
            "Precalculus",
            "AP Statistics",
            "AP Calculus AB",
            "AP Calculus BC",
            "Multivariable Calculus",
            "Linear Algebra",
            "Computational Modeling",
            "Advanced Euclidean Geometry",
            "Combinatorics",
            "Math Research",
            "Freshman Math Team",
            "JV Math Team",
            "Varsity Math Team"
        ],
        "Project Lead The Way": [
            "Aerospace Engineering",
            "Computer Integrated Manufacturing",
            "Principles of Engineering",
            "Digital Electronics",
            "Civil Engineering & Architecture"
        ],
        "Computer Science": [
            "AP Computer Science Principles",
            "AP Computer Science A",
            "Web Development",
            "Oracle I & II",
            "Oracle III & IV",
        ],
        "Engineering": [
            "Structural Design / Statics",
            "Green Building Construction",
            "Digital Systems Design",
            "Mechatronics",
            "Robotics Engineering"
        ],
        "The Arts": [
            "PLTW Design & Drafting for Production",
            "Autocad",
            "Architectural Drawing I & II",
            "Introduction to Fabrication",
            "Advanced Digital Modeling",
            "Product Design",
            "Adobe Visual Design & Print",
            "Adobe Digital Video",
            "MAYA Digital Animation",
            "Stageworks: Set Design",
            "Stageworks: Sound Systems",
            "Stageworks: Lighting Design",
            "Intermediate Band",
            "Advanced Band",
            "Jazz Band",
            "Concert Band",
            "Basic Strings",
            "String Orchestra",
            "Intermediate Orchestra",
            "Orchestra",
            "Intermediate Chorus",
            "Girls Chorus",
            "Mixed Chorus",
            "Chamber Chorus"
        ],
        "English Language Arts": [
            "English 9",
            "English 10",
            "English 11",
            "Life, Love & Death",
            "Gothic Literature",
            "Short Stories",
            "Science Fiction & Fantasy Literature",
            "AP English Capstone Seminar",
            "AP English Capstone Research",
            "AP English Language & Composition",
            "AP English Literature",
            "Creative Writing",
            "Drama",
            "Journalism",
            "Yearbook"
        ],
        "Social Studies": [
            "Pre-AP World History",
            "Regents Global History",
            "Regents United States History",
            "Regents United States Government",
            "Regents Economics",
            "AP Human Geography",
            "AP World History",
            "AP European History",
            "AP United States History",
            "AP United States Government",
            "AP Comparative Government",
            "AP Macroeconomics",
            "AP Microeconomics",
            "Sociology",
            "Cultural Anthropology",
            "Physical Anthropology",
            "Criminal Law",
            "Criminal Procedure",
            "Civil Law",
            "Constitutional Law",
            "Legal Ethics"
        ],
        "World Languages": [
            "Italian I",
            "Italian II",
            "Italian III",
            "AP Italian",
            "French I",
            "French II",
            "French III",
            "AP French Language",
            "Mandarin I",
            "Mandarin II",
            "Mandarin III",
            "AP Mandarin",
            "Spanish I",
            "Spanish II",
            "Spanish III",
            "AP Spanish Language"
        ],
        "Health & Physical Education": [
            "9th Grade Physical Education",
            "10th Grade Physical Education",
            "11th Grade Physical Education",
            "Fencing",
            "Yoga",
            "Weight Training",
            "Beginner Swim",
            "Advanced Swim: Lifeguard Cert.",
            "Independent PE (Non-PSAL Sports)",
            "Judo",
            "Capoeira",
            "Health"
        ],
        "Other": [
            "Weston Scholars Research I & II",
            "Weston Scholars Research III & IV",
            "Weston Scholars Reasearch: Capstone"
        ]
    ]
    
    static func sendToFirebase() {
        let db = Firestore.firestore()
        let collectionRef = db.collection("classes")
        
        for category in CLASSES.keys {
            do {
                var classes: [Course] = []
                for course in CLASSES[category]! {
                    classes.append(Course(name: course, id: UUID().uuidString))
                }
                try collectionRef.addDocument(from: ClassCategory(name: category, id: UUID().uuidString, classes: classes))
            }
            catch {
                print(error)
            }
        }
    }
}
