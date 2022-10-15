@main
public struct TakeHome {
    
    /// Our Book Object
    ///
    /// This is the main book of the application (for demonstration purposes). It contains two editions each with 10 pages.
    public var example_book = Book(
        title: "Intro to Spanish Book 1",
        description: "This is an example book with fake pages",
        pages: [
            Page(title: "Page 1"),
            Page(title: "Page 2"),
            Page(title: "Page 3"),
            Page(title: "Page 4"),
            Page(title: "Page 5"),
            Page(title: "Page 6"),
            Page(title: "Page 7"),
            Page(title: "Page 8"),
            Page(title: "Page 9"),
            Page(title: "Page 10"),
        ]
    )
    

    
    /// An example teacher to use for the assessment
    public var example_teacher: Teacher = Teacher(name: "Sēnor Ben Cheng")
    
    
    /// An example list of students
    public var example_students: [Student] = [
        Student(name: "Abed Nadir"),
        Student(name: "Britta Perry"),
        Student(name: "Troy Barnes"),
        Student(name: "Pierce Hawthorne"),
        Student(name: "Jeff Winger"),
        Student(name: "Annie Edison"),
        Student(name: "Shirley Bennett"),
    ]
    
    // An example classroom
    public var example_class: Classroom = Classroom(book: Book(title: "Math", description: "Calculus 2", pages: [Page(title: "Page 1"), Page(title: "Page 2")]))
    
    /// This is where you will run your code to ensure that it works as desired. Upon pressing the play button in Xcode (or running the script in terminal), the code in this function will be executed.
    public static func main() {
        
        let th = TakeHome()
        
        // Add list of students to teacher's students
        //th.example_teacher.students = th.example_students
        
        // Add a teacher to the classroom
        th.example_class.teacher = th.example_teacher
        th.example_class.students = th.example_students
        
        // Populate Student Data
        th.generateFakeStudentData(.randomized)
//      th.generateFakeStudentData(.standardized) // Uncomment for non-random data
        
        th.challengeOne()
        th.challengeTwo()
        th.challengeThree()
    }
}

/// YOUR ANSWERS GO HERE !!
///
/// This is where you will write most of your code for the three challenges. Keep in mind that some of the challenges require you to make new files or change existing ones. If you have anything print to the terminal make sure it goes in here!!!
/// - Note: Feel free to delete any code in the functions below!
///
///
public extension TakeHome {

    func challengeOne() {
        
        //Represents student's percent score
        //Sorting needed
        
        var percentScore : Double;
        
        print(example_students[0].name + ": ");
        
        for i in 0...example_students[0].answers.count - 1 {
            
            percentScore = (example_students[0].answers[i].score * 100).rounded();
            
            print(example_book.pages[i].title + ": " + "\(Int((percentScore)))" + "%");
            
            
        }
    }
    
    func challengeTwo() {
        
        var student: String;
        var listOfStudents: String = "";
        
    
        for i in 0...example_class.students.count - 1 {
            
            student = example_class.students[i].name;
            
            if (i < example_class.students.count - 1){
                listOfStudents += student + ", ";
            } else {
                listOfStudents += student;
            }
        }
        
        print("Teacher: " + example_class.teacher.name)
        print("Students: " + "\(listOfStudents)")
        print("Book: \(example_class.classBook.title)")
        
    }
    
    func challengeThree() {
       // print all the average score from the class on a particular page
        
        //*Still need to sort for highest to lowest ... lowest to highest*
        
        
        example_class.calculateAveragesPerPage();
        
        example_class.calculateAveragesPerStudent(); 
        
      
        
    }
    
}

/// Helper Functions
///
/// This is where we have written some helper functions to set up your enviornment for you
public extension TakeHome {
    
    /// Generates some example data to use when writing your code
    ///
    /// This function goes through each student and generates some random answers to each page of the the two books
    func generateFakeStudentData(_ type: Answer.ScoreType) {
        for student in self.example_students {
            for page in self.example_book.pages {
                student.enterAnswer(for: page, type: type)
            }
        }
    }
}
