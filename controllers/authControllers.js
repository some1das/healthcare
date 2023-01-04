const validator = require("validator");
const bcrypt = require("bcrypt");
const connection = require("../conection");
const jwt = require("jsonwebtoken");

function isEmpty(obj) {
  for (var prop in obj) {
    if (obj.hasOwnProperty(prop)) return false;
  }

  return true;
}

exports.signupController = (req, res) => {
  const psychiatristsInfo = req.body;

  if (isEmpty(psychiatristsInfo)) {
    return res.status(400).json({ error: true, message: "Empty body" });
  }
  if (!validator.isEmail(psychiatristsInfo.email)) {
    return res.status(400).json({ error: true, message: "Email is not valid" });
  }
  if (
    !validator.isStrongPassword(psychiatristsInfo.password, {
      minSymbols: 0,
    }) ||
    psychiatristsInfo.password.length > 15
  ) {
    return res.status(400).json({
      error: true,
      message:
        "must contain one upper character, one lower character and a number. Max length 15 and min length 8",
    });
  }

  const saltRounds = 10;
  const plainPassword = psychiatristsInfo.password;
  bcrypt.hash(plainPassword, saltRounds, (err, hashedPassword) => {
    // return res.status(200).json({ password: hashedPassword });
    const query =
      "INSERT INTO psychiatrists (psychiatrist_email, psychiatrist_name, password, hospital_id) VALUES(?, ?, ?, ?)";
    connection.query(
      query,
      [
        psychiatristsInfo.email,
        psychiatristsInfo.name,
        hashedPassword,
        psychiatristsInfo.hospital_id,
      ],
      (err, results) => {
        if (!err) {
          return res
            .status(200)
            .json({ message: "Successfully signed up", results });
        } else {
          return res.status(500).json(err);
        }
      }
    );
  });
};

exports.logInController = (req, res) => {
  const psy_info = req.body;
  console.log(psy_info);
  if (isEmpty(psy_info)) {
    return res
      .status(400)
      .json({ error: true, message: "Please enter some data" });
  }
  connection.query(
    "SELECT password from psychiatrists where psychiatrist_email = ?",
    [psy_info.email],
    (err, results) => {
      if (!err) {
        // return res.status(200).json(results);
        bcrypt.compare(
          psy_info.password,
          results[0].password,
          (err, isPasswordMatched) => {
            if (!err && isPasswordMatched) {
              const token = jwt.sign(
                { email: psy_info.email },
                "klbwehdvlwekfhih8934y5olenflkjbewkjfbk;nedfjklewbhlfbw;qkjefh;w"
              );
              return res.status(200).json({
                token,
                error: null,
              });
            } else {
              return res
                .status(404)
                .json({ error: true, message: "Invalid Cradentials" });
            }
          }
        );
      } else {
        return res
          .status(400)
          .json({ error: true, message: "something went wrong" });
      }
    }
  );
};

//middleware to check user is authenticated or not
exports.isAuthenticated = async (req, res, next) => {
  const authHeader = await req.headers.authorization;
  if (authHeader == undefined) {
    return res.status(400).json({ error: true, message: "No auth hader" });
  }
  //here extract the token
  const token = await authHeader.split(" ")[1].toString();
  // console.log(token)
  jwt.verify(
    token,
    "klbwehdvlwekfhih8934y5olenflkjbewkjfbk;nedfjklewbhlfbw;qkjefh;w",
    function (err, decoded) {
      if (err) {
        return res.status(500).json({
          error: "access denied1",
        });
      }
      // console.log(decoded) // bar
      req.auth = decoded;

      next();
    }
  );
};
exports.tokenBelongsToSamePsy = (mailFromJwt, mailFromForm) => {
  return mailFromForm == mailFromJwt;
};
