function logoutUser() {
    if (confirm("Are you sure you want to logout?")) {
        localStorage.clear(); 
        window.location.href = 'home.html'; 
    }
}

async function submitClearance(requestId, studentId) {
    const data = {
        student_id: studentId,
        library: document.getElementById(`lib-${requestId}`).checked ? 1 : 0,
        hostel: document.getElementById(`hostel-${requestId}`).checked ? 1 : 0,
        others: document.getElementById(`fees-${requestId}`).checked ? 1 : 0,
        remarks: document.getElementById(`rem-${requestId}`).value
    };

    if(!confirm("Are you sure you want to update this clearance?")) return;

    try {
        const response = await fetch(`http://localhost:3000/api/staff/update-clearance/${requestId}`, {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify(data)
        });

        const result = await response.json();
        if (result.success) {
            alert("Updated Successfully! Status: " + result.status);
            loadStaffRequests(); 
        }
    } catch (error) {
        alert("Error updating record!");
    }
}

function closeModal() {
    const modal = document.getElementById('reviewModal');
    if (modal) modal.style.display = 'none';
}

function handleAction(status) {
    const student = document.getElementById('modalStudentName').innerText;
    if(status === 'Approved') {
        alert(`Success! ${student}'s certificate has been approved and moved to issued list.`);
    } else {
        alert(`Request for ${student} has been rejected.`);
    }
    closeModal();
}

document.addEventListener("DOMContentLoaded", () => {
    
    showSection('dashboard', document.querySelector('.nav-item'));
    loadStaffRequests();

    window.filterTable = function(inputElement) {
        let searchTerm = inputElement.value.toLowerCase();
        let activeSection = document.querySelector('.content-section.active-section');
        let rows = activeSection.querySelectorAll('table tbody tr');

        rows.forEach(row => {
            row.style.display = row.innerText.toLowerCase().includes(searchTerm) ? "" : "none";
            });
        }
    });


function showSection(sectionId, element) {
    const sections = document.querySelectorAll('.content-section');
    sections.forEach(section => {
        section.style.display = 'none';
        section.classList.remove('active-section');
    });

    let finalId = (sectionId === 'dashboard') ? 'dashboard-section' : sectionId;
    const targetSection = document.getElementById(finalId);
    
    if (targetSection) {
        targetSection.style.display = 'block';
        targetSection.classList.add('active-section');
    }

    const navItems = document.querySelectorAll('.nav-item');
    navItems.forEach(item => item.classList.remove('active'));
    if (element) element.classList.add('active');


    if(sectionId === 'request') loadStaffRequests();
}


async function loadStaffRequests() {
    try {
        const response = await fetch('http://localhost:3000/api/staff/requests');
        if (!response.ok) throw new Error('API connection failed');
        
        const requests = await response.json(); 
        const semesterTable = document.getElementById('semester-pending-body');
        const degreeTable = document.getElementById('degree-pending-body');
        const countText = document.getElementById('request-count');
        
        if (!semesterTable || !degreeTable) return;
        
        semesterTable.innerHTML = '';
        degreeTable.innerHTML = '';
        let pendingCount = 0;

        requests.forEach(req => {
            pendingCount++; 
            if (req.certificate_type === 'Semester Result Sheet') {
                semesterTable.innerHTML += `
                    <tr>
                        <td><strong>${req.student_name}</strong><br><small>${req.reg_number}</small></td>
                        <td>${req.index_number || 'N/A'}</td>
                        <td>${req.semester_details || 'N/A'}</td>
                        <td>${new Date(req.submitted_date).toLocaleDateString()}</td>
                        <td><span class="status-pill pending">${req.status}</span></td>
                        <td><button class="btn-review" onclick="reviewSemester(${req.id})"><i class="fas fa-eye"></i> Review</button></td>
                        
                    </tr>`;
            } 
            else if (req.certificate_type === 'Degree Certificate') {
                degreeTable.innerHTML += `
                    <tr>
                        <td><strong>${req.student_name}</strong><br><small>${req.reg_number}</small></td>
                        <td>${req.effective_date || 'N/A'}</td>
                        <td>${req.gpa || 'N/A'}</td>
                        <td><i class="fas ${req.library_clearance ? 'fa-check-circle' : 'fa-times-circle'}" style="color:${req.library_clearance ? '#059669':'#ef4444'}"></i></td>
                        <td><i class="fas ${req.hostel_clearance ? 'fa-check-circle' : 'fa-times-circle'}" style="color:${req.hostel_clearance ? '#059669':'#ef4444'}"></i></td>
                        <td><i class="fas ${req.fees_clearance ? 'fa-check-circle' : 'fa-times-circle'}" style="color:${req.fees_clearance ? '#059669':'#ef4444'}"></i></td>
                        <td><button class="btn-review" onclick="reviewDegree(${req.id})"><i class="fas fa-graduation-cap"></i> Review</button></td>
                    </tr>`;
            }
        });

        if(countText) countText.innerText = `Total Pending: ${pendingCount}`;

    } catch (error) {
        console.error("Fetch Error:", error);
    }
}

