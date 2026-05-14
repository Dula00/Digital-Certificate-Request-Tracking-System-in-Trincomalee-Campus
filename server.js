const express = require('express');
const mysql = require('mysql2');
const cors = require('cors');
const bodyParser = require('body-parser');
const path = require('path');
const multer = require('multer');
const nodemailer = require('nodemailer');
const useragent = require('useragent'); 


const app = express();
app.use(express.json());
const PORT = 3000;
app.use(cors());


// --- 1. Multer Configuration (File extensions save) 
const storage = multer.diskStorage({
    destination: function (req, file, cb) {
        cb(null, 'uploads/') // must be upload folder
    },
    filename: function (req, file, cb) {
        // save the file name unique 
        const uniqueSuffix = Date.now() + '-' + Math.round(Math.random() * 1E9);
        cb(null, uniqueSuffix + '-' + file.originalname);
    }
});
const upload = multer({ storage: storage });

//  2. Middleware & Static Files 
app.use(cors());
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));

// 'uploads folder save public 
app.use('/uploads', express.static(path.join(__dirname, 'uploads')));
app.use(express.static(path.join(__dirname, '..')));

// 3. Database Connection 
const db = mysql.createPool({
    host: 'localhost',
    user: 'root',      
    password: '',      
    database: 'universitydetails_db', 
    waitForConnections: true,
    connectionLimit: 10,
    queueLimit: 0
});

db.getConnection((err, connection) => {
    if (err) console.error('❌ DB Connection Error:', err);
    else {
        console.log('✅ Connected to universitydetails_db.');
        connection.release();
    }
});




//  4. Authentication (Login) with Email Notification 
app.post('/api/login', (req, res) => {
    const { username, password, role } = req.body; 

    console.log(`Login attempt for user: ${username} with role: ${role}`);
    
    // User Email details 
    // This query has all dashboard fields
const query = 'SELECT id, full_name, registration_number, index_number, role, program, academic_year, email, department FROM users WHERE registration_number = ? AND password = ? AND role = ?';
    
    db.execute(query, [username, password, role], (err, results) => {
        if (err) return res.status(500).json({ success: false, message: "Database Error" });
        
        if (results.length > 0) {
            const user = results[0];
            const userEmail = user.email;

            // To get clearer details about the device.
            const agent = useragent.parse(req.headers['user-agent']);
            const deviceDetails = `${agent.os.toString()} | ${agent.toAgent()}`; // EX: Windows 10 | Chrome 124
            const loginTime = new Date().toLocaleString('en-GB', { timeZone: 'Asia/Colombo' });

            // Sent Email Configuration 
            const transporter = nodemailer.createTransport({
                service: 'gmail',
                auth: {
                    user: 'tceusldigitalcertificate@gmail.com',
                    pass: 'gujw qqqi eayo fylv' 
                }
            });

            const mailOptions = {
                from: '"TCEUSL Security" <tceusldigitalcertificate@gmail.com>',
                to: userEmail,
                subject: '🚨 Security Alert: New Login Detected',
                html: `
                    <div style="font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; max-width: 600px; margin: auto; border: 1px solid #e0e0e0; border-radius: 10px; overflow: hidden;">
                        <div style="background-color: #2c3e50; color: white; padding: 20px; text-align: center;">
                            <h2>Login Notification</h2>
                        </div>
                        <div style="padding: 20px; color: #333;">
                            <p>Hello <strong>${user.full_name}</strong>,</p>
                            <p>We detected a new login to your TCEUSL Portal account.</p>
                            <div style="background: #f9f9f9; padding: 15px; border-radius: 5px; border-left: 5px solid #3498db;">
                                <p style="margin: 5px 0;"><strong>Device:</strong> ${deviceDetails}</p>
                                <p style="margin: 5px 0;"><strong>Time:</strong> ${loginTime}</p>
                                <p style="margin: 5px 0;"><strong>Role:</strong> ${user.role.toUpperCase()}</p>
                            </div>
                            <p style="margin-top: 20px;">If this was you, you can safely ignore this email. If not, please reset your password immediately.</p>
                        </div>
                        <div style="background: #f1f1f1; padding: 15px; text-align: center; font-size: 12px; color: #777;">
                            © 2026 TCEUSL Digital Certificate System. All rights reserved.
                        </div>
                    </div>
                `
            };

            // While sending the email, a response is returned to the frontend without delaying the login process.
            transporter.sendMail(mailOptions, (mailErr, info) => {
                if (mailErr) console.error("❌ Login Email Error:", mailErr);
                else console.log(`✅ Security alert sent to: ${userEmail}`);
            });

            // log to student or staff Dashboard 
            res.json({ success: true, user: user });

        } else {
            res.status(401).json({ success: false, message: "Invalid credentials!" });
        }
    });
});


