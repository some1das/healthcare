const validator = require("validator");
const formidable = require("formidable");
const fs = require("fs");
const path = require("path");
const { isValidPhoneNumber, isFileValid } = require("../utils");
const connection = require("../conection");
const { tokenBelongsToSamePsy } = require("./authControllers");
function isEmpty(obj) {
  for (var prop in obj) {
    if (obj.hasOwnProperty(prop)) return false;
  }

  return true;
}
const uploadFolder = path.join(__dirname, "public", "files");
exports.registerPatientHandler = (req, res) => {
  let form = new formidable.IncomingForm();
  form.keepExtensions = true;
  form.parse(req, (err, fields, files) => {
    if (err) {
      return res.status(400).json({
        error: true,
        message: "problem with image",
      });
    }
    if (!tokenBelongsToSamePsy(fields.psy_email, req.auth.email)) {
      return res.status(403).json({ error: true, message: "token mismatched" });
    }
    //validation for fields
    if (!validator.isEmail(fields.patient_email)) {
      return res.status(400).json({ error: true, message: "invalid email" });
    }
    if (
      !validator.isStrongPassword(fields.patient_password, {
        minSymbols: 0,
      }) ||
      fields.patient_password.length > 15
    ) {
      return res
        .status(400)
        .json({ error: true, message: "your password is very week" });
    }
    if (fields.patient_address.length < 15) {
      return res.status(400).json({
        error: true,
        message: "Address is too short",
      });
    }
    if (!isValidPhoneNumber(fields.patient_phone_number)) {
      return res.status(400).json({
        error: true,
        message: "phone number is too short",
      });
    }

    let oldPath = files.image.filepath;
    let newPath = `./uploads/${
      fields.patient_phone_number + files.image.originalFilename
    }`;

    fs.rename(oldPath, newPath, (err) => {
      if (err) {
        return res.status(400).json({
          status: "Failure",
          msg: "Failed to upload file. " + err.message,
        });
      }
      const query =
        "INSERT INTO patients " +
        "(patient_name, patient_email, patient_address, patient_phone_number, patient_password, patient_photo, psychiatrist_id) " +
        "VALUES(?, ?, ?, ?, ?, ?, ?)";
      connection.query(
        query,
        [
          fields.patient_name,
          fields.patient_email,
          fields.patient_address,
          fields.patient_phone_number,
          fields.patient_password,
          "http://localhost:8000/static/" +
            fields.patient_phone_number +
            files.image.originalFilename,
          parseInt(fields.psychiatrist_id),
        ],
        (err, results) => {
          if (!err) {
            return res.status(200).json(results);
          } else {
            return res.status(400).json(err);
          }
        }
      );
    });
  });
};
