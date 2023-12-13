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
            "Living Environment",
            "AP Environmental Science",
            "AP Psychology",
            "AP Biology",
            "Anatomy",
            "Genetics",
            "PLTW Environmental Sustainability"
        ],
        "Chemistry": [
            "Regents Chemistry",
            "AP Chemistry",
            "Organic Chemistry",
            "Modern Instrumental Chemical Analysis",
            "Quantitative Analysis",
            "Introduction to Chemical Engineering",
            "Forensics"
        ],
        "Computer Science and Engineering": [
            "PLTW Digital Electronics",
            "AP Computer Science Principles",
            "AP Computer Science Principles Extended",
            "AP Computer Science A",
            "Fundamentals of IT Infrastructure",
            "Big Data",
            "Cyber Security",
            "Web Development",
            "Statics",
            "Strength of Materials",
            "Green Building Construction",
            "Digital Systems Design",
            "PLTW Engineering Design & Development"
        ],
        "English": [
            "English 9",
            "English 10",
            "English 11",
            "Science Fiction & Fantasy Literature",
            "AP Capstone Seminar",
            "AP Capstone Research",
            "AP English Language & Composition",
            "AP English Literature & Composition",
            "Life, Love & Death",
            "Creative Writing",
            "Drama",
            "Journalism",
            "Yearbook",
            "Film & Literature",
            "Mystery, Horror & the Supernatural",
            "Science Fiction & Fantasy",
            "The Survey"
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
            "Calculus",
            "AP Statistics",
            "AP Calculus AB",
            "AP Calculus BC",
            "Multivariable Calculus",
            "Linear Algebra",
            "Math Research",
        ],
        "Music": [
            "AP Music Theory",
            "Basic Strings",
            "Beginning Musicianship and Chorus",
            "Collaborative Piano/Choral Accompaniment",
            "Concert Band",
            "Concert Choir",
            "Intermediate Orchestra",
            "Jazz Band",
            "Junior Band",
            "Orchestra",
            "String Orchestra",
            "Symphonic Band",
            "Treble Choir",
            "Tech Chorale"
        ],
        "World Languages": [
            "German I",
            "German II",
            "German III",
            "Italian I",
            "Italian II",
            "Italian III",
            "AP Italian Language and Culture",
            "French I",
            "French II",
            "French III",
            "AP French Language and Culture",
            "Chinese I",
            "Chinese II",
            "Chinese III",
            "AP Chinese Language and Culture",
            "Spanish I",
            "Spanish II",
            "Spanish III",
            "Spanish IV",
            "AP Spanish Language and Culture",
            "AP Spanish Literature and Culture"
        ],
        "Social Studies": [
            "Pre-AP World History",
            "Regents Global History",
            "Regents United States History",
            "Participation in Government",
            "Economics",
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
            "Physical Anthropology"
        ],
        "Visual Arts": [
            "Adobe Digital Video Design",
            "Adobe Visual Design",
            "Architectural Drawing",
            "Digital Animation",
            "PLTW Civil Engineering & Architecture",
            "PLTW Design & Drafting for Production"
        ],
        "Aerospace": [
            "PLTW Principles of Engineering",
            "Flight School",
            "PLTW Aerospace Engineering",
            "PLTW Computer Integrated Manufacturing"
        ],
        "Architecture": [
            "Architectural Design/Modeling",
            "Autocad Certification",
            "Building Materials & Fabrication"
        ],
        "Civil Engineering": [
            "American Concrete Institute Certification",
            "Land Surveying Certification",
            "Autocad with Certiport Certification"
        ],
        "Finance": [
            "Principles of Accounting",
            "Finance & Investments",
            "Introduction to Business Law"
        ],
        "Industrial Design": [
            "Fundamentals of Product Design",
            "Methods of Fabrication",
            "Advanced Modeling",
            "Inventor Certification"
        ],
        "Law & Society": [
            "Criminal Law",
            "Constitutional Law",
            "Criminal Procedure",
            "Civil Law",
            "Forensic Criminology"
        ],
        "LIU PharmD": [
            "Pharmacy Organic Chemistry and Seminar"
        ],
        "Applied Mathematics": [
            "Graph Theory",
            "Number Theory",
            "Mathematical Computing"
        ],
        "Mechatronics & Robotics": [
            "Robotics Engineering",
            "Mechatronics with LabVIEW"
        ],
        "Media": [
            "Studio Art",
            "AP 2D Art and Design"
        ],
        "Social Science Research": [
            "Social Science Research"
        ],
        "Other": [
            "Health",
            "Student Leadership"
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
