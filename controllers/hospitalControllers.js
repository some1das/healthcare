const connection = require("../conection");

exports.getHospitalDetailsById = async (req, res) => {
  const hospitalId = req.query.id;
  const queryForHospitalDetails = `SELECT COUNT(patients.patient_id) AS patientCount,
  COUNT(distinct psychiatrists.psychiatrist_id) AS psyCount,
  hospitals.hospital_name 
  FROM patients LEFT JOIN psychiatrists
  ON patients.psychiatrist_id = psychiatrists.psychiatrist_id
  LEFT JOIN hospitals ON psychiatrists.hospital_id = hospitals.hospital_id
  WHERE psychiatrists.hospital_id = ?;`;

  const queryFroPsyDetailsBelongToTheHospital = `SELECT DISTINCT psychiatrists.psychiatrist_name,
   psychiatrists.psychiatrist_id,
   COUNT(patients.patient_id) from patients 
   LEFT JOIN psychiatrists
  ON patients.psychiatrist_id = psychiatrists.psychiatrist_id
  LEFT JOIN hospitals 
  ON psychiatrists.hospital_id = hospitals.hospital_id
  WHERE psychiatrists.hospital_id = ? GROUP BY(psychiatrists.psychiatrist_id)`;

  connection.query(
    queryForHospitalDetails,
    [hospitalId],
    (err, hospitalDetailsArray) => {
      if (!err) {
        connection.query(
          queryFroPsyDetailsBelongToTheHospital,
          [hospitalId],
          (err, psyDetailsArray) => {
            if (!err) {
              return res.status(200).json({
                hospitalName: hospitalDetailsArray[0].hospital_name,
                totalPsychiatristCount: hospitalDetailsArray[0].psyCount,
                totalPatientsCount: hospitalDetailsArray[0].hospital_name,
                psychiatristDetails: psyDetailsArray,
              });
            }
          }
        );
      } else {
        return res
          .status(400)
          .json({ error: true, message: "Something went wrong" });
      }
    }
  );
};
