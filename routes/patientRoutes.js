const express = require("express");
const {
  isAuthenticated,
  isSignedIn,
} = require("../controllers/authControllers");

const { registerPatientHandler } = require("../controllers/patientController");
const router = express.Router();

router.post("/register", isAuthenticated, registerPatientHandler);

module.exports = router;