let selectedRequestId = null;

function closeSemesterModal() {
    document.getElementById('semesterModal').style.display = 'none';
}

async function updateSemesterStatus(action) {
    if(!confirm(`Are you sure you want to ${action}?`)) return;

    try {
        const response = await fetch('http://localhost:3000/api/requests/update-status', {
            method: 'PUT',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify({ id: selectedRequestId, action: action })
        });
        
        if (response.ok) {
            alert("Success!");
            closeSemesterModal();
            loadStaffRequests();
        }
    } catch (err) { alert("Update failed"); }
}

function logoutUser() {
    if (confirm("Logout?")) {
        localStorage.clear();
        window.location.href = 'login.html';
    }
}

function reviewDegree(id) { alert("Degree clearance feature coming soon for ID: " + id); }
   
/*// --- REVIEW MODAL LOGIC ---
    document.addEventListener('click', function(e) {
        const btn = e.target.closest('.btn-review, .action-btn');
        if (btn) {
            if (btn.innerText.includes("Update")) return; 
            if (btn.innerText.includes("Export Report")) {
                let dateObj = new Date();
                let dateStr = dateObj.getFullYear() + "-" + (dateObj.getMonth()+1) + "-" + dateObj.getDate();
                exportTableToCSV(`EUSL_Issued_Certificates_${dateStr}.csv`);
                return;
            }

            const row = btn.closest('tr');
            if (row && document.getElementById('reviewModal')) {
                const name = row.cells[0].innerText.trim();
                const cert = row.cells[2].innerText.trim();
                
                document.getElementById('modalStudentName').innerText = name;
                document.getElementById('modalCertType').innerText = cert;
                document.getElementById('reviewModal').style.display = 'block';
            }
        }
    });*/

    window.onclick = function(event) {
        const modal = document.getElementById('reviewModal');
        if (event.target == modal) {
            closeModal();
        }
    }
;

function exportTableToCSV(filename) {
    let activeSection = document.querySelector('.active-section');
    let table = activeSection.querySelector('table');
    if (!table) return;

    let csv = [];
    let rows = table.querySelectorAll("tr");
    for (let i = 0; i < rows.length; i++) {
        let row = [], cols = rows[i].querySelectorAll("td, th");
        for (let j = 0; j < cols.length; j++) {
            let data = cols[j].innerText.replace(/(\r\n|\n|\r)/gm, " ").trim();
            row.push('"' + data + '"'); 
        }
        csv.push(row.join(","));
    }
    downloadCSV(csv.join("\n"), filename);
}

function downloadCSV(csv, filename) {
    let csvFile = new Blob([csv], {type: "text/csv"});
    let downloadLink = document.createElement("a");
    downloadLink.download = filename;
    downloadLink.href = window.URL.createObjectURL(csvFile);
    downloadLink.style.display = "none";
    document.body.appendChild(downloadLink);
    downloadLink.click();
}


document.querySelectorAll('.settings-card button').forEach(btn => {
    btn.addEventListener('click', function() {
        alert("Settings successfully updated!");
    });
});


