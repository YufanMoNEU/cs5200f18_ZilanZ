require('./db')();
var universityDao = require('./daos/university.dao.server');

var truncateDatabase = function () {
    universityDao.truncateDatabase();
};
var populateDatabase = function () {
    universityDao.populateDatabase();
};
var testStudentsInitialCount = function () {
    universityDao.countStudents();
};
var testQuestionsInitialCount = function () {
    universityDao.countQuestions();
};
var testAnswersInitialCount = function () {
    universityDao.countAnswers();
};
var testDeleteAnswer = function () {
    universityDao.deleteAnswer(890);
    universityDao.countAnswers();
    universityDao.countAnswersByStudent(234);
};
var testDeleteQuestion = function () {
    universityDao.deleteQuestion(321);
    universityDao.countQuestions();
};
var testDeleteStudent = function () {
    universityDao.deleteStudent(234);
    universityDao.countStudents();
};
var testFinder = function() {
    universityDao.findAllStudents()
        .then(students => {
            console.log("\nfindAllStudents: ");
            console.log(students);
        });

    universityDao.findStudentById(123)
        .then(student => {
            console.log("\nfindStudentById: ");
            console.log(student);
        });

    universityDao.findAllQuestions()
        .then(questions => {
            console.log("\nfindAllQuestions: ");
            console.log(questions);
        });

    universityDao.findQuestionById(321)
        .then(question => {
            console.log("\nfindQuestionById: ");
            console.log(question);
        });

    universityDao.findAllAnswers()
        .then(answers => {
            console.log("\nfindAllAnswers: ");
            console.log(answers);
        });

    universityDao.findAnswerById(123)
        .then(answer => {
            console.log("\nfindAnswerById: ");
            console.log(answer);
        });

    universityDao.findAnswersByStudent(123)
        .then(answers => {
            console.log("\nfindAnswersByStudent: ");
            console.log(answers);
        });

    universityDao.findAnswersByQuestion(321)
        .then(answers => {
            console.log("\nfindAnswersByQuestion: ");
            console.log(answers);
        });
};

truncateDatabase();
// populateDatabase();
// testStudentsInitialCount();
// testQuestionsInitialCount();
// testAnswersInitialCount();
// testDeleteAnswer();
// testDeleteQuestion();
// testDeleteStudent();

// testFinder();
console.log('done');