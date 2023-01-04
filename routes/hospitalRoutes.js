const express = require("express");
const connection = require("../conection");
const {
  getHospitalDetailsById,
} = require("../controllers/hospitalControllers");
const router = express.Router();

router.get("/hospitaldetailsById", getHospitalDetailsById);

module.exports = router;