function closeModal() {
    document.getElementById('semesterModal').style.display = 'none';
    document.getElementById('degreeModal').style.display = 'none';
}

async function loadStaffRequests() {
    try {
        const response = await fetch('http://localhost:3000/api/staff/requests');
        if (!response.ok) throw new Error('API connection failed');
        
        const requests = await response.json(); 
        const semesterTable = document.getElementById('semester-pending-body');
        const degreeTable = document.getElementById('degree-pending-body');
        const countText = document.getElementById('request-count');
        
        if (!semesterTable || !degreeTable) return;
        
        semesterTable.innerHTML = '';
        degreeTable.innerHTML = '';
        let pendingCount = 0;

        requests.forEach(req => {

            if (req.status !== 'Pending') return;
            
            pendingCount++; 
            if (req.certificate_type === 'Semester Result Sheet') {
                semesterTable.innerHTML += `
                    <tr>
                        <td><strong>${req.student_name}</strong><br><small>${req.reg_number}</small></td>
                        <td>${req.index_number || 'N/A'}</td>
                        <td>${req.semester_details || 'N/A'}</td>
                        <td>${new Date(req.submitted_date).toLocaleDateString()}</td>
                        <td><span class="status-pill pending">${req.status}</span></td>
                        <td><button class="btn-review" onclick="reviewSemester(${req.id})"><i class="fas fa-eye"></i> Review</button></td>
                    </tr>`;
            } 
            else if (req.certificate_type === 'Degree Certificate') {
                degreeTable.innerHTML += `
                    <tr>
                        <td><strong>${req.student_name}</strong><br><small>${req.reg_number}</small></td>
                        <td>${req.effective_date || 'N/A'}</td>
                        <td>${req.gpa || 'N/A'}</td>
                        <td><i class="fas ${req.library_clearance ? 'fa-check-circle' : 'fa-times-circle'}" style="color:${req.library_clearance ? '#059669':'#ef4444'}"></i></td>
                        <td><i class="fas ${req.hostel_clearance ? 'fa-check-circle' : 'fa-times-circle'}" style="color:${req.hostel_clearance ? '#059669':'#ef4444'}"></i></td>
                        <td><i class="fas ${req.fees_clearance ? 'fa-check-circle' : 'fa-times-circle'}" style="color:${req.fees_clearance ? '#059669':'#ef4444'}"></i></td>
                        <td><button class="btn-review" onclick="reviewDegree(${req.id})"><i class="fas fa-graduation-cap"></i> Review</button></td>
                    </tr>`;
            }
        });
        if(countText) countText.innerText = `Total Pending: ${pendingCount}`;
    } catch (error) {
        console.error("Fetch Error:", error);
    }
}


async function reviewSemester(requestId) {
    selectedRequestId = requestId; 
    try {
        const response = await fetch(`http://localhost:3000/api/staff/request-details/${requestId}`);
        const data = await response.json();
        const container = document.getElementById('semesterDetails');
        if (container) {
            container.innerHTML = `
                <div style="background: #f8fafc; padding: 15px; border-radius: 8px; border-left: 4px solid #2563eb;">
                    <p><strong>Student:</strong> ${data.student_name}</p>
                    <p><strong>Reg No:</strong> ${data.reg_number}</p>
                    <p><strong>Index No:</strong> ${data.index_number }</p>
                    <p><strong>Semester:</strong> ${data.Requested_Semester }</p>
                    <p><strong>Status:</strong> <span class="status-badge">${data.status}</span></p>
                </div>`;
            document.getElementById('semesterModal').style.display = 'block';
            checkFinalApproval(); 
        }
    } catch (error) { alert("Error loading semester details!"); }
}


