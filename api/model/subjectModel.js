const { ObjectID } = require("mongodb");
let mongoose = require("mongoose");
var aggregatePaginate = require("mongoose-aggregate-paginate-v2");
let Schema = mongoose.Schema;

let SubjectSchema = Schema({
  name: String,
  idTeacher: ObjectID
}, {
  versionKey: false
});
SubjectSchema.plugin(aggregatePaginate);
// C'est à travers ce modèle Mongoose qu'on pourra faire le CRUD
module.exports = mongoose.model("Subject", SubjectSchema);
