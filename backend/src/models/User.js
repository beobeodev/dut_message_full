const mongoose = require('mongoose');
const userSchema = new mongoose.Schema({
    name: {type: String, required: true},
    username: {type: String, required: true, unique: true},
    password: {type: String, required: true, min: 8},
    email: {type: String, default: ''},
    avatar: {type: String, default: ''},
    phone: {type: String, required: true, unique: true},
    friends: [{type: mongoose.Types.ObjectId, ref: 'User'}],
    refreshToken: {type: [String], default: []},
}, {
    timestamps: true,
});


module.exports = mongoose.model('User', userSchema)