async function reviewDegree(requestId) {
    selectedRequestId = requestId; 
    try {
        const response = await fetch(`http://localhost:3000/api/staff/request-details/${requestId}`);
        const data = await response.json();
        const container = document.getElementById('degreeDetails'); 
        if (container) {
            container.innerHTML = `
                <div style="background: #f0fdf4; padding: 15px; border-radius: 8px; border-left: 4px solid #16a34a;">
                    <p><strong>Student:</strong> ${data.student_name}</p>
                    <p><strong>Reg No:</strong> ${data.reg_number}</p>
                    <p><strong>Effective Date:</strong> ${data.effective_date}</p>
                    <p><strong>status:</strong> <span class="status-badge">${data.status}</span></p>
                    <p><strong>Docs:</strong> ${data.document_path ? `<a href="/uploads/${data.document_path}" target="_blank">View</a>` : 'None'}</p>
                </div>`;
            document.getElementById('degreeModal').style.display = 'block';
            checkFinalApproval(); 
        }
    } catch (error) { alert("Error loading degree details!"); }
}

async function verifyLevel(role) {
    if (!selectedRequestId) {
        alert("Request ID not found!");
        return;
    }
    const clickedButton = event.target;

    let backendAuthority = "";
    if (role ===  'subwarden') backendAuthority = 'SubWarden';
    else if (role ===  'warden') backendAuthority = 'Warden';
    else if (role ===  'library') backendAuthority = 'Library';
    else if (role === 'student-affairs') backendAuthority = 'StudentAffairs';

     if (role === 'staff' ) backendAuthority = 'OfficeStaff';
    else if (role === 'hod') backendAuthority = 'HOD';
    else if (role === 'dean') backendAuthority = 'Dean';
    else if (role === 'rector') backendAuthority = 'Rector';

    if (!backendAuthority) {
        console.error("Invalid Role provided:", role);
        return;
    }

    try {
        const response = await fetch('/api/update-authority-status', {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify({
                requestId: selectedRequestId,
                authority: backendAuthority,
                status: 'Approved'
            })
        });

        const data = await response.json();

        if (data.success) {
            const statusLabel = document.getElementById(`${role}-status`);
            if (statusLabel) {
                statusLabel.innerText = "Approved";
                statusLabel.classList.remove('pending');
                statusLabel.className= "status-badge approved";
                statusLabel.style.backgroundColor = "#d4edda"; 
                statusLabel.style.color = "#155724"; 
            }
            
            if (window.event && window.event.target) { window.event.target.style.display = 'none';}
            checkFinalApproval(); 
        } else {
            alert("Failed to update status: " + data.message);
        }
    } catch (error) {
        console.error("❌ Error updating status:", error);
        alert("Network error. Please try again.");
    }
}
function checkFinalApproval() {
    const s = document.getElementById('staff-status')?.innerText === 'Approved';
    const h = document.getElementById('hod-status')?.innerText === 'Approved';
    const d = document.getElementById('dean-status')?.innerText === 'Approved';
    const r = document.getElementById('rector-status')?.innerText === 'Approved';

    const forwardBtnSemester = document.getElementById('forwardARBtn');
    if (forwardBtnSemester) {
        forwardBtnSemester.disabled = !(s && h && d && r);
        forwardBtnSemester.style.opacity = forwardBtnSemester.disabled ? "0.5" : "1";
    }

    const sub = document.getElementById('subwarden-status')?.innerText === 'Approved';
    const ward = document.getElementById('warden-status')?.innerText === 'Approved';
    const lib = document.getElementById('library-status')?.innerText === 'Approved';
    const stAff = document.getElementById('student-affairs-status')?.innerText === 'Approved';

    const forwardBtnDegree = document.getElementById('forwardARBtn_Degree');
    if (forwardBtnDegree) {
        forwardBtnDegree.disabled = !(sub && ward && lib && stAff);
        forwardBtnDegree.style.opacity = forwardBtnDegree.disabled ? "0.5" : "1";
    }
}


async function forwardToAR() {
    if (!selectedRequestId) return;
    if (!confirm("Forward this request to AR?")) return;
       
    try {
        const response = await fetch(`http://localhost:3000/api/staff/update-status/${selectedRequestId}`, {
            method: 'PUT',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify({ status: 'Forwarded to AR' })
        });

        if (response.ok) {
            alert("Success!");
            closeModal();
            loadStaffRequests();
        }
    } catch (error) { alert("Failed to forward."); }
}