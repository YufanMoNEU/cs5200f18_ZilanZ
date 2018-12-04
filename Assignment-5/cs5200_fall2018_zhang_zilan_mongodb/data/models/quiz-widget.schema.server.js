const mongoose = require('mongoose');
const questionModel = require('question.model.server');
const questionWidgetSchema = mongoose.Schema ({
    questions: [{
        type: Number,
        ref: 'QuestionModel'
    }]
}, { collection : 'question-widgets' });
module.exports = questionWidgetSchema;