// --- 5. Submit Request API (Updated Fix for Semester) ---
app.post('/api/submit-request', upload.single('document'), (req, res) => {
    // Added semester_details to the data sent from the frontend.
    const { student_id, student_name, reg_number, certType, speed, semester_details } = req.body;
    
    // File name (If have)
    const fileName = req.file ? req.file.filename : null;

    // Must INSERT Query have semester_details column 
    const sqlRequest = `INSERT INTO requests 
        (student_id, student_name, reg_number, certificate_type, speed, semester_details, document_path, status) 
        VALUES (?, ?, ?, ?, ?, ?, ?, 'Pending')`;

    // The array must contain 7 elements because there are 7 values.
    db.execute(sqlRequest, [student_id, student_name, reg_number, certType, speed, semester_details, fileName], (err, result) => {
        if (err) {
            console.error(" SQL Insert Error:", err);
            return res.status(500).json({ success: false, message: err.message });
        }
        
        const requestId = result.insertId;
        const notifications = [
            [student_id, 'student', 'Request Submitted! ', `Your request for "${certType}" (#REQ-${requestId}) is pending.`],
            ['STAFF_GROUP', 'staff', 'New Request Received', `Student ${student_name} requested ${certType}.`],
            ['AR_GROUP', 'registrar', 'Action Required', `New request #REQ-${requestId} needs review.`]
        ];

        const sqlNotify = "INSERT INTO notifications (user_id, role, title, message) VALUES ?";
        db.query(sqlNotify, [notifications], (err) => {
            if (err) console.error(" Notification Error:", err);
        });

        res.json({ success: true, requestId: requestId });
    });
});

// --- Forgot Password: Send OTP ---
app.post('/api/auth/forgot-password', async (req, res) => {
    const { email } = req.body;

    if (!email) {
        return res.status(400).json({ success: false, message: "Email is required" });
    }

    // 1. Make the OTP six numbers
    const otp = Math.floor(100000 + Math.random() * 900000).toString();
    
    // 2.Expire to 15 Minute OTP 
    const expiryTime = new Date(Date.now() + 15 * 60000); 

    // 3. Database  Update (If Your table users)
    const updateSql = "UPDATE users SET reset_otp = ?, otp_expiry = ? WHERE email = ?";
    
    db.execute(updateSql, [otp, expiryTime, email], async (err, result) => {
        if (err) return res.status(500).json({ success: false, message: "Database error" });
        
        if (result.affectedRows === 0) {
            return res.status(404).json({ success: false, message: "Email not found" });
        }

        // 4. Make the sent Email (Nodemailer)
        const transporter = nodemailer.createTransport({
            service: 'gmail',
            auth: {
                user: 'tceusldigitalcertificate@gmail.com',
                pass: 'gujw qqqi eayo fylv' 
            }
        });

        const mailOptions = {
            from: 'tceusldigitalcertificate@gmail.com',
            to: email,
            subject: 'TCEUSL Portal - Password Reset OTP',
            html: `<h3>Your Password Reset OTP</h3>
                   <p>Please use the following OTP to reset your password. It is valid for 15 minutes.</p>
                   <h1 style="color: #3498db; letter-spacing: 5px;">${otp}</h1>`
        };

        try {
            await transporter.sendMail(mailOptions);
            console.log(`✅ OTP sent to ${email}`);
            res.json({ success: true, message: "OTP sent to your email" });
        } catch (mailErr) {
            console.error("❌ Email sending failed:", mailErr);
            res.status(500).json({ success: false, message: "Failed to send email" });
        }
    });
});

