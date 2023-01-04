exports.isValidPhoneNumber = (number) => {
  //length should between 11 to 12
  if (!(number.length >= 11 && number.length <= 12)) {
    return false;
  }
  //check all are digits or not
  for (let i = 0; i < number.length; i++) {
    if (!(number[i] >= "0" && number[i] <= "9")) {
      return false;
    }
  }
  return true;
};
exports.isFileValid = (file) => {
  const type = file.mimetype.split("/").pop();
  const validTypes = ["jpg", "jpeg", "png", "pdf"];
  if (validTypes.indexOf(type) === -1) {
    return false;
  }
  return true;
};
