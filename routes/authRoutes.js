/*
    this route is mainly for psychiatrists, because system need to authenticte
    them before making any patients entry in the system
*/
const express = require("express");
const {
  signupController,
  logInController,
} = require("../controllers/authControllers");
const router = express.Router();

router.post("/signup", signupController);
router.post("/login", logInController);

module.exports = router;
