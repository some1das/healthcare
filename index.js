const express = require("express");
const app = express();
const port = 8000;
const connection = require("./conection");
const hospitalRoutes = require("./routes/hospitalRoutes");
const authRoutes = require("./routes/authRoutes");
const patientRoutes = require("./routes/patientRoutes");
app.use(express.urlencoded({ extended: true }));
app.use(express.json());
app.use("/static", express.static("uploads"));

app.use("/hospital", hospitalRoutes);
app.use("/auth", authRoutes);
app.use("/patient", patientRoutes);
app.listen(port, () => {
  console.log("server started successfully");
});
