const mongoose = require('mongoose');
const questionWidgetSchema = require('./quiz-widget.schema.server.schema.server');
const questionWidgetModel = mongoose.model('QuestionModel', questionWidgetSchema);
module.exports = questionWidgetModel;