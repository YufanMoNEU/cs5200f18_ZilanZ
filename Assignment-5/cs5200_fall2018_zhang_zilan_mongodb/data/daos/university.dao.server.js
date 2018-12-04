const studentModel = require('../models/student.model.server');
const questionModel = require('../models/question.model.server');
const answerModel = require('../models/answer.model.server');

truncateDatabase = () => {
    answerModel.deleteMany({}, (err) => {
        if (err) console.log(err);});
    questionModel.deleteMany({}, (err) => {
        if (err) console.log(err);});
    studentModel.deleteMany({}, (err) => {
        if (err) console.log(err);});
};
populateDatabase = () => {
    studentModel.create({
        _id: 123,
        firstName: "Alice",
        lastName: "Wonderland",
        username: "alice",
        password: "alice",
        gradYear: 2020,
        scholarship: 15000
    });
    studentModel.create({
        _id: 234,
        firstName: "Bob",
        lastName: "Hope",
        username: "bob",
        password: "bob",
        gradYear: 2021,
        scholarship: 12000
    });
    questionModel.create({
        _id: 321,
        question : "Is the following schema valid?",
        points : 10,
        questionType : "TRUE_FALSE",
        trueFalse : {isTrue: false}
    });
    questionModel.create({
        _id: 432,
        question : "DAO stands for Dynamic Access Object.",
        points : 10,
        questionType : "TRUE_FALSE",
        trueFalse : {isTrue: false}
    });
    questionModel.create({
        _id: 543,
        question : "What does JPA stand for?",
        points : 10,
        questionType : "MULTIPLE_CHOICE",
        multipleChoice : {
            choices: "Java Persistence API," +
                "Java Persisted Application," +
                "JavaScript Persistence API," +
                "JSON Persistent Associations",
            correct: 1}
    });
    questionModel.create({
        _id: 654,
        question : "What does ORM stand for?",
        points : 10,
        questionType : "MULTIPLE_CHOICE",
        multipleChoice : {
            choices: "Object Relational Model," +
                "Object Relative Markup," +
                "Object Reflexive Model," +
                "Object Relational Mapping",
            correct: 4}
    });
    answerModel.create({
        _id: 123,
        trueFalseAnswer: true,
        student: 123,
        question: 321
    });
    answerModel.create({
        _id: 234,
        trueFalseAnswer: false,
        student: 123,
        question: 432
    });
    answerModel.create({
        _id: 345,
        multipleChoiceAnswer: 1,
        student: 123,
        question: 543
    });
    answerModel.create({
        _id: 456,
        multipleChoiceAnswer: 2,
        student: 123,
        question: 654
    });
    answerModel.create({
        _id: 567,
        trueFalseAnswer: false,
        student: 234,
        question: 321
    });
    answerModel.create({
        _id: 678,
        trueFalseAnswer: true,
        student: 234,
        question: 432
    });
    answerModel.create({
        _id: 789,
        multipleChoiceAnswer: 3,
        student: 234,
        question: 543
    });
    answerModel.create({
        _id: 890,
        multipleChoiceAnswer: 4,
        student: 234,
        question: 654
    });
};
createStudent = student => {
    student.save((err) => {
        if (err) console.log(err);
    });
};
deleteStudent= studentId => {
    studentModel.deleteOne({_id: studentId}, (err) => {
        if (err) console.log(err);});
};
createQuestion = question =>{
    question.save((err) => {
        if (err) console.log(err);
    });
};
deleteQuestion = questionId => {
    questionModel.deleteOne({_id:questionId}, (err) => {
        if (err) console.log(err);});
};
answerQuestion = (studentId, questionId, answer) => {
    answer.student = studentId;
    answer.question = questionId;
    answer.save((err) => {
        if (err) console.log(err);
    });
};
deleteAnswer = answerId => {
    answerModel.deleteOne({_id:answerId}, (err) => {
        if (err) console.log(err);});
};

// finder methods
findAllStudents = () => studentModel.find();
findStudentById = studentId => studentModel.findById(studentId);
findAllQuestions = () => questionModel.find();
findQuestionById = questionId => questionModel.findById(questionId);
findAllAnswers = () => answerModel.find();
findAnswerById = answerId => answerModel.findById(answerId);
findAnswersByStudent = studentId => answerModel.find({student: studentId});
findAnswersByQuestion = questionId => answerModel.find({question: questionId});

//added functions
countStudents = () => {
    studentModel.countDocuments({}, (err, count) => {
        if (err) {
            console.log(err);
        } else {
            console.log(count);
        }
    });
};
countQuestions = () => {
    questionModel.countDocuments({}, (err, count) => {
        if (err) {
            console.log(err);
        } else {
            console.log(count);
        }
    });
};
countAnswers = () => {
    answerModel.countDocuments({}, (err, count) => {
        if (err) {
            console.log(err);
        } else {
            console.log(count);
        }
    });
};
countAnswersByStudent = studentId => {
    answerModel.countDocuments({student: studentId}, (err, count) => {
        if (err) {
            console.log(err);
        } else {
            console.log(count);
        }
    });
};

module.exports = {
    truncateDatabase,
    populateDatabase,
    createStudent,
    deleteStudent,
    createQuestion,
    deleteQuestion,
    answerQuestion,
    deleteAnswer,
    findAllStudents,
    findStudentById,
    findAllQuestions,
    findQuestionById,
    findAllAnswers,
    findAnswerById,
    findAnswersByStudent,
    findAnswersByQuestion,
    countStudents,
    countQuestions,
    countAnswers,
    countAnswersByStudent
};