// --- Forgot Password: Verify OTP & Reset Password ---
app.post('/api/auth/reset-password', (req, res) => {
    const { email, otp, newPassword } = req.body;

    // 1. Checking whether the OTP is correct and has not expired
    const checkSql = "SELECT * FROM users WHERE email = ? AND reset_otp = ? AND otp_expiry > NOW()";
    
    db.execute(checkSql, [email, otp], (err, results) => {
        if (err) return res.status(500).json({ success: false, message: "Database error" });
        if (results.length === 0) {
            return res.status(400).json({ success: false, message: "Invalid or expired OTP!" });
        }

        // 2. If the OTP is correct, the password is updated.
        const updateSql = "UPDATE users SET password = ?, reset_otp = NULL, otp_expiry = NULL WHERE email = ?";
        db.execute(updateSql, [newPassword, email], (err2) => {
            if (err2) return res.status(500).json({ success: false, message: "Failed to update password" });
            res.json({ success: true, message: "Password reset successful!" });
        });
    });
});

//  6. Certificate Download & View Logic 

// List of certificates issued/approved for the student.
app.get('/api/student/issued-certificates/:id', (req, res) => {
    const studentId = req.params.id;
    // this take the'requests' table status='Approved' 
    const query = `SELECT id, certificate_type, submitted_date as updated_at, document_path as file_name 
                   FROM requests WHERE student_id = ? AND status = 'Approved'`;

    db.query(query, [studentId], (err, results) => {
        if (err) return res.status(500).json({ error: "Database error" });
        res.json(results);
    });
});


app.get('/api/download/:filename', (req, res) => {
    const fileName = req.params.filename;
    const filePath = path.join(__dirname, 'uploads', fileName);

    res.download(filePath, fileName, (err) => {
        if (err) {
            console.error("Download Error:", err);
            res.status(404).send("File not found.");
        }
    });
});

//   Other Essential APIs 

app.get('/api/dashboard-stats', (req, res) => {
    const studentId = req.query.studentId; 
    const sql = `SELECT COUNT(*) as total, 
                COUNT(CASE WHEN status LIKE '%Approved%' THEN 1 END) as approved,
                COUNT(CASE WHEN status LIKE '%Pending%' THEN 1 END) as pending,
                COUNT(CASE WHEN status LIKE '%Rejected%' THEN 1 END) as rejected
                FROM requests WHERE student_id = ?`;
    db.execute(sql, [studentId], (err, results) => {
        if (err) return res.status(500).json({ success: false });
        res.json(results[0]);
    });
});


app.get('/api/my-requests', (req, res) => {
    const studentId = req.query.studentId; 

    // Fetch student requests in descending order (latest first) (DESC) 
    const sql = "SELECT id, certificate_type, submitted_date, status FROM requests WHERE student_id = ? ORDER BY id DESC";

    db.execute(sql, [studentId], (err, results) => {
        if (err) {
            console.error("❌ My Requests DB Error:", err);
            return res.status(500).json({ success: false, message: "Database error" });
        }
        res.json(results); 
    });
});

app.get('/api/notifications', (req, res) => {
    const { userId } = req.query;
    const { role } = 'student';

    // When this is added, it shows in the terminal that a request has been received.
    console.log(`🔔 Notification request received for User ID: ${userId}`);

    const sql = "SELECT * FROM notifications WHERE user_id = ? ORDER BY created_at DESC";
    db.execute(sql, [userId], (err, results) => {
        if (err) {
            console.error("❌ Fetch Error:", err);
            return res.status(500).json({ success: false });
        }
        res.json(results);
    });
});

app.get('/api/track/:id', (req, res) => {
    const requestId = req.params.id;
    db.execute('SELECT id, status, certificate_type, submitted_date FROM requests WHERE id = ?', [requestId], (err, results) => {
        if (err || results.length === 0) return res.status(404).json({ message: "Not found" });
        const reqData = results[0];
        const steps = [
            { title: "Application Submitted", status: "completed", date: new Date(reqData.submitted_date).toLocaleDateString() },
            { title: "Processing", status: (reqData.status.includes('Pending') || reqData.status === 'Approved') ? "active" : "pending-step" },
            { title: "Ready", status: (reqData.status === 'Approved') ? "active" : "pending-step" }
        ];
        res.json({ id: reqData.id, status: reqData.status, steps: steps });
    });
});

// Create API to fetch pending requests for staff dashboard
app.get('/api/staff/requests', (req, res) => {
    // Database එකෙන් Pending status තියෙන ඔක්කොම දත්ත ගන්නවා
    const sql = "SELECT * FROM requests WHERE status = 'Pending' ORDER BY submitted_date DESC";

    db.query(sql, (err, results) => {
        if (err) {
            console.error("❌ Staff Requests Fetch Error:", err);
            return res.status(500).json({ success: false, message: "Database error" });
        }
        
        // Frontend එක බලාපොරොත්තු වන JSON format එකෙන් දත්ත යවනවා
        res.json(results); 
    });
});


