const app= require('./../src/loader/index');
const supertest = require("supertest");
const request = supertest("http://localhost:5555");
const userService = require("./../src/service/UserService");

let user = {
    login: "Zaxar12312321",
    password: "123321",
};

let userInfo = {
    avatar: null,
    firstName: "Zakhar321231",
    email: "Zakhar1233323213@mail.ru",
    phone: null,
};
userService.Register(user, userInfo);