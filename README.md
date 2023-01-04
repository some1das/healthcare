# healthcare

## List of Frameworks:

1. Express : Express makes the process of creating backend application painfree.

## List of Libraries:

1. Formadable: Formidable module is used for parsing form data, especially file uploads.
2. Bcrypt: Bcrypt is used for encrypting password.
3. Json Web Token(JWT): JWT is used for token based authentication. Mainly for authorizing psychiatrists.
4. mysql: This is _**npm mysql**_, which is driver for mysql in node.js.
5. Validator: Validator is JavaScript liabriry for validation of input data ie. password, email etc.

## API endpoints and their descriptions:
Link of postman collection https://www.postman.com/crimson-moon-547303/workspace/suman-das-lattice-innovations/collection/16535229-07cceb07-2034-420a-bdba-68b5b5a90284?action=share&creator=16535229
1. API for regestering a psychiatrist. <br> This is a POST request with endpoints _http://localhost:8000/auth/signup_ <br>
it contains field about psychiatrist.
example of the body of the API<br>
    ```json
    {
        "name":"Dr. Kartik Agarwal",
        "email":"kartik@aiims.in",
        "password":"420Suman",
        "hospital_id":4
    }
    ```
    Note: I kept same password for all the users, which is <b>420Suman</b><br>
2. API for login, This API is used by psychiatrists for login into the system. If he/she successfully complete the login process then he/she will get **Authorization token**. This token will be used as a means for authorization when psychartist register his/her patient.<br>
This is a POST request and the body contain following fields:
    ```json
    {
        "email":"diksheet@aiims.in",
        "password":"420Suman"
    }
    ```
3. API for registering patients.
It is a POST request.<br>
The end point look like: http://localhost:8000/patient/register<br>
It takes patients details, psychiatrist details(email, ID) and hospital ID.
We also need to specify the **Authorization header** and its value is "Bearer JWT_Token"<br>
example:<br>
`"Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImRpa3NoZWV0QGFpaW1zLmluIiwiaWF0IjoxNjcyODE1Njk3fQ.rTmoe0OorKTnbkzLErgZncUf-_NLaEGT5gH9l9ZqUuY"`

4. API for fetching hospital statistics:
This is a GET request.<br>
The end point look like: http://localhost:8000/hospital/hospitaldetailsById?id=3<br>
Here we have to spacify the value of id in the URL, which is query parameter. This indicates hospital_id. Using this **id** we will fetch the statistics of the hospital.<br>
The API response look like:<br>
    ```json
    {
        "hospitalName": "Indira Gandhi Institute of Medical Sciences (IGIMS)",
        "totalPsychiatristCount": 1,
        "totalPatientsCount": "Indira Gandhi Institute of Medical Sciences (IGIMS)",
        "psychiatristDetails": [
            {
                "psychiatrist_name": "Dr. Bikash Sahu",
                "psychiatrist_id": 11,
                "COUNT(patients.patient_id)": 5
            }
        ]
    }
    ```
## Details of MySQL server
This project have a <mark>.env</mark> file. Where database credentials are written.<br>
```
user: root
password:admin
```
Database Dump is attached in the **database** folder.

    

