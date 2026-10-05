struct Student {
    let name: String
    var score: Double 
}

let students = [
    Student(name: "Dane", score: 85),
    Student(name: "lida", score: 99),
    Student(name: "Hai", score: 69),
    Student(name: "jam", score: 47),
    Student(name: "Tyty", score: 34),
]

func calculateAverage(_ students: [Student]) -> Double? {
  guard !students.isEmpty else {
    return nil
  }

  let total = students.reduce(0) { $0 + $1.score }
  return total / Double(students.count)
}

// show pass and fail 
func showPassFail(_ students: [Student]) {
  for student in students {
    let result = student.score >= 50 ? "PASS" : "FAIL"
    print("\(student.name): \(student.score) - \(result)")
  }
}

// Show high score
func highestScore(_ student: [Student]) -> Student? {
    student.max {$0.score < $1.score}
}

// show  lowest score of student 
func lowestScore(_ student: [Student]) -> Student? {
    student.min {$0.score < $1.score}
}

// Passing Student 
func passingStudents(_ students: [Student]) -> [Student] {
    students.filter { $0.score >= 50 }
}

print("------------- All Studnets ---------------")


print("=== Student Results ===")
if let average = calculateAverage(students) {
  let rounded = (average * 100).rounded() / 100
  print("Class Average: \(rounded)")
} else {
  print("Class Average: No students")
}

print("\n ----- Pass and Fail -------")
showPassFail(students)

print("\n show student high score ")
if let highest = highestScore(students) {
    print("\nHighest: \(highest.name) - (highest.score)")
} else {
    print("\n Highest: No Student")
}

print("\n show student high score ")
if let lowest = lowestScore(students) {
    print("\n Lowest: \(lowest.name) - (lowset.score)")
} else {
    print("\n Lowest: No Student")
}

print("\n ---- passing student -----")
let passing = passingStudents(students)

if passing.isEmpty {
    print("No Student Passing")
} else {
    for student in passing {
        print("\(student.name): \(student.score)")
    }
}