// 8 Staff Action APIs (View Details & Update Status)


// --- 8.1. Modal එකට අදාළ Request එකේ විස්තර ගැනීම ---
app.get('/api/staff/request-details/:id', (req, res) => {
    const requestId = req.params.id;
    
    // requests සහ users tables එකතු කරලා (JOIN) විස්තර ගන්නවා
    const sql = `
        SELECT r.*, u.full_name, u.index_number 
        FROM requests r 
        LEFT JOIN users u ON r.reg_number = u.registration_number 
        WHERE r.id = ?
    `;

    db.query(sql, [requestId], (err, result) => {
        if (err) {
            console.error("❌ Database error (Fetch Details):", err);
            return res.status(500).json({ success: false, message: "Database error" });
        }
        
        if (result.length > 0) {
            res.json(result[0]); // දත්ත තියෙනවා නම් JSON විදිහට Frontend එකට යවනවා
        } else {
            res.status(404).json({ success: false, message: "Request not found" });
        }
    });
});

//  8.2. Multi-level Approval Logic (Updated) 
//  Staff එකෙන් Forward කරන්න Call කරන API එක 
app.put('/api/staff/update-status/:id', (req, res) => {
    const requestId = req.params.id;  // URL එකෙන් ID එක ගන්නවා
    const { status } = req.body;      // Body එකෙන් status එක ගන්නවා

    // Database එක update කරන query එක
    const sql = "UPDATE requests SET status = ? WHERE id = ?";

    db.query(sql, [status, requestId], (err, result) => {
        if (err) {
            console.error("❌ Status Update Error:", err);
            return res.status(500).json({ success: false, message: "Database update failed" });
        }

        if (result.affectedRows === 0) {
            return res.status(404).json({ success: false, message: "Request not found" });
        }

        console.log(`✅ Status updated for Request ${requestId} to ${status}`);
        res.json({ success: true, message: "Status updated successfully!" });
    });
});

//  8.3. එක් එක් නිලධාරියා (Authority) අනුව Status එක Update කිරීම 
// Multi-level Approval Update Route
app.post('/api/update-authority-status', (req, res) => {
    const { requestId, authority, status } = req.body;
    let columnName = "";

    // 1. Degree Certificate වලට අදාළ Columns
    if (authority === 'SubWarden') columnName = "sub_warden_status";
    else if (authority === 'Warden') columnName = "warden_status";
    else if (authority === 'Library') columnName = "library_status";
    else if (authority === 'StudentAffairs') columnName = "student_affairs_status";
    
    // 2. Semester Result Sheet වලට අදාළ Columns (ඔයාගේ DB එකේ නම් වලට අනුව)
    else if (authority === 'OfficeStaff') columnName = "staff_approval";
    else if (authority === 'HOD') columnName = "hod_approval";
    else if (authority === 'Dean') columnName = "dean_approval";
    else if (authority === 'Rector') columnName = "rector_approval"; 

    // Authority එක වැරදි නම් Error එකක් යවනවා
    if (!columnName) {
        return res.status(400).json({ success: false, message: "Invalid authority type" });
    }

    // Database Update කිරීම
    const sql = `UPDATE requests SET ${columnName} = ? WHERE id = ?`;
    db.execute(sql, [status, requestId], (err, result) => {
        if (err) {
            console.error("❌ DB Update Error:", err);
            return res.status(500).json({ success: false, message: "Database error occurred" });
        }
        
        console.log(`✅ ${columnName} updated to ${status} for Request ID: ${requestId}`);
        res.json({ success: true, message: "Status updated successfully" });
    });
});

// Dashboard Redirects
app.get('/', (req, res) => res.sendFile(path.join(__dirname, '..', 'home.html')));
app.get('/student-dashboard.html', (req, res) => res.sendFile(path.join(__dirname, '..', 'student-dashboard.html')));
app.get('/staff-dashboard.html', (req, res) => res.sendFile(path.join(__dirname, '..', 'staff-dashboard.html')));

