// Logout function එක
function logoutUser() {
    // 1. Confirm එකක් අහනවා (Optional - ඕනේ නැත්නම් මේ line එක අයින් කරන්න)
    if (confirm("Are you sure you want to logout?")) {
        
        // 2. LocalStorage එකේ තියෙන ඔක්කොම දත්ත මකනවා
        localStorage.clear(); 
        
        // 3. යූසර්ව Home Page එකට යවනවා
        // මෙතන 'home.html' වෙනුවට ඔයාගේ මුල් පිටුවේ නම දෙන්න (index.html ද දන්නේ නැහැනේ)
        window.location.href = 'home.html'; 
    }
}

document.addEventListener("DOMContentLoaded", () => {

// --- 14. Notifications ලබාගැනීම සහ පෙන්වීම ---
    window.loadNotifications = async function() {
        const userData = localStorage.getItem('loggedInUser');
        if (!userData) return;
        const user = JSON.parse(userData);

        const container = document.getElementById('dynamic-notification-list');
        if (!container) return;

        try {
            // Backend එකෙන් notifications ගන්නවා
            const response = await fetch(`http://localhost:3000/api/notifications?userId=${user.id}`);
            const notifications = await response.json();

            container.innerHTML = ''; // කලින් තිබුණු දේවල් අයින් කරනවා

            if (notifications.length === 0) {
                container.innerHTML = '<p style="text-align: center; padding: 40px; color: #666;">No notifications yet.</p>';
                return;
            }
            // student-script.js ඇතුළත Loop එක මෙහෙම වෙන්න ඕනේ
            notifications.forEach(noti => {
                const isUnread = noti.is_read === 0;
                const statusClass = isUnread ? 'unread-status' : 'read-status';

                // Notification එකේ Card එක හදනවා
                container.innerHTML += `
        <div class="card notification-item ${statusClass}" 
             onclick="markAsReadSingle(${noti.id})" 
             style="margin-bottom: 15px; border-left: 5px solid ${isUnread ? '#3498db' : '#eee'}; cursor: pointer;">
            <div style="display: flex; gap: 15px; padding: 10px;">
                <div style="background: ${isUnread ? '#e1f0ff' : '#f5f5f5'}; padding: 12px; border-radius: 50%;">
                    <i class="fas ${noti.title && noti.title.includes('Request') ? 'fa-file-alt' : 'fa-bell'}" 
                       style="color: ${isUnread ? '#3498db' : '#999'};"></i>
                </div>
                <div style="flex: 1;">
                    <div style="display: flex; justify-content: space-between;">
                        <h4 style="margin: 0; font-size: 1rem;">${noti.title || 'System Alert'}</h4>
                        <small style="color: #888;">${new Date(noti.created_at).toLocaleString()}</small>
                    </div>
                    <p style="margin: 5px 0 0; color: #555; font-size: 0.9rem;">${noti.message}</p>
                </div>
            </div>
        </div>`;
            });

        } catch (error) {
            console.error("Error loading notifications:", error);
        }
    };

    // "Mark all as read" බටන් එක සඳහා
    const markReadBtn = document.getElementById('markAllReadBtn');
    if (markReadBtn) {
        markReadBtn.onclick = async () => {
            const userData = localStorage.getItem('loggedInUser');
            const user = JSON.parse(userData);

            try {
                const response =await fetch(`http://localhost:3000/api/notifications/mark-all-read?userId=${user.id}`); 
                 
                const result = await response.json();
                if (result.success) {
                    console.log("All marked as read!");
                     // 2. Update එක සාර්ථක නම් විතරක් පේජ් එකේ තියෙන පණිවිඩ ටික refresh කරනවා
                    window.loadNotifications(); 
                    alert("All notifications marked as read!");
            }
            } catch (err) {
                console.error("Failed to mark as read", err);
            }
        };
    }
            // තනි Notification එකක් Read කියලා mark කරන්න
window.markAsReadSingle = async function(notificationId) {
    try {
        const response = await fetch(`http://localhost:3000/api/notifications/mark-read/${notificationId}`, {
            method: 'POST' // අපි මේක POST එකක් විදිහට හදමු
        });

        const result = await response.json();
        if (result.success) {
            console.log(`Notification ${notificationId} marked as read`);
            // පේජ් එකේ පෙනුම Update කරන්න ආපහු notifications load කරනවා
            window.loadNotifications(); 
        }
    } catch (err) {
        console.error("Single mark as read failed:", err);
    }
};
        



   async function loadCertificates() {
        const userData = localStorage.getItem('loggedInUser');
        if (!userData) return;
        const user = JSON.parse(userData);

        try {
            // API එකෙන් data ටික ගන්නවා
            const response = await fetch(`http://localhost:3000/api/certificates/${user.registration_number}`);
            const certs = await response.json();

            if (certs && certs.length > 0) {
             // Degree සර්ටිෆිකට් එක හොයාගන්නවා
                const degreeCert = certs.find(c => c.type === 'Degree' || c.certificate_type === 'Degree');
               
                if (degreeCert) {
                    // 1. Preview (අපේ අලුත් HTML එක ඕපන් වෙන්න)
                    const previewBtn = document.querySelector('.preview-btn');

                    if (previewBtn) {
                        previewBtn.onclick = (e) => {
                            e.preventDefault();
                            // මෙතන user.full_name එක කෙලින්ම යවනවා
                            const studentName = user.full_name || "Student";
                            window.open(`view-certificate.html?name=${encodeURIComponent(studentName)}`, '_blank');
                        };

                    }

                    // 2. Download (කෙලින්ම සර්වර් එකේ PDF එක download වෙන්න)
                    const downloadBtn = document.querySelector('.download-btn');
                    if (downloadBtn) {
                        downloadBtn.href = `http://localhost:3000/${degreeCert.file_path}`;
                        downloadBtn.setAttribute('download', 'Degree_Certificate.pdf');
                    }
                }
            }
        } catch (error) {
            console.error("Error loading certificates:", error);
        }
    }

// පේජ් එක ලෝඩ් වෙද්දී රන් කරන්න
document.addEventListener('DOMContentLoaded', loadCertificates);
  // --- 0. Dashboard Stats, Table & Profile Info ලබාගැනීම ---

    window.loadDashboardData = async function() {
        const userData = localStorage.getItem('loggedInUser');
        if (!userData) {
            window.location.href = 'login.html';
            return;
        }
        const user = JSON.parse(userData);
        
        const setVal = (id, val) => { if(document.getElementById(id)) document.getElementById(id).value = val || ''; };
        setVal('fullName', user.full_name);
        setVal('regNumber', user.registration_number);
        setVal('program', user.program);
        // Variable නම සහ ID එක පටලවා නොගන්න මෙහෙම කරන්න
        const currentAcademicYear = user.academic_year || ''; 
        if(document.getElementById('studentAcademicYear')) {
        document.getElementById('studentAcademicYear').value = currentAcademicYear;
       }
        setVal('email', user.email);
        setVal('indexNumber', user.index_number);
        if(document.getElementById('department')) document.getElementById('department').value = user.department || '';

        // Header එකේ නම සහ Program එක වෙනස් කිරීම
       if(document.getElementById('header_full_name')) document.getElementById('header_full_name').innerText = user.full_name || 'Student Name';
       if(document.getElementById('header_program')) document.getElementById('header_program').innerText = user.program || 'Program Name';


        const welcomeSpan = document.getElementById('welcome_user_name');
        if (welcomeSpan) {
    // සම්පූර්ණ නමෙන් අවසාන කෑල්ල විතරක් ගන්න (උදා: Nilushika)

          const firstName = (user.full_name) ? user.full_name.split(' ').pop() : 'Student';
           welcomeSpan.innerText = firstName;

}
        try {
            // Stats ලබාගැනීම
            const statsRes = await fetch(`http://localhost:3000/api/dashboard-stats?studentId=${user.id}`);
            const stats = await statsRes.json();
            
            const setStat = (id, val) => { if(document.getElementById(id)) document.getElementById(id).innerText = val || 0; };
            setStat('total-val', stats.total);
            setStat('approved-val', stats.approved);
            setStat('pending-val', stats.pending);
            setStat('rejected-val', stats.rejected);

            // Table එක සඳහා Requests ලබාගැනීම
            const listRes = await fetch(`http://localhost:3000/api/my-requests?studentId=${user.id}`);
            const requests = await listRes.json();

            // HTML එකේ id="request-table-body" ලෙස ඇති tbody එක තෝරාගැනීම
            const tableBody = document.getElementById('request-table-body');

            if (tableBody) {
                tableBody.innerHTML = ''; // කලින් static තිබුණු දත්ත මකා දැමීම

                if (requests.length === 0) {
                    tableBody.innerHTML = '<tr><td colspan="6" style="text-align:center; padding: 20px;">No requests found.</td></tr>';
                } else {
                    requests.forEach(req => {
                           const subDate = new Date(req.submitted_date);
                    
                    // දවස් 7කින් පසු Expected Date එක හැදීම
                    const expDate = new Date(subDate);
                    expDate.setDate(subDate.getDate() + 7);

                        const statusClass = req.status.toLowerCase().replace(/\s+/g, '-');
                        
                        tableBody.innerHTML += `
                        <tr>
                            <td>#REQ-${req.id}</td>
                            <td>${req.certificate_type}</td>
                            <td>${subDate.toLocaleDateString()}</td>
                            <td>${expDate.toLocaleDateString()}</td>
                            <td><span class="status-badge ${statusClass}">${req.status}</span></td>
                            <td><button class="view-btn" onclick="alert('Details for REQ-${req.id}')">View Details</button></td>
                       </tr>`;
                });
            }
        }
    } catch (error) {
            console.error("Error loading dashboard data:", error);
       }
    };
    document.addEventListener('DOMContentLoaded', () => {
         window.loadDashboardData();
    });

// --- Certificate Form එක Submit කිරීම (කෙලින්ම API එකට) ---
const certForm = document.getElementById('certificateForm');
    if (certForm) {
        certForm.addEventListener('submit', async (e) => {
            e.preventDefault();

            const user = JSON.parse(localStorage.getItem('loggedInUser'));

            const newReq = {
            id: Math.floor(1000 + Math.random() * 9000), // තාවකාලික ID එකක්
            certificate_type: document.getElementById('certType').value,
            submitted_date: new Date().toISOString(),
            status: 'Pending'
        };
            const formData = new FormData(certForm);

            formData.append('student_id', user.id);
            formData.append('student_name', user.full_name);
            formData.append('reg_number', user.registration_number);
            formData.append('program', user.program);
            formData.append('academic_year', user.academic_year);
            formData.append('email', user.email);
            formData.append('department', user.department);

            const selectedSpeedCard = document.querySelector('.speed-card.active');
            const speedValue = selectedSpeedCard ? selectedSpeedCard.querySelector('h4').innerText : 'Standard';
            formData.append('speed', speedValue);

            // --- Certificate Form එක Submit කරන තැන (පේළි 204 අවට) ---
            const semesterSelect = document.getElementById('semesterSelect'); // HTML එකේ id එක මෙහෙම නම්
            if (semesterSelect) {
            formData.append('semester_details', semesterSelect.value);
             }

            try {
                const response = await fetch('http://localhost:3000/api/submit-request', {
                    method: 'POST',
                    body: formData
                });
                
            const result = await response.json();

            if (response.ok) {
                alert("✅ Success! Your Request ID is: #REQ-" + result.requestId);
                certForm.reset();
                
               // Table එක update කරලා My Requests section එක පෙන්වන්න
            if (typeof loadDashboardData === 'function') { 
                await loadDashboardData(); 
            }
            
                // Dashboard එකට මාරු වීම
                showSection('my-requests');
            } else {
                alert("❌ Submission failed: " + (result.message || "Unknown error"));
            }
        } catch (error) {
            console.error("Error:", error);
            alert("❌ Server connection error! Make sure backend is running.");
        }
        });
    }

loadDashboardData();

    // --- 1. Page Navigation ---
    window.showSection = function(sectionId, element) {
        document.querySelectorAll('.content-section').forEach(s => s.style.display = 'none');
        const activeSection = document.getElementById(sectionId);

        if (activeSection) activeSection.style.display = 'block';
        document.querySelectorAll('.nav-item').forEach(item => item.classList.remove('active'));
        if (element) element.classList.add('active');

        if (sectionId === 'dashboard' || sectionId === 'my-requests') {
            loadDashboardData(); // Dashboard හෝ My Requests වලට යන විට දත්ත Update කිරීම
        }
        if (sectionId === 'notif-page') {
        loadNotifications(); 
        }
    };

    // --- 5. Certificate Form Submission is already handled above ---

    // --- 11. File Upload Preview Handling ---
    const fileInput = document.getElementById('file-upload');
    const fileDisplay = document.getElementById('file-name-display');
    const fileNameSpan = document.getElementById('file-name');
    const dropZone = document.getElementById('drop-zone');

    if(fileInput) {
        fileInput.onchange = () => {
            if (fileInput.files.length > 0) {
                fileNameSpan.innerText = fileInput.files[0].name;
                fileDisplay.style.display = 'flex';
                dropZone.style.display = 'none';
            }
        };
    }

    window.removeFile = function() {
        if(fileInput) fileInput.value = "";
        if(fileDisplay) fileDisplay.style.display = 'none';
        if(dropZone) dropZone.style.display = 'flex';
    };

    window.selectSpeed = function(element) {
        document.querySelectorAll('.speed-card').forEach(card => card.classList.remove('active'));
        element.classList.add('active');
    };

// --- Preview & Download Logic ---
    async function loadCertificates() {
        const userData = localStorage.getItem('loggedInUser');
        if (!userData) return;
        const user = JSON.parse(userData);

        try {
            const response = await fetch(`http://localhost:3000/api/certificates/${user.registration_number}`);
            const certs = await response.json();

            if (certs && certs.length > 0) {
                const degreeCert = certs.find(c => c.type === 'Degree' || c.certificate_type === 'Degree');
                if (degreeCert) {
                    const previewBtn = document.querySelector('.preview-btn');
                    if (previewBtn) {
                        previewBtn.onclick = (e) => {
                            e.preventDefault();
                            const studentName = user.full_name || "Student";
                            window.open(`view-certificate.html?name=${encodeURIComponent(studentName)}`, '_blank');
                        };
                    }

                    const downloadBtn = document.querySelector('.download-btn');
                    if (downloadBtn) {
                        downloadBtn.href = `http://localhost:3000/${degreeCert.file_path}`;
                        downloadBtn.setAttribute('download', 'Degree_Certificate.pdf');
                    }
                }
            }
        } catch (error) {
            console.error("Error loading certificates:", error);
        }
    }

    // --- 12. Tracking System Logic ---
    const trackBtn = document.getElementById('trackBtn');
    const trackIdInput = document.getElementById('trackIdInput');
    const trackingResult = document.getElementById('trackingResult');

    if (trackBtn) {
        trackBtn.addEventListener('click', async () => {
            const rawId = trackIdInput.value.trim();
            const requestId = rawId.replace(/\D/g, "")
            
            if (!requestId) {
                alert("Please enter a valid Request ID.");
                return;
            }

            try {
                const response = await fetch(`http://localhost:3000/api/track/${requestId}`);
                const data = await response.json();

                if (response.ok) {
                   if (trackingResult) trackingResult.style.display = 'block';
                   const displayTrackId = document.getElementById('displayTrackId');
                   if (displayTrackId) displayTrackId.innerText = `#REQ-${data.id}`;

                    renderTimeline(data.steps);

                } else {
                    alert("No records found for this Request ID.");
                    if (trackingResult) trackingResult.style.display = 'none';
                }

            } catch (error) {
                alert("Unable to connect to the server.");
            }
        });
    }

    function renderTimeline(steps) {
        const container = document.querySelector('.timeline-container');
        if(!container) return;
        container.innerHTML = '';// කලින් තිබුණු Timeline දත්ත මකා දැමීම

        steps.forEach(step => {
            let statusClass = '';
            let iconClass = 'fas fa-circle';

            if (step.status === 'completed') {
                statusClass = 'completed';
                iconClass = 'fas fa-check';

            } else if (step.status === 'active') {
                statusClass = 'active';
                iconClass = 'fas fa-spinner fa-spin';

            } else {
                statusClass = 'pending-step';
            }

            container.innerHTML += `
                <div class="timeline-item ${statusClass}">
                    <div class="timeline-icon"><i class="${iconClass}"></i></div>
                    <div class="timeline-content">
                        <h4>${step.title}</h4>
                        <p>${step.description || ''}</p>
                        ${step.date ? `<span class="time">${step.date}</span>` : ''}
                    </div>
                </div>`;
        });
    }

    // --- 13. Dynamic Certificate Download Logic ---

window.loadIssuedCertificates = async function() {
    const user = JSON.parse(localStorage.getItem('loggedInUser'));
    if (!user) return;

    try {
        // Backend එකෙන් මේ ශිෂ්‍යයාට අදාළ 'Issued' සහතික ටික ගන්නවා
        const response = await fetch(`http://localhost:3000/api/student/issued-certificates/${user.id}`);
        const certificates = await response.json();
        const gridContainer = document.getElementById('dynamic-download-grid');

        if (!gridContainer) return;
        gridContainer.innerHTML = ''; // කලින් තිබුණු දේවල් අයින් කරනවා

        if (certificates.length === 0) {
            gridContainer.innerHTML = '<p style="grid-column: 1/-1; text-align: center; padding: 40px; color: #666;">No issued certificates available yet.</p>';
            return;

        }
        certificates.forEach(cert => {
       console.log("Certificate Data:", cert); // මේකෙන් බලන්න පුළුවන් file_name එක හරියට එනවද කියලා
    // ... ඉතිරි කෝඩ් එක ..


            // සහතිකය 'Locked' ද නැද්ද කියලා බලනවා (උදා: සල්ලි ගෙවලා නැත්නම්)

            const isLocked = cert.payment_status !== 'Paid';
            const cardHTML = `
                <div class="card download-card ${isLocked ? 'locked-card' : ''}">
                    <div class="doc-icon ${isLocked ? 'bg-red' : 'bg-blue'}">
                        <i class="fas ${isLocked ? 'fa-lock' : 'fa-file-pdf'}"></i>
                    </div>
                    <div class="doc-info">
                        <h3>${cert.certificate_type}</h3>
                        <p>${isLocked ? 'Status: Payment Pending' : 'Issued: ' + new Date(cert.updated_at).toLocaleDateString()}</p>
                        <span class="doc-size">${isLocked ? 'Action Required' : 'PDF • Ready to Download'}</span>
                    </div>
                    <div class="doc-actions">
                        ${isLocked ? `
                            <button class="action-btn btn-secondary" disabled style="width: 100%; opacity: 0.7;">
                                <i class="fas fa-ban"></i> Locked
                            </button>
                        ` : `
                            <button class="action-btn btn-outline preview-btn" onclick="window.open('http://localhost:3000/uploads/${cert.file_name}', '_blank')">
                                <i class="fas fa-eye"></i> View
                            </button>
                            <a href="http://localhost:3000/api/download/${cert.file_name}" class="action-btn btn-primary download-btn" style="text-decoration: none; text-align: center;">
                                <i class="fas fa-download"></i> Download
                            </a>
                        `}
                    </div>
                </div> `;
            gridContainer.innerHTML += cardHTML;
        });

    } catch (error) {
        console.error("Error fetching certificates:", error);
    }

    
}

// මේ පේළිය DOMContentLoaded එක ඇතුළේ අන්තිමට දාන්න
loadIssuedCertificates();
})
// පෑස්සීම අවසන් (DOMContentLoaded close)