// --- AR Dashboard එකට 'Forwarded to AR' වූ Requests ලබා දෙන API එක ---
app.get('/api/registrar/new-requests', (req, res) => {
    // Database එකෙන් status එක 'Forwarded to AR' වන දත්ත පමණක් ලබා ගනී
    const sql = "SELECT id, reg_number as index_no, certificate_type, submitted_date FROM requests WHERE status = 'Forwarded to AR' ORDER BY submitted_date DESC";

    db.query(sql, (err, results) => {
        if (err) {
            console.error("❌ AR Requests Fetch Error:", err);
            return res.status(500).json({ success: false, message: "Database error" });
        }
        res.json(results); // AR Dashboard එකට දත්ත යවයි
    });
});

// Verification API එක
app.get('/api/verify/:studentId', (req, res) => {
    const studentId = req.params.studentId;

    // SQL Query එක - ආරක්ෂාව සඳහා '?' පාවිච්චි කරන්න (SQL Injection වැළැක්වීමට)
    const sqlQuery = "SELECT fullName, degreeName, class, graduatedYear FROM students WHERE indexNo = ?";

    db.query(sqlQuery, [studentId], (err, result) => {
        if (err) {
            return res.status(500).json({ success: false, message: "Database Error" });
        }

        if (result.length > 0) {
            // ශිෂ්‍යයා සිටී නම් දත්ත යවන්න
            res.json({
                success: true,
                data: result[0]
            });
        } else {
            // ශිෂ්‍යයා නැත්නම්
            res.status(404).json({ success: false, message: "Certificate Not Found" });
        }
    });
});

app.get('/api/registrar/request-details/:id', (req, res) => {
    const id = req.params.id;
    const sql = "SELECT student_name, reg_number, certificate_type, submitted_date FROM requests WHERE id = ?";
    
    db.query(sql, [id], (err, result) => {
        if (err) {
            console.error("❌ DB Error:", err);
            return res.status(500).json({ error: err.message });
        }
        if (result.length === 0) {
            return res.status(404).json({ error: "Data not found" });
        }
        res.json(result[0]);
    });
});

app.post('/api/chatbot/ask', (req, res) => {
    const userQuery = req.body.query ? req.body.query.toLowerCase() : "";

    // 1. Today's Summary
    if (userQuery.includes("today") || userQuery.includes("summary")) {
        db.query("SELECT COUNT(*) as total FROM requests WHERE DATE(submitted_date) = CURDATE()", (err, result) => {
            if (err) return res.json({ reply: "Database error." });
            res.json({ reply: `Today you have received ${result[0].total} new requests.` });
        });
    } 

    // 2. Admin වෙත යොමු කළ ඉතිහාසය (Forwarded History)
    else if (userQuery.includes("forwarded") || userQuery.includes("history")) {
        const sql = "SELECT reg_number, certificate_type FROM requests WHERE status = 'Forwarded to Admin' OR status = 'Approved'";
        db.query(sql, (err, results) => {
            if (err) return res.json({ reply: "Database error." });
            if (results.length === 0) return res.json({ reply: "No forwarded requests found." });
            let list = results.map(r => `${r.reg_number}`).join(", ");
            res.json({ reply: `Forwarded requests: ${list}.` });
        });
    }

    // 3. Registration Number එක සෙවීම 
    else if (userQuery.includes("/") || /\d+/.test(userQuery)) {
        // වාක්‍යය ඇතුළත ඇති අංක/අකුරු කොටස (EUSL/TC/IS/2022/MS/08) වෙන් කරගන්නා සරල ක්‍රමය
        const match = userQuery.match(/[a-z0-9\/]+/gi);
        let regNo = match ? match.reduce((a, b) => a.length > b.length ? a : b) : "";

        //  වැදගත්: '=' වෙනුවට 'LIKE' සහ '%' පාවිච්චි කිරීම
        const sql = "SELECT status, reg_number FROM requests WHERE reg_number LIKE ?";
        db.query(sql, [`%${regNo}%`], (err, result) => {
            if (err || result.length === 0) {
                return res.json({ reply: `I couldn't find any record for Index ${regNo}. Please check again.` });
            }
            // හමුවූ සම්පූර්ණ අංකය සහ එහි status එක පෙන්වයි
         
res.json({ reply: `The status for Registration Number ${result[0].reg_number} is currently: ${result[0].status}.` });
        });
    }
    else {
        res.json({ reply: "I can help with summary, history, or check student status." });
    }
});
app.get('/', (req, res) => res.sendFile(path.join(__dirname, '..', 'home.html')));
app.listen(PORT, () => console.log(`🚀 Server running on http://localhost:${PORT}`));
